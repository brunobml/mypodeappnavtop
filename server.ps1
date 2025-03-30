Import-Module Pode
Import-Module PSWriteHTML
Import-Module PSParseHTML

Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 8080 -Protocol Http

    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging

    . "$PSScriptRoot\routes\home.ps1"
    . "$PSScriptRoot\routes\report1.ps1"
    . "$PSScriptRoot\routes\report2.ps1"
    . "$PSScriptRoot\routes\report3.ps1"
}
