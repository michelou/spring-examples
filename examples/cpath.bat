@echo off
setlocal enabledelayedexpansion

@rem output parameter: _CPATH

if not defined _DEBUG set _DEBUG=%~1
if not defined _DEBUG set _DEBUG=0

if not defined _MVN_CMD set "_MVN_CMD=%MAVEN_HOME%\bin\mvn.cmd"
if %_DEBUG%==1 echo [%~n0] "_MVN_CMD=%_MVN_CMD%" 1>&2

if %_DEBUG%==1 ( set _MVN_OPTS=
) else ( set _MVN_OPTS=--quiet
)
@rem we use the newer PowerShell version if available
where /q pwsh.exe
if %ERRORLEVEL%==0 ( set _PWSH_CMD=pwsh.exe
) else ( set _PWSH_CMD=powershell.exe
)
if %_DEBUG%==1 echo [%~n0] "_PWSH_CMD=%_PWSH_CMD%" 1>&2

set _CENTRAL_REPO=https://repo1.maven.org/maven2
set "_LOCAL_REPO=%USERPROFILE%\.m2\repository"

set "_TEMP_DIR=%TEMP%\lib"
if not exist "%_TEMP_DIR%" mkdir "%_TEMP_DIR%"
if %_DEBUG%==1 echo [%~n0] "_TEMP_DIR=%_TEMP_DIR%" 1>&2

@rem https://mvnrepository.com/artifact/org.slf4j/slf4j-api
set __SLF4J_VERSION=2.0.16
@rem Spring Boot 2.7.6+ depend  on Spring Framework 5.3.24
@rem Spring Boot 3.0.0  depends on Spring Framework 6.0.2
@rem Spring Boot 3.0.1  depends on Spring Framework 6.0.3
@rem Spring Boot 3.0.2  depends on Spring Framework 6.0.4
@rem Spring Boot 3.0.3  depends on Spring Framework 6.0.5
@rem Spring Boot 3.0.4  depends on Spring Framework 6.0.6
@rem Spring Boot 3.0.5  depends on Spring Framework 6.0.7
@rem Spring Boot 3.0.6  depends on Spring Framework 6.0.8
@rem Spring Boot 3.1.0  depends on Spring Framework 6.0.9
@rem Spring Boot 3.1.1  depends on Spring Framework 6.0.10
@rem Spring Boot 3.1.2  depends on Spring Framework 6.0.11
@rem Spring Boot 3.1.5  depends on Spring Framework 6.0.13
@rem Spring Boot 3.2.0  depends on Spring Framework 6.1.1
@rem Spring Boot 3.2.1  depends on Spring Framework 6.1.2
@rem Spring Boot 3.2.2  depends on Spring Framework 6.1.3
@rem Spring Boot 3.2.5  depends on Spring Framework 6.1.6
@rem Spring Boot 3.3.1  depends on Spring Framework 6.1.10
@rem Spring Boot 3.3.2  depends on Spring Framework 6.1.11
set __SPRING_VERSION=6.1.11
set __SPRING_BOOT_VERSION=3.3.2

@rem #########################################################################
@rem ## _LIBS_CPATH

set _LIBS_CPATH=

@rem https://mvnrepository.com/artifact/commons-logging/commons-logging
call :add_jar "commons-logging" "commons-logging" "1.3.3"

@rem https://mvnrepository.com/artifact/org.springframework/spring-aop
call :add_jar "org.springframework" "spring-aop" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework/spring-beans
call :add_jar "org.springframework" "spring-beans" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework/spring-context
call :add_jar "org.springframework" "spring-context" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework/spring-core
call :add_jar "org.springframework" "spring-core" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework/spring-expression
call :add_jar "org.springframework" "spring-expression" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework/spring-jcl
call :add_jar "org.springframework" "spring-jcl" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework/spring-web
call :add_jar "org.springframework" "spring-web" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework/spring-webmvc
call :add_jar "org.springframework" "spring-webmvc" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot
call :add_jar "org.springframework.boot" "spring-boot" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-autoconfigure
call :add_jar "org.springframework.boot" "spring-boot-autoconfigure" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter/
call :add_jar "org.springframework.boot" "spring-boot-starter" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-json/
call :add_jar "org.springframework.boot" "spring-boot-starter-json" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-logging/
call :add_jar "org.springframework.boot" "spring-boot-starter-logging" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-test
call :add_jar "org.springframework.boot" "spring-boot-starter-test" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-tomcat/
call :add_jar "org.springframework.boot" "spring-boot-starter-tomcat" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-web/
call :add_jar "org.springframework.boot" "spring-boot-starter-web" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-webflux/
@rem call :add_jar "org.springframework.boot" "spring-boot-starter-webflux" "%__SPRING_BOOT_VERSION%"

