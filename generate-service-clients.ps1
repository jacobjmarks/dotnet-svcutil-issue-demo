Write-Output "> Installing dotnet-svcutil ..."
dotnet tool install dotnet-svcutil --tool-path dotnet-tools

Write-Output "> Removing previous scaffold ..."
Remove-Item -Force -Recurse MyProject/ServiceReference*

$commonArgs = @(
    "--projectFile", "MyProject/MyProject.csproj"
    "--outputDir", "ServiceReference"
    "--messageContract"
    "--noLogo"
)

Write-Output "> Generating service A client ..."
./dotnet-tools/dotnet-svcutil.exe $commonArgs `
    --outputFile "ServiceA.cs" `
    --namespace "*,MyProject.ServiceA" `
    service-a.wsdl

Write-Output "> Generating service B client ..."
./dotnet-tools/dotnet-svcutil.exe $commonArgs `
    --outputFile "ServiceB.cs" `
    --namespace "*,MyProject.ServiceB" `
    service-b.wsdl

Write-Output "> Generating service C client ..."
./dotnet-tools/dotnet-svcutil.exe $commonArgs `
    --outputFile "ServiceC.cs" `
    --namespace "*,MyProject.ServiceC" `
    service-c.wsdl
