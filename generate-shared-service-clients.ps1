Write-Output "> Installing dotnet-svcutil ..."
dotnet tool install dotnet-svcutil --tool-path dotnet-tools

Write-Output "> Removing previous scaffold ..."
Remove-Item -Force -Recurse MyProject/SharedServiceReference*

$commonArgs = @(
    "--projectFile", "MyProject/MyProject.csproj"
    "--outputDir", "SharedServiceReference"
    "--messageContract"
    "--noLogo"
)

Write-Output "> Generating shared service clients ..."
./dotnet-tools/dotnet-svcutil.exe $commonArgs `
    --outputFile "Services.cs" `
    --namespace "*,MyProject.Services" `
    service-a.wsdl `
    service-b.wsdl `
    service-c.wsdl `
