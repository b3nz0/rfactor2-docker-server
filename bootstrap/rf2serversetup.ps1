# All credit goes to https://github.com/afloesch/rfactor2-server-setup
$workDir="C:\"
$steamcmdURL="https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
# install steamcmd
cd $workDir
Invoke-WebRequest -Uri "$steamcmdURL" -OutFile ".\steamcmd.zip"
Expand-Archive .\steamcmd.zip -DestinationPath .\steamcmd
rm ./steamcmd.zip
# fetch rFactor2 dedicated server and a couple test assets
cd .\steamcmd
./steamcmd +login anonymous +force_install_dir ..\rfactor2-dedicated +app_update 400300 +quit
./steamcmd +login anonymous +workshop_download_item 365960 951986312 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1782911839 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2736021728 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1961493725 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2736075175 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2111766389 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1628206724 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1629100532 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1629067802 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1629142012 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1629177826 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1629165420 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2736019095 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2098773157 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2736009471 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2069376958 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2736015837 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2736012574 +quit
./steamcmd +login anonymous +workshop_download_item 365960 788866138 +quit
./steamcmd +login anonymous +workshop_download_item 365960 587034279 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2206725222 +quit
./steamcmd +login anonymous +workshop_download_item 365960 2857238855 +quit
./steamcmd +login anonymous +workshop_download_item 365960 951986312 +quit
./steamcmd +login anonymous +workshop_download_item 365960 3003499664 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1885152462 +quit
cp .\steamapps\workshop\content\365960\*\*.rfcmp $workDir\rfactor2-dedicated\Packages\
# copy executables into root
cd ..\rfactor2-dedicated
cp .\Support\Tools\MAS2.exe .\MAS2.exe
cp .\Bin64\ModMgr.exe .\ModMgr.exe
cp ".\Bin64\rFactor2 Dedicated.exe" ".\rFactor2 Dedicated.exe"

# Copy Steam client DLLs from steamcmd to rfactor2-dedicated (fix for Steam connectivity issues)
Write-Output "Copying updated Steam client DLLs from steamcmd to rfactor2-dedicated..."
$steamDlls = @(
    "steamclient.dll",
    "steamclient64.dll", 
    "tier0_s.dll",
    "tier0_s64.dll",
    "vstdlib_s.dll",
    "vstdlib_s64.dll"
)

foreach ($dll in $steamDlls) {
    $sourcePath = "$workDir\steamcmd\$dll"
    $destPath = "$workDir\rfactor2-dedicated\$dll"
    
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $destPath -Force
        Write-Output "Copied $dll"
    } else {
        Write-Warning "Could not find $dll in steamcmd directory"
    }
}

# setup firewall rules
New-NetFirewallRule -Program "C:\rfactor2-dedicated\rFactor2 Dedicated.exe" -Action Allow -Profile Public,Private -Direction Inbound -DisplayName "rFactor2 Server" -Description "Allow rFactor2 Server connections"
New-NetFirewallRule -Program "C:\rfactor2-dedicated\rFactor2 Dedicated.exe" -Action Allow -Profile Public,Private -Direction Outbound -DisplayName "rFactor2 Server" -Description "Allow rFactor2 Server outbound connections"
Write-Output "Success! rFactor2 dedicated server is available in " + $workDir + "rfactor2-dedicated\"
Write-Output "Steam client DLLs have been updated to fix connectivity issues in virtualized environments."
Start-Sleep -s 3