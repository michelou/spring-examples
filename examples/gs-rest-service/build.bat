@echo off
setlocal enabledelayedexpansion

set _DEBUG=0

@rem #########################################################################
@rem ## Environment setup

set _EXITCODE=0

call :env
if not %_EXITCODE%==0 goto end

call :args %*
if not %_EXITCODE%==0 goto end

@rem #########################################################################
@rem ## Main

if %_HELP%==1 (
    call :help
    exit /b !_EXITCODE!
)
for %%i in (%_COMMANDS%) do (
    call :%%i
    if not !_EXITCODE!==0 goto end
)
goto end

@rem #########################################################################
@rem ## Subroutines

@rem output parameters: _DEBUG_LABEL, _ERROR_LABEL, _WARNING_LABEL
@rem                    _CURL_CMD, _JAVA_CMD, _JAVAC_CMD, _MVN_CMD
:env
set _BASENAME=%~n0
set "_ROOT_DIR=%~dp0"
set _TIMER=0

call :env_colors
set _DEBUG_LABEL=%_NORMAL_BG_CYAN%[%_BASENAME%]%_RESET%
set _ERROR_LABEL=%_STRONG_FG_RED%Error%_RESET%:
set _WARNING_LABEL=%_STRONG_FG_YELLOW%Warning%_RESET%:

set "_SOURCE_DIR=%_ROOT_DIR%src"
set "_TARGET_DIR=%_ROOT_DIR%target"
set "_CLASSES_DIR=%_TARGET_DIR%\classes"
set "_TEST_CLASSES_DIR=%_TARGET_DIR%\test-classes"

