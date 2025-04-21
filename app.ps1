Import-Module Pode
Import-Module PSWriteHTML
Import-Module PSParseHTML

Import-PodeModule -Path "$PSScriptRoot/modules/utilities.psm1"

Start-PodeServer {

    Write-PodeHost "Using Pode version: $(Get-PodeVersion)"

    Enable-PodeSessionMiddleware -Duration 120 -Extend
    
    Add-PodeEndpoint -Address * -Port 8081 -Protocol Http    

    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging 

    # 🔐 Azure AD Auth Scheme
    $scheme = New-PodeAuthAzureADScheme `
                -ClientID       $env:AZURE_CLIENT_ID `
                -ClientSecret   $env:AZURE_CLIENT_SECRET `
                -Tenant         $env:AZURE_TENANT_ID `
                -RedirectUrl   'http://localhost:8081'

    $scheme | Add-PodeAuth `
                -Name 'Login' `
                -FailureUrl '/login-failed' `
                -SuccessUrl '/' `
                -ScriptBlock {
                    param($user, $accessToken, $refreshToken, $response)

                    # check if the user is valid
                    return @{ User = $user }
                }
    
                
    # 🔐 Require auth for all routes
    Add-PodeRoute -Method Get -Path '/' -Authentication 'Login' -ScriptBlock {
        $user = Get-PodeAuthUser
        # Write-PodeHtmlResponse -Value "<h1>Welcome $($user.name)</h1>"
        Move-PodeResponseUrl -Url '/home'
                
        Write-PodeHost "/   accessed by: $($user.Name)"
    }
    
    # Optional logout route
    Add-PodeRoute -Method Get -Path '/logout' -ScriptBlock {
        Remove-PodeSession
        Move-PodeResponseUrl -Url '/'
    }

    Add-PodeRoute -Method Get -Path '/debug-user'  -Authentication 'Login' -ScriptBlock {
        if (Test-PodeAuthUser) {
            $authUser = Get-PodeAuthUser
            Write-PodeHost "/debug-user accessed by: $($user.Name)"
            # Convert the user object to JSON for better readability
            $userJson = $authUser | ConvertTo-Json -Depth 5
            Write-PodeHtmlResponse -Value "<pre>$userJson</pre>"
        } else {
            Write-PodeHtmlResponse -Value "Not authenticated"
        }


    }

    Add-PodeRoute -Method Get -Path '/status' -Authentication 'Login' -ScriptBlock {
        $status = @{
            Status      = "Running"
            Server      = $PodeContext.Server.ServerName
            Version     = $PodeContext.Server.Version
            StartTime   = $PodeContext.Timers.StartTime
            Endpoints   = $PodeContext.Server.Endpoints
            Requests    = $PodeContext.Metrics.Requests
            ThreadCount = $PodeContext.Threads.Count
        }
        
        # Convert to JSON and return
        Write-PodeJsonResponse -Value $status
        $user = Get-PodeAuthUser
        Write-PodeHost "/status accessed by: $($user.Name)"
    }
    
    # Load external script containing your functions
    Use-PodeScript -Path "$PSScriptRoot/scripts/utils.ps1"

    Add-PodeRoute -Method Get -Path '/hello' -ScriptBlock {
        $msg = Get-HelloMessage
        Write-PodeTextResponse -Value $msg
    }

    Add-PodeRoute -Method Get -Path '/server-status' -ScriptBlock {
        $status = Get-ServerStatus
        Write-PodeTextResponse -Value $status
    }

    # ===== GROUP ALL AUTHENTICATED ROUTES =====
    Add-PodeRouteGroup -Path '/' -Middleware (Add-PodeAuthMiddleware -Name 'AuthMiddleware' -Authentication 'Login') -Routes {
        # ====== AUTHENTICATED ROUTES ======       
        . "$PSScriptRoot\routes\home.ps1"
        . "$PSScriptRoot\routes\report1.ps1"
        . "$PSScriptRoot\routes\report2.ps1"
        . "$PSScriptRoot\routes\report3.ps1"
    }

}