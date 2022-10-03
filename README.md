# <span id="top">Spring on Microsoft Windows</span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:25%;"><a href="https://spring.io/" rel="external"><img src="./docs/images/spring-icon.svg" width="100" alt="Spring project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This repository gathers <a href="https://spring.io/" rel="external">Spring</a> code examples coming from various websites and books.<br/>
  It also includes several <a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a>/<a href="https://docs.gradle.org/current/userguide/writing_build_scripts.html" rel="external">Gradle scripts</a> for experimenting with <a href="https://spring.io/" rel="external">Spring</a> on a Windows machine.
  </td>
  </tr>
</table>

[Ada][ada_examples], [Akka][akka_examples], [C++][cpp_examples], [Deno][deno_examples], [Flix][flix_examples], [Golang][golang_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [TruffleSqueak][trufflesqueak_examples] and [WiX][wix_examples] are other trending topics we are continuously monitoring.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Apache Maven 3.8][apache_maven] ([requires Java 7][apache_maven_history])  ([*release notes*][apache_maven_relnotes])
- [Git 2.37][git_downloads] ([*release notes*][git_relnotes])
- [Gradle 7.5][gradle_install] ([requires Java 8 or newer][gradle_compatibility]) ([*release notes*][gradle_relnotes])
- [Spring Boot 2.7][spring_boot_downloads] <sup id="anchor_01">[1](#footnote_01)</sup> ([*release notes*][spring_boot_relnotes])
- [Temurin OpenJDK 11 LTS][temurin_openjdk11] ([*release notes*][temurin_openjdk11_relnotes], [*bug fixes*][temurin_openjdk11_bugfixes])

Optionally one may also install the following software:

- [Temurin OpenJDK 17 LTS][temurin_openjdk17] ([*release notes*][temurin_openjdk17_relnotes], [*bug fixes*][temurin_openjdk17_bugfixes])

> **&#9755;** ***Installation policy***<br/>
> When possible we install software from a [Zip archive][zip_archive] rather than via a [Windows installer][windows_installer]. In our case we defined **`C:\opt\`** as the installation directory for optional software tools (*in reference to* the [`/opt/`][unix_opt] directory on Unix).

For instance our development environment looks as follows (*October 2022*) <sup id="anchor_02">[2](#footnote_02)</sup>:

<pre style="font-size:80%;">
C:\opt\apache-maven-3.8.6\         <i>( 10 MB)</i>
C:\opt\Git-2.37.3\                 <i>(289 MB)</i>
C:\opt\gradle-7.5.1\               <i>(122 MB)</i>
C:\opt\jdk-temurin-11.0.16_8\      <i>(300 MB)</i>
C:\opt\jdk-temurin-17.0.4_8\       <i>(299 MB)</i>
</pre>


> **:mag_right:** [Git for Windows][git_downloads] provides a Bash emulation used to run [**`git`**][git_cli] from the command line (as well as over 250 Unix commands like [**`awk`**][man1_awk], [**`diff`**][man1_diff], [**`file`**][man1_file], [**`grep`**][man1_grep], [**`more`**][man1_more], [**`mv`**][man1_mv], [**`rmdir`**][man1_rmdir], [**`sed`**][man1_sed] and [**`wc`**][man1_wc]).

## <span id="structure">Directory structure</span> [**&#x25B4;**](#top)

This project is organized as follows:

<pre style="font-size:80%;">
docs\
examples\{<a href="examples/README.md">README.md</a>, <a href="examples/demo/">demo</a>, <a href="examples/gs-rest-service/">gs-rest-service</a>, ..}
README.md
<a href="RESOURCES.md">RESOURCES.md</a>
<a href="setenv.bat">setenv.bat</a>
</pre>

where

- directory [**`docs\`**](docs/) contains [Spring] related documents.
- directory [**`examples\`**](examples/) contains [Spring] code examples (see file [**`examples\README.md`**](examples/README.md)).
- file [**`README.md`**](README.md) is the [Markdown][github_markdown] document for this page.
- file [**`RESOURCES.md`**](RESOURCES.md) is the [Markdown][github_markdown] document presenting external resources.
- file [**`setenv.bat`**](setenv.bat) is the batch command for setting up our environment.


## <span id="commands">Batch/Bash commands</span>

### **`setenv.bat`**

Command [**`setenv`**](setenv.bat) is executed once to setup our development environment; it makes external tools such as [**`gradle.bat`**][gradle_cli] and [**`git.exe`**][git_cli] directly available from the command prompt.

<pre style="font-size:80%;">
<b>&gt; <a href="setenv.bat">setenv</a> -verbose</b>
Tool versions:
   javac 11.0.16, java 11.0.16,
   gradle 7.5.1, mvn 3.8.6,
   git 2.37.3.windows.1, diff 3.8, bash 4.4.23(1)-release
Tool paths:
   C:\opt\jdk-temurin-11.0.16_8\bin\javac.exe
   C:\opt\jdk-temurin-11.0.16_8\bin\java.exe
   C:\opt\gradle-7.5.1\bin\gradle.bat
   C:\opt\apache-maven-3.8.6\bin\mvn.cmd
   C:\opt\Git-2.37.3\bin\git.exe
   C:\opt\Git-2.37.3\usr\bin\diff.exe
   C:\opt\Git-2.37.3\bin\bash.exe
Environment variables:
   "GIT_HOME=C:\opt\Git-2.37.3"
   "GRADLE_HOME=C:\opt\gradle-7.5.1"
   "JAVA_HOME=C:\opt\jdk-temurin-11.0.16_8"
   "JAVA11_HOME=C:\opt\jdk-temurin-11.0.16_8"
   "JAVA17_HOME=C:\opt\jdk-temurin-17.0.4_8"
   "MAVEN_HOME=C:\opt\apache-maven-3.8.6"
   "PYTHON_HOME=C:\opt\Python-3.10.7"

<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/where_1" rel="external">where</a> gradle</b>
C:\opt\gradle-7.5.1\bin\gradle.bat
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

## <span id="footnotes">Footnotes</span>[**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Spring Boot vs. Spring Framework*** [↩](#anchor_01)

<dl><dd>
Spring Boot 2.6 and 2.7 depend on the Spring Framework 5.3 which has long-term support provided on JDK 8, 11 and 17 :
</dd>
<dd>
<table>
<tr>
<th>Spring Boot</th>
<th>Spring Framework</th></tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.4">2.7.4</a></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.23">5.3.23</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.23">relnotes</a>)</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.0">2.7.0</a></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.20">5.3.20</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.20">relnotes</a>)</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.6.7">2.6.7</a></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-framework-bom/5.3.19">5.3.19</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.19">relnotes</a>)</i></td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.6.6">2.6.6</a></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-framework-bom/5.3.18">5.3.18</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.18">relnotes</a>)</i></td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot/2.6.5">2.6.5</a></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.17">5.3.17</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.17">relnotes</a>)</i></td>
</tr>
<tr>
<td><b>...</b></td><td><b>...</b></td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot/2.6.0">2.6.0</a></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.13">5.3.13</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.13">relnotes</a>)</i></td>
</tr>
</table>
</dd>
<dd>
<b>Note:</b> Spring Boot 1.0 was released in 2014 and Spring Framework 1.0 was released in 2003.
</dd></dl>

<span id="footnote_02">[2]</span> ***Downloads*** [↩](#anchor_02)

<dl><dd>
In our case we downloaded the following installation files (<a href="#proj_deps">see section 1</a>):
</dd>
<dd>
<pre style="font-size:80%;">
<a href="https://maven.apache.org/download.cgi">apache-maven-3.8.6-bin.zip</a>                         <i>( 10 MB)</i>
<a href="https://gradle.org/install/">gradle-7.5.1-bin.zip</a>                               <i>(110 MB)</i>
<a href="https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot">OpenJDK11U-jdk_x64_windows_hotspot_11.0.16_8.zip</a>   <i>( 99 MB)</i>
<a href="https://adoptium.net/temurin/releases/?variant=openjdk17&jvmVariant=hotspot">OpenJDK17U-jdk_x64_windows_hotspot_17.0.4_8.zip</a>    <i>(176 MB)</i>
<a href="https://git-scm.com/download/win">PortableGit-2.37.3-64-bit.7z.exe</a>                   <i>( 41 MB)</i>
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ada_examples]: https://github.com/michelou/ada-examples
[akka_examples]: https://github.com/michelou/akka-examples
[apache_maven]: https://maven.apache.org/download.cgi
[apache_maven_cli]: https://maven.apache.org/ref/current/maven-embedder/cli.html
[apache_maven_history]: https://maven.apache.org/docs/history.html
[apache_maven_relnotes]: https://maven.apache.org/docs/3.8.6/release-notes.html
[cpp_examples]: https://github.com/michelou/cpp-examples
[deno_examples]: https://github.com/michelou/deno-examples
[flix_examples]: https://github.com/michelou/flix-examples
[git_cli]: https://git-scm.com/docs/git
[git_downloads]: https://git-scm.com/download/win
[git_relnotes]: https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.37.3.txt
[github_markdown]: https://github.github.com/gfm/
[golang_examples]: https://github.com/michelou/golang-examples
[graalvm_examples]: https://github.com/michelou/graalvm-examples
[gradle_cli]: https://docs.gradle.org/current/userguide/command_line_interface.html
[gradle_compatibility]: https://docs.gradle.org/current/release-notes.html#upgrade-instructions
[gradle_install]: https://gradle.org/install/
[gradle_latest]: https://gradle.org/releases/
[gradle_relnotes]: https://docs.gradle.org/7.4/release-notes.html
[haskell_examples]: https://github.com/michelou/haskell-examples
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
[maven_relnotes]: https://maven.apache.org/docs/3.8.6/release-notes.html
[nodejs_examples]: https://github.com/michelou/nodejs-examples
[rust_examples]: https://github.com/michelou/rust-examples
[scala3_examples]: https://github.com/michelou/dotty-examples
[spark_examples]: https://github.com/michelou/spark-examples
[spring]: https://spring.io/
[spring_boot_downloads]: https://mvnrepository.com/artifact/org.springframework.boot/spring-boot
[spring_boot_relnotes]: https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-2.7-Release-Notes
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
