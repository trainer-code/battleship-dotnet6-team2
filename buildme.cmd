dotnet test ./Battleship.GameController.Tests\Battleship.GameController.Tests.csproj /p:CollectCoverage=true /p:CoverletOutputFormat=opencover
dotnet build-server shutdown
dotnet sonarscanner begin /k:"training-dotnet6-template" /d:sonar.host.url=http://localhost:9000 /d:sonar.cs.opencover.reportsPaths="Battleship.GameController.Tests\coverage.opencover.xml" /d:sonar.coverage.exclusions="**Tests*.cs"
dotnet build
dotnet sonarscanner end

