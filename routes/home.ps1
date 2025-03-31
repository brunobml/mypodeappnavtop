Add-PodeRoute -Method Get -Path '/' -ScriptBlock {
    $html = & (Join-Path $PSScriptRoot '..\views\home.ps1')
    Write-PodeHtmlResponse -Value $html
}

# Add-PodeRoute -Method Get -Path '/home' -Authentication 'BasicAuth' -ScriptBlock {
#     $html = & (Join-Path $PSScriptRoot '..\views\home.ps1')
#     Write-PodeHtmlResponse -Value $html
# }
