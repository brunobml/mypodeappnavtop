Import-Module Pode
Import-Module PSWriteHTML
Import-Module PSParseHTML

Import-PodeModule -Path "$PSScriptRoot/modules/utilities.psm1"

Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 8080 -Protocol Http

    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging 
    
    # Load external script containing your functions
    Use-PodeScript -Path "$PSScriptRoot/scripts/utils.ps1"

    Add-PodeRoute -Method Get -Path '/hello' -ScriptBlock {
        $msg = Get-HelloMessage
        Write-PodeTextResponse -Value $msg
    }

    Add-PodeRoute -Method Get -Path '/status' -ScriptBlock {
        $status = Get-ServerStatus
        Write-PodeTextResponse -Value $status
    }
    
    

    . "$PSScriptRoot\routes\home.ps1"
    . "$PSScriptRoot\routes\report1.ps1"
    . "$PSScriptRoot\routes\report2.ps1"
    . "$PSScriptRoot\routes\report3.ps1"
}


### BASIC AUTHENTICATION ###
# This example shows how to use Pode's built-in Basic Authentication.
# This is a simple example of how to use Pode's built-in Basic Authentication.

# Import-Module Pode
# Import-Module PSWriteHTML

# Start-PodeServer {
#     Add-PodeEndpoint -Address * -Port 8080 -Protocol Http

#     # Logging (optional)
#     New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging

#     # Enable it globally for all routes (optional)
#     Use-PodeAuth -Path "$PSScriptRoot/auth"

#     # Example route that now requires authentication
#     Add-PodeRoute -Method Get -Path '/' -Authentication 'BasicAuth' -ScriptBlock {
#         # $user = Get-PodeAuthUser
#         # Write-PodeTextResponse -Value "Welcome, $($user.Name) 👋"
#         Move-PodeResponseUrl -Url '/home'
#     }

#     . "$PSScriptRoot\routes\home.ps1"
#     . "$PSScriptRoot\routes\report1.ps1"
#     . "$PSScriptRoot\routes\report2.ps1"
#     . "$PSScriptRoot\routes\report3.ps1" 
    
# }