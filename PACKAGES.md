# <span id="top">Maven Packages</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:90px"><a href=https://spring.io/" rel="external"><img style="border:0;" src="./docs/images/spring-icon.svg" width="90" alt="Akka project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This document presents the <a href="https://mvnrepository.com/" rel="external">Maven packages</a> our projects depend on.
  </td>
  </tr>
</table>

We also install the following [Maven packages][maven_repository] : 

- [Spring Boot 3.3][spring_boot_downloads] <sup id="anchor_01">[1](#footnote_01)</sup> ([*release notes*][spring_boot_relnotes])

Depending on the build tool the above packages are stored locally in two different locations :

| Build&nbsp;tool   | Local&nbsp;repository           |
|:-----------------------|:--------------------------------|
| [**`gradle.bat`**][gradle_cli], [**`mvn.cmd`**][mvn_cli], [**`sbt.bat`**][sbt_cli] | `%USERPROFILE%\.m2\repository\` | 
| [**`ant.bat`**][ant_cli] ([Ivy][ivy_lib] library)    | `%USERPROFILE%\.ivy2\cache\`    |


## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Spring Boot vs. Spring Framework*** [↩](#anchor_01)

<dl><dd>
Spring Boot 3.x depend on Spring Framework 6.0 and requires <b>JDK 17</b> as a minimum version while Spring Boot 2.x depend on the Spring Framework 5.3 which has long-term support provided on JDK 8, 11 and 17 :
</dd>
<dd>
<table>
<tr>
<th>Spring Boot 3</th>
<th>Release Date</th>
<th>Spring 6 Framework</th>
<th>JDK</th></tr>
<tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.3.0-M2">3.3.0-M2</a></td>
<td>Feb 2024</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.1.4">6.1.4</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.1.4">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.2.2">3.2.2</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.2.2">relnotes</a>)</i></td>
<td>Jan 2024</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.1.3">6.1.3</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.1.3">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.2.1">3.2.1</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.2.1">relnotes</a>)</i></td>
<td>Dec 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.1.2">6.1.2</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.1.2">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.2.0">3.2.0</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.2.0">relnotes</a>)</i></td>
<td>Nov 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.1.1">6.1.1</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.1.1">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.5">3.1.5</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.5">relnotes</a>)</i></td>
<td>Oct 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.13">6.0.13</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.13">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.4">3.1.4</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.4">relnotes</a>)</i></td>
<td>Sep 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.12">6.0.12</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.12">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.2">3.1.2</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.2">relnotes</a>)</i></td>
<td>Jul 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.11">6.0.11</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.11">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.1">3.1.1</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.1">relnotes</a>)</i></td>
<td>Jun 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.10">6.0.10</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.10">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.0">3.1.0</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.1.0">relnotes</a>)</i></td>
<td>May 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.9">6.0.9</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.9">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/3.0.7">3.0.7</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.0.7">relnotes</a>)</i></td>
<td>May 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.9">6.0.9</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.9">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/3.0.6">3.0.6</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.0.6">relnotes</a>)</i></td>
<td>Apr 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.8">6.0.8</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.8">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/3.0.5">3.0.5</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.0.5">relnotes</a>)</i></td>
<td>Mar 2023</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.7">6.0.7</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.7">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/3.0.4">3.0.4</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.0.4">relnotes</a>)</i></td>
<td></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.6">6.0.6</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.6">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/3.0.3">3.0.3</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.0.3">relnotes</a>)</i></td>
<td></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.5">6.0.5</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.5">relnotes</a>)</td>
<td>17+ (21)</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/3.0.2">3.0.2</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.0.2">relnotes</a>)</i></td>
<td></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.4">6.0.4</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.4">relnotes</a>)</td>
<td>17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/3.0.1">3.0.1</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.0.1">relnotes</a>)</i></td>
<td></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.3">6.0.3</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.3">relnotes</a>)</td>
<td>17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/3.0.0">3.0.0</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v3.0.0">relnotes</a>)</i></td>
<td>Nov 2022</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/6.0.2">6.0.2</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v6.0.2">relnotes</a>)</td>
<td>17</td>
</tr>
</table>

<table>
<tr>
<th>Spring Boot 2</th>
<th>Spring 5 Framework</th>
<th>JDK</th></tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.18">2.7.18</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.18">relnotes</a>)</i>
</td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.31">5.3.31</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.31">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.17">2.7.17</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.17">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.30">5.3.30</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.30">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.16">2.7.16</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.16">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.30">5.3.30</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.30">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.14">2.7.14</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.14">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.29">5.3.29</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.29">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.13">2.7.13</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.13">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.28">5.3.28</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.28">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.12">2.7.12</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.12">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.27">5.3.27</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.27">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.11">2.7.11</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.11">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.27">5.3.27</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.27">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.10">2.7.10</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.10">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.26">5.3.26</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.26">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.7">2.7.7</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.7">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.24">5.3.24</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.24">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.6">2.7.6</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.6">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.24">5.3.24</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.24">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.5">2.7.5</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.5">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.23">5.3.23</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.23">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.4">2.7.4</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.4">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.23">5.3.23</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.23">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.7.0">2.7.0</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.7.0">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.20">5.3.20</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.20">relnotes</a>)</td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.6.7">2.6.7</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.6.7">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-framework-bom/5.3.19">5.3.19</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.19">relnotes</a>)</i></td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/2.6.6">2.6.6</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.6.6">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-framework-bom/5.3.18">5.3.18</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.18">relnotes</a>)</i></td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot/2.6.5">2.6.5</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.6.5">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.17">5.3.17</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.17">relnotes</a>)</i></td>
<td>8, 11, 17</td>
</tr>
<tr>
<td><b>...</b></td><td><b>...</b></td><td><b>...</b></td>
</tr>
<tr>
<td><a href="https://mvnrepository.com/artifact/org.springframework.boot/spring-boot/2.6.0">2.6.0</a> <i>(<a href="https://github.com/spring-projects/spring-boot/releases/tag/v2.6.0">relnotes</a>)</i></td>
<td><a href="https://mvnrepository.com/artifact/org.springframework/spring-core/5.3.13">5.3.13</a> <i>(<a href="https://github.com/spring-projects/spring-framework/releases/tag/v5.3.13">relnotes</a>)</i></td>
<td>8, 11, 17</td>
</tr>
</table>
</dd>
<dd>
<b>Note:</b> Spring Boot 1.0 was released in 2014 and Spring Framework 1.0 was released in 2003.
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/April 2024* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ant_cli]: https://ant.apache.org/
[gradle_cli]: https://docs.gradle.org/current/userguide/declaring_repositories.html
[ivy_lib]: https://ant.apache.org/ivy/
[maven_repository]: https://mvnrepository.com/
[mvn_cli]: https://maven.apache.org/ref/3.9.6/maven-embedder/cli.html
[sbt_cli]: https://www.scala-sbt.org/1.x/docs/Resolvers.html
[spring_boot_downloads]: https://mvnrepository.com/artifact/org.springframework.boot/spring-boot
[spring_boot_relnotes]: https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-3.1-Release-Notes
