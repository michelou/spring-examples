# <span id="top">Playing with Spring on Windows</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:90px;"><a href="https://spring.io/" rel="external"><img style="border:0;width:90px;" src="./docs/images/spring-icon.svg" alt="Spring project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This repository gathers <a href="https://spring.io/" rel="external">Spring</a> code examples coming from various websites and books.<br/>
  It also includes several build scripts (<a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a>, <a href="https://docs.gradle.org/current/userguide/writing_build_scripts.html" rel="external">Gradle scripts</a>) for experimenting with <a href="https://spring.io/" rel="external">Spring</a> on a Windows machine.
  </td>
  </tr>
</table>

[Ada][ada_examples], [Akka][akka_examples], [C++][cpp_examples], [Dart][dart_examples], [Deno][deno_examples], [Flix][flix_examples], [Golang][golang_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kafka][kafka_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [TruffleSqueak][trufflesqueak_examples] and [WiX Toolset][wix_examples] are other trending topics we are continuously monitoring.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Apache Maven 3.9][apache_maven] ([requires Java 8+][apache_maven_history])  ([*release notes*][apache_maven_relnotes])
- [Git 2.41][git_downloads] ([*release notes*][git_relnotes])
- [Gradle 8.2][gradle_install] ([requires Java 8+][gradle_compatibility]) ([*release notes*][gradle_relnotes])
- [Temurin OpenJDK 17 LTS][temurin_openjdk17] ([*release notes*][temurin_openjdk17_relnotes], [*bug fixes*][temurin_openjdk17_bugfixes])

> **&#9755;** ***Maven packages***<br/>
> We present the Maven package dependencies in document [**`PACKAGES.md`**](./PACKAGES.md).

Optionally one may also install the following software:

- [Temurin OpenJDK 11 LTS][temurin_openjdk11] ([*release notes*][temurin_openjdk11_relnotes], [*bug fixes*][temurin_openjdk11_bugfixes])

