Add-PodeRoute -Method Get -Path '/home' -ScriptBlock {
    $html = & (Join-Path $PSScriptRoot '..\views\home.ps1')
    Write-PodeHtmlResponse -Value $html

    $user = Get-PodeAuthUser               
    Write-PodeHost "/home   accessed by: $($user.Name)"
}

# Add-PodeRoute -Method Get -Path '/home' -Authentication 'BasicAuth' -ScriptBlock {
#     $html = & (Join-Path $PSScriptRoot '..\views\home.ps1')
#     Write-PodeHtmlResponse -Value $html
# }
