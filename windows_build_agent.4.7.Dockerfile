# escape=`
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8
SHELL ["cmd", "/S", "/C"]
WORKDIR /azp
ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\Temp\vs_buildtools.exe
ADD https://aka.ms/vs/16/release/channel C:\Temp\VisualStudio.chman
RUN C:\Temp\vs_buildtools.exe `
    --quiet --wait --norestart --nocache `
    --installPath C:\BuildTools `
    --channelUri C:\Temp\VisualStudio.chman `
    --installChannelUri C:\Temp\VisualStudio.chman `
    --add Microsoft.VisualStudio.Workload.VCTools;includeRecommended `
    --add Microsoft.Component.MSBuild `
    || IF "%ERRORLEVEL%"=="3010" EXIT 0
RUN powershell.exe -ExecutionPolicy RemoteSigned `
  iex (new-object net.webclient).downloadstring('https://get.scoop.sh'); `
  scoop install python git
COPY start.ps1 .
CMD powershell .\start.ps1