@rem ---------------------------- test packages ------------------------------

@rem https://mvnrepository.com/artifact/org.springframework/spring-test
@rem solves java.lang.ArrayStoreException: sun.reflect.annotation.TypeNotPresentExceptionProx
call :add_jar "org.springframework" "spring-test" "%__SPRING_VERSION%"

@rem https://mvnrepository.com/artifact/org.apiguardian/apiguardian-api
call :add_jar "org.apiguardian" "apiguardian-api" "1.1.2"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-test
call :add_jar "org.springframework.boot" "spring-boot-test" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-test-autoconfigure
call :add_jar "org.springframework.boot" "spring-boot-test-autoconfigure" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-data-jpa
call :add_jar "org.springframework.boot" "spring-boot-starter-data-jpa" "%__SPRING_BOOT_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-test
call :add_jar "org.springframework.boot" "spring-boot-starter-test" "%__SPRING_BOOT_VERSION%"

set __SPRING_DATA_VERSION=3.3.2

@rem https://mvnrepository.com/artifact/org.springframework.data/spring-data-commons
call :add_jar "org.springframework.data" "spring-data-commons" "%__SPRING_DATA_VERSION%"

@rem https://mvnrepository.com/artifact/org.springframework.data/spring-data-jpa
call :add_jar "org.springframework.data" "spring-data-jpa" "%__SPRING_DATA_VERSION%"

set __JUPITER_VERSION=5.10.3

@rem https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter
call :add_jar "org.junit.jupiter" "junit-jupiter" "%__JUPITER_VERSION%"

@rem https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-api
call :add_jar "org.junit.jupiter" "junit-jupiter-api" "%__JUPITER_VERSION%"

@rem https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-engine
call :add_jar "org.junit.jupiter" "junit-jupiter-engine" "%__JUPITER_VERSION%"

@rem https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-params
call :add_jar "org.junit.jupiter" "junit-jupiter-params" "%__JUPITER_VERSION%"

@rem https://mvnrepository.com/artifact/org.junit.platform/junit-platform-console-standalone
call :add_jar "org.junit.platform" "junit-platform-console-standalone" "1.10.3"

@rem https://mvnrepository.com/artifact/org.hamcrest/hamcrest
@rem contains "org.hamcrest.SelfDescribing"
@rem call :add_jar "org.hamcrest" "hamcrest" "2.2"

@rem https://mvnrepository.com/artifact/io.rest-assured/spring-mock-mvc
@rem solves error:  No qualifying bean of type 'org.springframework.test.web.servlet.MockMvc'
call :add_jar "io.rest-assured" "spring-mock-mvc" "5.5.0"

@rem https://mvnrepository.com/artifact/org.slf4j/slf4j-api
call :add_jar "org.slf4j" "slf4j-api" "%__SLF4J_VERSION%"

@rem https://mvnrepository.com/artifact/org.slf4j/slf4j-simple
call :add_jar "org.slf4j" "slf4j-simple" "%__SLF4J_VERSION%"

@rem https://mvnrepository.com/artifact/jakarta.persistence/jakarta.persistence-api
call :add_jar "jakarta.persistence" "jakarta.persistence-api" "3.2.0"

@rem dependency of Spring Boot example `service`
set _SPRING_AI_VERSION=1.0.3

@rem https://mvnrepository.com/artifact/io.springboot.ai/spring-ai-bom
call :add_spring_jar "io.springboot.ai" "spring-ai-bom" "%_SPRING_AI_VERSION%"

goto end

@rem #########################################################################
@rem ## Subroutines

