Add-PodeRoute -Method Get -Path '/report2'  -ScriptBlock {
    $html = & (Join-Path $PSScriptRoot '..\views\report2.ps1')
    Write-PodeHtmlResponse -Value $html

    $user = Get-PodeAuthUser               
    Write-PodeHost "/report2    accessed by: $($user.Name)"
    
}