if not exist "%JAVA_HOME%\bin\javac.exe" (
    echo %_ERROR_LABEL% Java SDK installation not found 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_JAVA_CMD=%JAVA_HOME%\bin\java.exe"
set "_JAVAC_CMD=%JAVA_HOME%\bin\javac.exe"

if not exist "%MAVEN_HOME%\bin\mvn.cmd" (
    echo %_ERROR_LABEL% Maven installation not found 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_MVN_CMD=%MAVEN_HOME%\bin\mvn.cmd"

if not exist "%GIT_HOME%\mingw64\bin\curl.exe" (
     echo %_ERROR_LABEL% Git installation not found 1>&2
     set _EXITCODE=1
     goto :eof
)
set "_CURL_CMD=%GIT_HOME%\mingw64\bin\curl.exe"

set _PYTHON_CMD=
if exist "%PYTHON_HOME%\python.exe" (
    set "_PYTHON_CMD=%PYTHON_HOME%\python.exe"
)
goto :eof

:env_colors
@rem ANSI colors in standard Windows 10 shell
@rem see https://gist.github.com/mlocati/#file-win10colors-cmd
set _RESET=[0m
set _BOLD=[1m
set _UNDERSCORE=[4m
set _INVERSE=[7m

@rem normal foreground colors
set _NORMAL_FG_BLACK=[30m
set _NORMAL_FG_RED=[31m
set _NORMAL_FG_GREEN=[32m
set _NORMAL_FG_YELLOW=[33m
set _NORMAL_FG_BLUE=[34m
set _NORMAL_FG_MAGENTA=[35m
set _NORMAL_FG_CYAN=[36m
set _NORMAL_FG_WHITE=[37m

@rem normal background colors
set _NORMAL_BG_BLACK=[40m
set _NORMAL_BG_RED=[41m
set _NORMAL_BG_GREEN=[42m
set _NORMAL_BG_YELLOW=[43m
set _NORMAL_BG_BLUE=[44m
set _NORMAL_BG_MAGENTA=[45m
set _NORMAL_BG_CYAN=[46m
set _NORMAL_BG_WHITE=[47m

@rem strong foreground colors
set _STRONG_FG_BLACK=[90m
set _STRONG_FG_RED=[91m
set _STRONG_FG_GREEN=[92m
set _STRONG_FG_YELLOW=[93m
set _STRONG_FG_BLUE=[94m
set _STRONG_FG_MAGENTA=[95m
set _STRONG_FG_CYAN=[96m
set _STRONG_FG_WHITE=[97m

@rem strong background colors
set _STRONG_BG_BLACK=[100m
set _STRONG_BG_RED=[101m
set _STRONG_BG_GREEN=[102m
set _STRONG_BG_YELLOW=[103m
set _STRONG_BG_BLUE=[104m
goto :eof

@rem input parameter: %*
@rem output parameters: _COMMANDS, _DEBUG, _TIMER, _VERBOSE
:args
set _COMMANDS=
set _HELP=0
set _TIMER=0
set _VERBOSE=0
set __N=0
:args_loop
set "__ARG=%~1"
if not defined __ARG (
    if !__N!==0 set _HELP=1
    goto args_done
)
if "%__ARG:~0,1%"=="-" (
    @rem option
    if "%__ARG%"=="-debug" ( set _DEBUG=1
    ) else if "%__ARG%"=="-help" ( set _HELP=1
    ) else if "%__ARG%"=="-timer" ( set _TIMER=1
    ) else if "%__ARG%"=="-verbose" ( set _VERBOSE=1
    ) else (
        echo %_ERROR_LABEL% Unknown option "%__ARG%" 1>&2
        set _EXITCODE=1
        goto args_done
    )
) else (
    @rem subcommand
    if "%__ARG%"=="help" ( set _HELP=1
    ) else if "%__ARG%"=="clean" ( set _COMMANDS=!_COMMANDS! clean
    ) else if "%__ARG%"=="run" ( set _COMMANDS=!_COMMANDS! start run
    ) else if "%__ARG%"=="start" ( set _COMMANDS=!_COMMANDS! start
    ) else if "%__ARG%"=="stop" ( set _COMMANDS=!_COMMANDS! stop
    ) else if "%__ARG%"=="test" ( set _COMMANDS=!_COMMANDS! test
    ) else (
        echo %_ERROR_LABEL% Unknown subcommand "%__ARG%" 1>&2
        set _EXITCODE=1
        goto args_done
    )
    set /a __N+=1
)
shift
goto :args_loop
:args_done
set _STDOUT_REDIRECT=1^>NUL
if %_DEBUG%==1 set _STDOUT_REDIRECT=1^>CON

for %%i in ("%~dp0\.") do set _PROJECT_NAME=%%~ni
set _SERVER_PROC_NAME=%_PROJECT_NAME%

if %_DEBUG%==1 (
    echo %_DEBUG_LABEL% Options    : _TIMER=%_TIMER% _VERBOSE=%_VERBOSE% 1>&2
    echo %_DEBUG_LABEL% Subcommands: _COMMANDS=%_COMMANDS% 1>&2
    echo %_DEBUG_LABEL% Variables  : "GIT_HOME=%GIT_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : "GRADLE_HOME=%GRADLE_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : "JAVA_HOME=%JAVA_HOME%" 1>&2
    if defined PYTHON_HOME echo %_DEBUG_LABEL% Variables  : "PYTHON_HOME=%PYTHON_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : _SERVER_PROC_NAME=%_SERVER_PROC_NAME% 1>&2
)
if %_TIMER%==1 for /f "delims=" %%i in ('powershell -c "(Get-Date)"') do set _TIMER_START=%%i
goto :eof

:help
if %_VERBOSE%==1 (
    set __BEG_P=%_STRONG_FG_CYAN%
    set __BEG_O=%_STRONG_FG_GREEN%
    set __BEG_N=%_NORMAL_FG_YELLOW%
    set __END=%_RESET%
) else (
    set __BEG_P=
    set __BEG_O=
    set __BEG_N=
    set __END=
)
echo Usage: %__BEG_O%%_BASENAME% { ^<option^> ^| ^<subcommand^> }%__END%
echo.
echo   %__BEG_P%Options:%__END%
echo     %__BEG_O%-debug%__END%      print commands executed by this script
echo     %__BEG_O%-timer%__END%      print total execution time
echo     %__BEG_O%-verbose%__END%    print progress messages
echo.
echo   %__BEG_P%Subcommands:%__END%
echo     %__BEG_O%clean%__END%       delete generated files
echo     %__BEG_O%help%__END%        print this help message
echo     %__BEG_O%run%__END%         run the client ^(cURL requests^)
echo     %__BEG_O%start%__END%       start Spring server
echo     %__BEG_O%stop%__END%        stop Spring server
echo     %__BEG_O%test%__END%        execute test suite ^(JUnit 5^)
goto :eof

:clean
call :rmdir "%_TARGET_DIR%"
goto :eof

@rem input parameter: %1=directory path
:rmdir
set "__DIR=%~1"
if not exist "%__DIR%\" goto :eof
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% rmdir /s /q "%__DIR%" 1>&2
) else if %_VERBOSE%==1 ( echo Delete directory "!__DIR:%_ROOT_DIR%=!" 1>&2
)
rmdir /s /q "%__DIR%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to delete directory "!__DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:compile
if not exist "%_CLASSES_DIR%" mkdir "%_CLASSES_DIR%"

call :libs_cpath
if not %_EXITCODE%==0 goto :eof

set "__OPTS_FILE=%_TARGET_DIR%\javac_opts.txt"
set "__CPATH=%_LIBS_CPATH%%_CLASSES_DIR%"
echo -classpath "%__CPATH:\=\\%" -d "%_CLASSES_DIR:\=\\%" > "%__OPTS_FILE%"

set "__SOURCES_FILE=%_TARGET_DIR%\javac_sources.txt"
if exist "%__SOURCES_FILE%" del "%__SOURCES_FILE%" 1>NUL
set __N=0
for /f "delims=" %%f in ('dir /s /b "%_SOURCE_DIR%\main\java\*.java" 2^>NUL') do (
    echo %%f >> "%__SOURCES_FILE%"
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Java source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Java source file
) else ( set __N_FILES=%__N% Java source files
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% to directory "!_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
)
call "%_JAVAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% to directory "!_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem output parameter: _LIBS_CPATH
:libs_cpath
for /f "delims=" %%f in ("%~dp0\.") do set "__BATCH_FILE=%%~dpfcpath.bat"
if not exist "%__BATCH_FILE%" (
    echo %_ERROR_LABEL% Batch file "%__BATCH_FILE%" not found 1>&2
    set _EXITCODE=1
    goto :eof
)
if %_DEBUG%==1 echo %_DEBUG_LABEL% "%__BATCH_FILE%" %_DEBUG% 1>&2
call "%__BATCH_FILE%" %_DEBUG%
set "_LIBS_CPATH=%_CPATH%"
goto :eof

@rem input paramater: %1=process name
@rem output parameters: _IMAGE_NAME, _PID
:pid
set __PROC_NAME=%~1
set __FILTERS=/FI "SESSIONNAME eq Console" /FI "WINDOWTITLE eq %__PROC_NAME%*"

set _IMAGE_NAME=
set _PID=
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% tasklist /NH %__FILTERS% 1>&2
) else if %_VERBOSE%==1 ( echo Search for server process with name "%__PROC_NAME%" 1>&2
)
for /f "usebackq tokens=1,2,*" %%i in (`tasklist /NH %__FILTERS%`) do (
    set "_IMAGE_NAME=%%i"
    set "_PID=%%j"
)
if /i "%_IMAGE_NAME:~0,4%"=="INFO" (
    set _IMAGE_NAME=
    set _PID=
)
if %_DEBUG%==1 echo %_DEBUG_LABEL% __PROC_NAME=%__PROC_NAME% _IMAGE_NAME=%_IMAGE_NAME% _PID=%_PID% 1>&2
goto :eof

:start
@rem check if the server is already running
call :pid "%_SERVER_PROC_NAME%"
if defined _PID goto :eof

set __MVN_OPTS=
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% start "%_SERVER_PROC_NAME%" "%_MVN_CMD%" %__MVN_OPTS% spring-boot:run 1>&2
) else if %_VERBOSE%==1 ( echo Start server process "%_SERVER_PROC_NAME%" 1>&2
)
start "%_SERVER_PROC_NAME%" "%_MVN_CMD%" %__MVN_OPTS% spring-boot:run
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to start server process "%_SERVER_PROC_NAME%" 1>&2
    set _EXITCODE=1
    goto :eof
)
timeout /t 5 /nobreak 1>NUL
goto :eof

:stop
@rem check if the server is up and running
call :pid "%_SERVER_PROC_NAME%"
if not defined _PID (
    if %_VERBOSE%==1 echo No server process "%_SERVER_PROC_NAME%" found 1>&2
    goto :eof
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% taskkill /pi "%_PID%" 1>&2
) else if %_VERBOSE%==1 ( echo Stop server process "%_SERVER_PROC_NAME%" 1>&2
)
taskkill /pid "%_PID%" %_STDOUT_REDIRECT%
if not %ERRORLEVEL%==0 (
    echo %_WARNING_LABEL% Failed to stop server process "%_SERVER_PROC_NAME%" 1>&2
)
goto :eof

:run
set __SERVER_HOST=localhost
set __SERVER_PORT=8080
if exist "%_SOURCE_DIR%\main\resources\application.properties" (
    for /f "delims=" %%i in (%_SOURCE_DIR%\main\resources\application.properties) do (
        set "__LINE=%%i"
        if "!__LINE:~0,12!"=="server.host=" ( set "__SERVER_HOST=!__LINE:~12!"
        ) else if "!__LINE:~0,12!"=="server.port=" ( set "__SERVER_PORT=!__LINE:~12!"
        )
    )
)
set __URL=http://localhost:%__SERVER_PORT%/greeting
set __N_ATTEMPTS=0
:run_ping
if %__N_ATTEMPTS% LEQ 3 (
    call "%_CURL_CMD%" --silent -IL "%__URL%" 1>NUL
    if not !ERRORLEVEL!==0 (
        set /a __N_ATTEMPTS+=1
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Connection attempt !__N_ATTEMPTS! 1>&2
        @rem wait 10 seconds before next attempt
        timeout /t 10 /nobreak 1>NUL
        goto run_ping
    )
)
if defined _PYTHON_CMD ( set __FORMAT_JSON=^| "%_PYTHON_CMD%" -m json.tool
) else ( set __FORMAT_JSON=
)
if %_DEBUG%==1 ( set __CURL_OPTS=--get --verbose
) else ( set __CURL_OPTS=--get --silent
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_CURL_CMD%" %__CURL_OPTS% "%__URL%" 1>&2
) else if %_VERBOSE%==1 ( echo Execute request "%__URL%" to server "%_SERVER_PROC_NAME%" 1>&2
)
call "%_CURL_CMD%" %__CURL_OPTS% "%__URL%" %__FORMAT_JSON%
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to execute request "%__URL%" to server "%_SERVER_PROC_NAME%" 1>&2
    set _EXITCODE=1
    goto :eof
)
echo.
set "__URL2=http://localhost:%__SERVER_PORT%/greeting?name=John"

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_CURL_CMD%" %__CURL_OPTS% "%__URL2%" 1>&2
) else if %_VERBOSE%==1 ( echo Execute request "%__URL2%" to server "%_SERVER_PROC_NAME%" 1>&2
)
call "%_CURL_CMD%" %__CURL_OPTS% "%__URL2%" %__FORMAT_JSON%
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to execute request "%__URL2%" to server "%_SERVER_PROC_NAME%" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:run_browser
set __URL=http://localhost:8080/greeting

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% start "demo-client" "%__URL%" 1>&2
) else if %_VERBOSE%==1 ( echo Open URL in default browser 1>&2
)
start "demo-client" "%__URL%"
if not %ERRORLEVEL%==0 (
    set _EXITCODE=1
    goto :eof
)
goto :eof

:compile_test
if not exist "%_TEST_CLASSES_DIR%" mkdir "%_TEST_CLASSES_DIR%" 1>NUL

set "__TEST_TIMESTAMP_FILE=%_TEST_CLASSES_DIR%\.latest-build"

@rem all :action_required "%__TEST_TIMESTAMP_FILE%" "%_SOURCE_DIR%\test\java\*.java"
@rem if %_ACTION_REQUIRED%==0 goto :eof

set "__SOURCES_FILE=%_TARGET_DIR%\test_javac_sources.txt"
if exist "%__SOURCES_FILE%" del "%__SOURCES_FILE%" 1>NUL
set __N=0
for /f "delims=" %%i in ('dir /b /s "%_SOURCE_DIR%\test\java\*.java" 2^>NUL') do (
    echo %%i >> "%__SOURCES_FILE%"
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Java test source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Java test source file
) else ( set __N_FILES=%__N% Java test source files
)
call :libs_cpath
if not %_EXITCODE%==0 goto :eof

set "__OPTS_FILE=%_TARGET_DIR%\test_javac_opts.txt"
set "__CPATH=%_LIBS_CPATH%%_CLASSES_DIR%;%_TEST_CLASSES_DIR%"
echo -classpath "%__CPATH:\=\\%" -d "%_TEST_CLASSES_DIR:\=\\%" > "%__OPTS_FILE%"

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% to directory "!_TEST_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
)
call "%_JAVAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% to directory "!_TEST_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
echo. > "%__TEST_TIMESTAMP_FILE%"
goto :eof

:test
call :compile_test
if not %_EXITCODE%==0 goto :eof

call :libs_cpath
if not %_EXITCODE%==0 goto :eof

set __TEST_JAVA_OPTS=-classpath "%_LIBS_CPATH%%_CLASSES_DIR%"

set __LAUNCHER_MAIN=org.junit.platform.console.ConsoleLauncher
set __LAUNCHER_ARGS="--classpath=%_TEST_CLASSES_DIR%" "--select-package=com.example.restservice"

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" %__TEST_JAVA_OPTS% %__LAUNCHER_MAIN% %__LAUNCHER_ARGS% 1>&2
) else if %_VERBOSE%==1 ( echo Run tests in directory "!_TEST_CLASSES_DIR:%_ROOT_DIR%\=!" 1>&2
)
call "%_JAVA_CMD%" %__TEST_JAVA_OPTS% %__LAUNCHER_MAIN% %__LAUNCHER_ARGS%
if not !ERRORLEVEL!==0 (
    echo %_ERROR_LABEL% Failed to run tests in directory "!_TEST_CLASSES_DIR:%_ROOT_DIR%\=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem output parameter: _DURATION
:duration
set __START=%~1
set __END=%~2

for /f "delims=" %%i in ('powershell -c "$interval = New-TimeSpan -Start '%__START%' -End '%__END%'; Write-Host $interval"') do set _DURATION=%%i
goto :eof

@rem #########################################################################
@rem ## Cleanups

:end
if %_TIMER%==1 (
    for /f "delims=" %%i in ('powershell -c "(Get-Date)"') do set __TIMER_END=%%i
    call :duration "%_TIMER_START%" "!__TIMER_END!"
    echo Total execution time: !_DURATION! 1>&2
)
if %_DEBUG%==1 echo %_DEBUG_LABEL% _EXITCODE=%_EXITCODE% 1>&2
exit /b %_EXITCODE%
endlocal

