# <span id="top">Spring examples</span> <span style="font-size:90%;">[↩](../README.md#top)</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://spring.io/"><img style="border:0;" src="../docs/images/spring-icon.svg" width="100" alt="Spring project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">Directory <strong><code>examples\</code></strong> contains <a href="https://spring.io/" alt="Spring">Spring</a> code examples coming from various websites - mostly from the <a href="https://spring.io/" rel="external">Spring</a> project.</td>
  </tr>
</table>

## <span id="demo">`demo` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./demo/build.bat">build.bat</a>
|   <a href="./demo/build.gradle">build.gradle</a>
|   <a href="./demo/pom.xml">pom.xml</a>
\---<b>src</b>
    +---<b>main</b>
    |   +---<b>java</b>
    |   |   \---<b>com</b>
    |   |       \---example
    |   |           \---demo
    |   |                   <a href="./demo/src/main/java/com/example/demo/DemoApplication.java">DemoApplication.java</a>
    |   \---<b>resources</b>
    |           <a href="./demo/src/main/resources/application.properties">application.properties</a>
    \---<b>test</b>
        \---java
            \---com
                \---<b>example</b>
                    \---<b>demo</b>
                            <a href="./demo/src/test/java/com/example/demo/DemoApplicationTests.java">DemoApplicationTests.java</a>
</pre>

Command [**`build.bat`**](./demo/build.bat)`-verbose run` starts the Spring Boot server &ndash; *if not yet running* &ndash; and executes two HTTP requests (using [`cURL`][curl_cli]) :

<pre style="font-size:80%;">
<b>&gt; <a href="./demo/build.bat">build</a> -verbose run</b>
Search for user process with name "demo-service"
Execute request "hello" to Spring Boot server "demo-service"
Hello World!
Execute request "hello?name=John" to Spring Boot server "demo-service"
Hello John!buil
</pre>

> **:mag_right:** We can also launch the Spring Boot server before executing the above HTTP requests :
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/start">start</a> "demo-service" <a href="https://maven.apache.org/ref/current/maven-embedder/cli.html">mvn</a> spring-boot:run</b>
> </pre>
> As a result the server process "`demo-service`" is started in a separate window session:
> <pre style="font-size:80%;">
> [...]
> <b>[INFO]</b> Attaching agents: []
>   .   ____          _            __ _ _
>  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
> ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
>  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
>   '  |____| .__|_| |_|_| |_\__, | / / / /
>  =========|_|==============|___/=/_/_/_/
>  :: Spring Boot ::                (v3.3.3)
> [...]
> </pre>

Command [**`build`**](./demo/build.bat)`stop` terminates the server process :
<pre style="font-size:80%;">
<b>&gt; <a href="./demo/build.bat">build</a> -verbose stop</b>
Search for user process with name "demo-service"
Stop server process "demo-service"
</pre>

## <span id="gs-rest-service">`gs-rest-service` Example<span> [**&#x25B4;**](#top)

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./gs-rest-service/build.bat">build.bat</a>
|   <a href="./gs-rest-service/build.gradle">build.gradle</a>
|   <a href="./gs-rest-service/manifest.yml">manifest.yml</a>
|   <a href="./gs-rest-service/pom.xml">pom.xml</a>
|   <a href="./gs-rest-service/settings.gradle">settings.gradle</a>
\---<b>src</b>
    +---<b>main</b>
    |   +---<b>java</b>
    |   |   \---<b>com</b>
    |   |       \---<b>example</b>
    |   |           \---<b>restservice</b>
    |   |                   <a href="./gs-rest-service/src/main/java/com/example/restservice/Greeting.java">Greeting.java</a>
    |   |                   <a href="./gs-rest-service/src/main/java/com/example/restservice/GreetingController.java">GreetingController.java</a>
    |   |                   <a href="./gs-rest-service/src/main/java/com/example/restservice/RestServiceApplication.java">RestServiceApplication.java</a>
    |   \---<b>resources</b>
    |           <a href="./gs-rest-service/src/main/resources/application.properties">application.properties</a>
    \---<b>test</b>
        \---<b>java</b>
            \---<b>com</b>
                \---<b>example</b>
                    \---<b>restservice</b>
                            <a href="./gs-rest-service/src/test/java/com/example/restservice/GreetingControllerTests.java">GreetingControllerTests.java</a>
</pre>

Command [**`build`**](./gs-test-service/build.bat)`run` starts the Spring Boot server &ndash; *if not yet running* &ndash; and executes two HTTP requests (using [`cURL`][curl_cli]) :

<pre style="font-size:80%;">
<b>&gt; <a href="./gs-rest-service/build.bat">build</a> -verbose run</b>
Search for server process with name "gs-rest-service"
Execute request to server "gs-rest-service"
{
    "id": 1,
    "content": "Hello, World!"
}

Execute request to server "gs-rest-service"
{
    "id": 2,
    "content": "Hello, John!"
}
</pre>

Command [**`build`**](./gs-rest-service/build.bat)`stop` terminates the server process :
<pre style="font-size:80%;">
<b>&gt; <a href="./demo/build.bat">build</a> -verbose stop</b>
Search for user process with name "gs-rest-service"
Stop server process "gs-rest-service"
</pre>

> **:mag_right:** We can also launch the Spring Boot server before executing the above HTTP requests :
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/start">start</a> "gs-rest-service" <a href="https://maven.apache.org/ref/current/maven-embedder/cli.html">mvn</a> spring-boot:run</b>
> </pre>
> As a result the server process "`gs-test-service`" is started in a separate window session:
> <pre style="font-size:80%;">
> [...]
> <b>[INFO]</b> Attaching agents: []
>   .   ____          _            __ _ _
>  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
> ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
>  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
>   '  |____| .__|_| |_|_| |_\__, | / / / /
>  =========|_|==============|___/=/_/_/_/
>  :: Spring Boot ::                (v3.3.3)
> [...]
> </pre>

<!--
## <span id="footnotes">Footnotes</span>

<a id="footnote_01">[1]</a> ***grpcurl*** [↩](#anchor_01)

[Command line clients for gRPC - grpcurl](https://sadique.io/blog/2018/04/04/command-line-clients-for-grpc-grpcurl/), April 2018.
-->

<!--
> **:mag_right:** The following command outputs the classpath being used by <a href="https://maven.apache.org/ref/3.6.3/maven-embedder/cli.html">`mvn`</a> into the text file `classpath.txt` :
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://maven.apache.org/ref/current/maven-embedder/cli.html">mvn</a> dependency:build-classpath -Dmdep.outputFile=classpath.txt</b>
> </pre>
<!-- https://stackoverflow.com/questions/16655010/in-maven-how-output-the-classpath-being-used -- >
-->

***

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2024* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[curl_cli]: https://curl.se/docs/manpage.html
