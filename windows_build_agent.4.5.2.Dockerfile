FROM mcr.microsoft.com/windows/servercore:ltsc2019
WORKDIR /azp
RUN @powershell -NoProfile -ExecutionPolicy Bypass -Command "$env:ChocolateyUseWindowsCompression='false'; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
RUN powershell add-windowsfeature web-asp-net45 \
    && choco install dotnet4.5.2 --allow-empty-checksums -y 
RUN choco install visualcpp-build-tools -version 14.0.25420.1 -y
RUN setx /M PATH "%PATH%;C:\Program Files (x86)\MSBuild\14.0\bin"
RUN msbuild -version    
COPY start.ps1 .
CMD powershell .\start.ps1