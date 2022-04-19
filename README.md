# Build the application 
In the root folder of the application there is a Battleship.sln which can be used to build all projects by executing
```bash
dotnet build 
```

# Run the application

## Running locally
You neet to have the .NET6 SDK runtime installed on your local machine
https://www.microsoft.com/net/download

You can now run the game with
```bash
dotnet run --project ./Battleship.Ascii/Battleship.Ascii.csproj
```


## Running within a docker container
You can easily run the game within a docker container.

Change into the Battleship folder

```bash
docker run -it -v ${PWD}:/battleship mcr.microsoft.com/dotnet/sdk:6.0 bash
```

This starts a new container and maps your current folder on your host machine as the folder battleship in your container and opens a bash console. In bash then change to the folder battleship/Battleship.Ascii and run
```bash
dotnet run 
```


## Running within a DevContainer
DevContainers are a way to run your development environment inside of an Docker container. 
The container contains all frameworks, tools etc. to develop and run the application.
If you open the folder of this repo in VS Code, it asks if you want to run this insiede a DevContainer. 
If you agree, VS Code will run inside this container with the needed extensions and frameworks.

See [Developing inside a Container](https://code.visualstudio.com/docs/remote/containers) for more information on local container development with VS Code.

Prerequisites:
* Docker
* Visual Studio Code


## Running within GitHub CodeSpaces
You can also use GitHub CodeSpaces to run the development environment completely in a browser. 

See [Introduction to CodeSpaces](https://docs.github.com/en/codespaces) for more information about using GitHub Codespaces.

# Execute Tests
You can run tests on the console by using
```bash
dotnet test 
```

If you want to run tests within VSCode, you can install the [.NET Core Test Explorer Extension](https://marketplace.visualstudio.com/items?itemName=formulahendry.dotnet-test-explorer). In this case make sure, you set the Propery "Test Project Path" in the extension setting to this value:
```bash
**/*[Test|ATDD]*/*.csproj
```


## Step 1: Install sonarqube docker first
```
docker run -d --name sonarqube -p 9000:9000 sonarqube
```
## Step 2: Configure sonar locally
```
open sonarqube in browser http://localhost:9000, initially enter admin/admin as username/password. Sonarqube will ask you
to change password. Select a suitable new password.
```

## Step 3: Create project in sonarqube and use 'manually' as option

Enter battleship:csharp as project display name and key name

## Step 4:  Click Setup and download sonarqube scanner

You can select your OS. If you select Windows, you will get a command like following
```
dotnet sonarscanner end /d:sonar.login="<Key name>"
```

## Step 5: Display results
Open http://localhost:9000/projects and find battleship:csharp project
 
# Telemetry data
This application is collecting telemetry data with Microsoft Application Insights.
For more details see https://docs.microsoft.com/en-us/azure/azure-monitor/app/console.

To send the telemetry data to a specific instance of Application Insights, the connection string has to be adjusted in ApplicationInsights.config.
