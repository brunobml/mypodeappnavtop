Import-Module Pode
Import-Module PSWriteHTML

Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 8080 -Protocol Http

    . "$PSScriptRoot\routes\home.ps1"
    . "$PSScriptRoot\routes\report1.ps1"
    . "$PSScriptRoot\routes\report2.ps1"
}
