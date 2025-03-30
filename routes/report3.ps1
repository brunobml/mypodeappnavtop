Add-PodeRoute -Method Get -Path '/report3' -ScriptBlock {
    $html = & (Join-Path $PSScriptRoot '..\views\report3.ps1')
    Write-PodeHtmlResponse -Value $html
}