:add_jar
set __GROUP_ID=%~1
set __ARTIFACT_ID=%~2
set __VERSION=%~3

call :add_jar0 "%_CENTRAL_REPO%" "%__GROUP_ID%" "%__ARTIFACT_ID%" "%__VERSION%"
goto :eof

:add_spring_jar
set __SPRING_REPO=https://repo.spring.io/milestone
set __GROUP_ID=%~1
set __ARTIFACT_ID=%~2
set __VERSION=%~3

call :add_jar0 "%__SPRING_REPO%" "%__GROUP_ID%" "%__ARTIFACT_ID%" "%__VERSION%"
goto :eof

@rem input parameters: %1=group ID, %2=artifact ID, %3=version
@rem global variable: _LIBS_CPATH
:add_jar0
set __REPO=%~1
@rem https://mvnrepository.com/artifact/org.portable-scala
set __GROUP_ID=%~2
set __ARTIFACT_ID=%~3
set __VERSION=%~4

set __JAR_NAME=%__ARTIFACT_ID%-%__VERSION%.jar
set __JAR_PATH=%__GROUP_ID:.=\%\%__ARTIFACT_ID:/=\%
set __JAR_FILE=
for /f "usebackq delims=" %%f in (`where /r "%_LOCAL_REPO%\%__JAR_PATH%" %__JAR_NAME% 2^>NUL`) do (
    set "__JAR_FILE=%%f"
)
if not exist "%__JAR_FILE%" (
    set __JAR_URL=%__REPO%/%__GROUP_ID:.=/%/%__ARTIFACT_ID%/%__VERSION%/%__JAR_NAME%
    set "__JAR_FILE=%_TEMP_DIR%\%__JAR_NAME%"
    if not exist "!__JAR_FILE!" (
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% call "%_PWSH_CMD%" -c "Invoke-WebRequest -Uri '!__JAR_URL!' -Outfile '!__JAR_FILE!'" 1>&2
        ) else if %_VERBOSE%==1 ( echo Download file "%__JAR_NAME%" to directory "!_TEMP_DIR:%USERPROFILE%=%%USERPROFILE%%!" 1>&2
        )
        call "%_PWSH_CMD%" -c "$progressPreference='silentlyContinue';Invoke-WebRequest -Uri '!__JAR_URL!' -Outfile '!__JAR_FILE!'"
        if not !ERRORLEVEL!==0 (
            echo %_ERROR_LABEL% Failed to download file "%__JAR_NAME%" 1>&2
            set _EXITCODE=1
            goto :eof
        )
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_MVN_CMD%" %_MVN_OPTS% install:install-file -Dfile="!__JAR_FILE!" -DgroupId="%__GROUP_ID%" -DartifactId=%__ARTIFACT_ID% -Dversion=%__VERSION% -Dpackaging=jar 1>&2
        ) else if %_VERBOSE%==1 ( echo Install Maven artifact into directory "!_LOCAL_REPO:%USERPROFILE%=%%USERPROFILE%%!\%__SCALA_XML_PATH%" 1>&2
        )
        @rem see https://stackoverflow.com/questions/16727941/how-do-i-execute-cmd-commands-through-a-batch-file
        call "%_MVN_CMD%" %_MVN_OPTS% install:install-file -Dfile="!__JAR_FILE!" -DgroupId="%__GROUP_ID%" -DartifactId=%__ARTIFACT_ID% -Dversion=%__VERSION% -Dpackaging=jar
        if not !ERRORLEVEL!==0 (
            echo %_ERROR_LABEL% Failed to install Maven artifact into directory "!_LOCAL_REPO:%USERPROFILE%=%%USERPROFILE%%!" ^(error:!ERRORLEVEL!^) 1>&2
        )
        for /f "usebackq delims=" %%f in (`where /r "%_LOCAL_REPO%\%__JAR_PATH%" %__JAR_NAME% 2^>NUL`) do (
            set "__JAR_FILE=%%f"
        )
    )
)
set "_LIBS_CPATH=%_LIBS_CPATH%%__JAR_FILE%;"
goto :eof

@rem #########################################################################
@rem ## Cleanups

:end
endlocal & (
    set "_CPATH=%_LIBS_CPATH%"
)