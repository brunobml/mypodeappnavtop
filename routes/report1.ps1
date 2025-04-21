Add-PodeRoute -Method Get -Path '/report1' -ScriptBlock {
    $html = & (Join-Path $PSScriptRoot '..\views\report1.ps1')
    Write-PodeHtmlResponse -Value $html

    $user = Get-PodeAuthUser               
    Write-PodeHost "/report1    accessed by: $($user.Name)"
}
