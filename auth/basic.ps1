# basic.ps1
$basic = New-PodeAuthScheme -Basic -Realm 'My Realm'

Add-PodeAuth -Name 'BasicAuth' -Sessionless -Scheme $basic -ScriptBlock {
    param($username, $password)

    if ($username -eq 'admin' -and $password -eq '1234') {
        return @{ User = @{ Name = $username } }
    }

    return @{ Message = 'Invalid login' }
}