> **&#9755;** ***Installation policy***<br/>
> When possible we install software from a [Zip archive][zip_archive] rather than via a [Windows installer][windows_installer]. In our case we defined **`C:\opt\`** as the installation directory for optional software tools (*in reference to* the [`/opt/`][unix_opt] directory on Unix).

For instance our development environment looks as follows (*July 2023*) <sup id="anchor_01">[1](#footnote_01)</sup>:

<pre style="font-size:80%;">
C:\opt\apache-maven-3.9.3\        <i>( 10 MB)</i>
C:\opt\Git-2.41.0\                <i>(314 MB)</i>
C:\opt\gradle-8.2.1\              <i>(135 MB)</i>
C:\opt\jdk-temurin-11.0.19_7\     <i>(300 MB)</i>
C:\opt\jdk-temurin-17.0.7_7\      <i>(299 MB)</i>
</pre>


> **:mag_right:** [Git for Windows][git_downloads] provides a Bash emulation used to run [**`git`**][git_cli] from the command line (as well as over 250 Unix commands like [**`awk`**][man1_awk], [**`diff`**][man1_diff], [**`file`**][man1_file], [**`grep`**][man1_grep], [**`more`**][man1_more], [**`mv`**][man1_mv], [**`rmdir`**][man1_rmdir], [**`sed`**][man1_sed] and [**`wc`**][man1_wc]).

## <span id="structure">Directory structure</span> [**&#x25B4;**](#top)

This project is organized as follows:

<pre style="font-size:80%;">
docs\
examples\{<a href="examples/README.md">README.md</a>, <a href="examples/demo/">demo</a>, <a href="examples/gs-rest-service/">gs-rest-service</a>, ..}
<a href="PACKAGES.md">PACKAGES.md</a>
README.md
<a href="RESOURCES.md">RESOURCES.md</a>
<a href="setenv.bat">setenv.bat</a>
</pre>

where

- directory [**`docs\`**](docs/) contains [Spring] related documents.
- directory [**`examples\`**](examples/) contains [Spring] code examples (see file [**`examples\README.md`**](examples/README.md)).
- file [**`PACKAGES.md`**](PACKAGES.md) presents the [Maven packages][maven_repository] our projects depend on.
- file [**`README.md`**](README.md) is the [Markdown][github_markdown] document for this page.
- file [**`RESOURCES.md`**](RESOURCES.md) is the [Markdown][github_markdown] document presenting external resources.
- file [**`setenv.bat`**](setenv.bat) is the batch command for setting up our environment.


## <span id="commands">Batch/Bash commands</span>

### **`setenv.bat`** <sup id="anchor_02">[2](#footnote_02)</sup>

Command [**`setenv.bat`**](setenv.bat) is executed once to setup our development environment; it makes external tools such as [**`gradle.bat`**][gradle_cli] and [**`git.exe`**][git_cli] directly available from the command prompt.

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a> -verbose</b>
Tool versions:
   javac 17.0.7, java 17.0.7,
   gradle 8.2.1, mvn 3.9.3,
   git 2.41.0.windows.1, diff 3.9, bash 5.2.15(1)-release
Tool paths:
   C:\opt\jdk-temurin-17.0.7_7\bin\javac.exe
   C:\opt\jdk-temurin-17.0.7_7\bin\java.exe
   C:\opt\gradle-8.2.1\bin\gradle.bat
   C:\opt\apache-maven-3.9.3\bin\mvn.cmd
   C:\opt\Git-2.41.0\bin\git.exe
   C:\opt\Git-2.41.0\usr\bin\diff.exe
   C:\opt\Git-2.41.0\bin\bash.exe
Environment variables:
   "GIT_HOME=C:\opt\Git-2.41.0"
   "GRADLE_HOME=C:\opt\gradle-8.2.1"
   "JAVA_HOME=C:\opt\jdk-temurin-17.0.7_7"
   "JAVA11_HOME=C:\opt\jdk-temurin-11.0.19_7"
   "JAVA17_HOME=C:\opt\jdk-temurin-17.0.7_7"
   "MAVEN_HOME=C:\opt\apache-maven-3.9.3"
   "PYTHON_HOME=C:\opt\Python-3.11.1"

<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1" rel="external">where</a> gradle mvn</b>
C:\opt\gradle-8.2.1\bin\gradle.bat
C:\opt\apache-maven-3.9.3\bin\mvn
C:\opt\apache-maven-3.9.3\bin\mvn.cmd
</pre>

> **:mag_right:** Subcommand `help` prints the following help message :
>   <pre style="font-size:80%;">
>   <b>&gt; <a href="setenv.bat">setenv</a> help</b>
>   Usage: setenv { &lt;option&gt; | &lt;subcommand&gt; }
>   &nbsp;
>     Options:
>       -bash       start Git bash shell instead of Windows command prompt
>       -debug      show commands executed by this script
>       -verbose    display environment settings
>   &nbsp;
>     Subcommands:
>       help        display this help message
>   </pre>

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Downloads*** [↩](#anchor_01)

<dl><dd>
In our case we downloaded the following installation files (<a href="#proj_deps">see section 1</a>):
</dd>
<dd>
<pre style="font-size:80%;">
<a href="https://maven.apache.org/download.cgi">apache-maven-3.9.3-bin.zip</a>                         <i>( 10 MB)</i>
<a href="https://gradle.org/install/">gradle-8.2.1-bin.zip</a>                               <i>(110 MB)</i>
<a href="https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot">OpenJDK11U-jdk_x64_windows_hotspot_11.0.19_7.zip</a>   <i>( 99 MB)</i>
<a href="https://adoptium.net/temurin/releases/?variant=openjdk17&jvmVariant=hotspot">OpenJDK17U-jdk_x64_windows_hotspot_17.0.7_7.zip</a>    <i>(176 MB)</i>
<a href="https://git-scm.com/download/win">PortableGit-2.41.0-64-bit.7z.exe</a>                   <i>( 41 MB)</i>
</pre>
</dd></dl>

<span id="footnote_02">[2]</span> **`setenv.bat` *usage*** [↩](#anchor_02)

<dl><dd>
<a href=./setenv.bat><code><b>setenv.bat</b></code></a> has specific environment variables set that enable us to use command-line developer tools more easily.
</dd>
<dd>It is similar to the setup scripts described on the page <a href="https://learn.microsoft.com/en-us/visualstudio/ide/reference/command-prompt-powershell" rel="external">"Visual Studio Developer Command Prompt and Developer PowerShell"</a> of the <a href="https://learn.microsoft.com/en-us/visualstudio/windows" rel="external">Visual Studio</a> online documentation.
</dd>
<dd>
For instance we can quickly check that the two scripts <code><b>Launch-VsDevShell.ps1</b></code> and <code><b>VsDevCmd.bat</b></code> are indeed available in our Visual Studio 2019 installation :
<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where" rel="external">where</a> /r "C:\Program Files (x86)\Microsoft Visual Studio" *vsdev*</b>
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\Launch-VsDevShell.ps1
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\vsdevcmd\core\vsdevcmd_end.bat
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\vsdevcmd\core\vsdevcmd_start.bat
</pre>
</dd>
<dd>
Concretely, <code><b>setenv.bat</b></code> in our GitHub projects which depend on Visual Studio (e.g. <a href="https://github.com/michelou/cpp-examples"><code>michelou/cpp-examples</code></a>) do invoke <code><b>VsDevCmd.bat</b></code> (resp. <code><b>vcvarall.bat</b></code> for older Visual Studio versions) to setup the Visual Studio tools on the command prompt. 
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/July 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ada_examples]: https://github.com/michelou/ada-examples
[akka_examples]: https://github.com/michelou/akka-examples
[apache_maven]: https://maven.apache.org/download.cgi
[apache_maven_cli]: https://maven.apache.org/ref/current/maven-embedder/cli.html
[apache_maven_history]: https://maven.apache.org/docs/history.html
[apache_maven_relnotes]: https://maven.apache.org/docs/3.9.3/release-notes.html
[cpp_examples]: https://github.com/michelou/cpp-examples
[dart_examples]: https://github.com/michelou/dart-examples
[deno_examples]: https://github.com/michelou/deno-examples
[flix_examples]: https://github.com/michelou/flix-examples
[git_cli]: https://git-scm.com/docs/git
[git_downloads]: https://git-scm.com/download/win
[git_relnotes]: https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.41.0.txt
[github_markdown]: https://github.github.com/gfm/
[golang_examples]: https://github.com/michelou/golang-examples
[graalvm_examples]: https://github.com/michelou/graalvm-examples
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[gradle_compatibility]: https://docs.gradle.org/current/release-notes.html#upgrade-instructions
[gradle_install]: https://gradle.org/install/
[gradle_latest]: https://gradle.org/releases/
[gradle_relnotes]: https://docs.gradle.org/8.0/release-notes.html
[haskell_examples]: https://github.com/michelou/haskell-examples
[kafka_examples]: https://github.com/michelou/kafka-examples
[kotlin_examples]: https://github.com/michelou/kotlin-examples
[linux_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[llvm_examples]: https://github.com/michelou/llvm-examples
[man1_awk]: https://www.linux.org/docs/man1/awk.html
[man1_diff]: https://www.linux.org/docs/man1/diff.html
[man1_file]: https://www.linux.org/docs/man1/file.html
[man1_grep]: https://www.linux.org/docs/man1/grep.html
[man1_more]: https://www.linux.org/docs/man1/more.html
[man1_mv]: https://www.linux.org/docs/man1/mv.html
[man1_rmdir]: https://www.linux.org/docs/man1/rmdir.html
[man1_sed]: https://www.linux.org/docs/man1/sed.html
[man1_wc]: https://www.linux.org/docs/man1/wc.html
[maven_latest]: https://maven.apache.org/download.cgi
[maven_relnotes]: https://maven.apache.org/docs/3.9.3/release-notes.html
[maven_repository]: https://mvnrepository.com/
[nodejs_examples]: https://github.com/michelou/nodejs-examples
[rust_examples]: https://github.com/michelou/rust-examples
[scala3_examples]: https://github.com/michelou/dotty-examples
[spark_examples]: https://github.com/michelou/spark-examples
[spring]: https://spring.io/
[temurin_openjdk11_bugfixes]: https://www.oracle.com/java/technologies/javase/11-0-15-bugfixes.html
[temurin_openjdk11_relnotes]: https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2021-October/009368.html
[temurin_openjdk11]: https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot
[temurin_openjdk17]: https://adoptium.net/releases.html?variant=openjdk17&jvmVariant=hotspot
[temurin_openjdk17_bugfixes]: https://www.oracle.com/java/technologies/javase/17-0-1-bugfixes.html
[temurin_openjdk17_relnotes]: https://github.com/openjdk/jdk/compare/jdk-17%2B20...jdk-17%2B21
[trufflesqueak_examples]: https://github.com/michelou/trufflesqueak-examples
[unix_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[windows_installer]: https://docs.microsoft.com/en-us/windows/win32/msi/windows-installer-portal
[windows_limitation]: https://support.microsoft.com/en-gb/help/830473/command-prompt-cmd-exe-command-line-string-limitation
[windows_subst]: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst
[wix_examples]: https://github.com/michelou/wix-examples
[zip_archive]: https://www.howtogeek.com/178146/htg-explains-everything-you-need-to-know-about-zipped-files/
