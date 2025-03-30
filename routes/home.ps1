Add-PodeRoute -Method Get -Path '/' -ScriptBlock {
    $html = & (Join-Path $PSScriptRoot '..\views\home.ps1')
    Write-PodeHtmlResponse -Value $html
}
