param(
    [Parameter(Mandatory = $true)]
    [string] $CurrentPage,

    [Parameter(Mandatory = $true)]
    [ScriptBlock] $ContentBlock
)

$Pages = @(
    @{ Name = 'Home'; Path = '/'; Icon = 'home' },
    @{ Name = 'Report1'; Path = '/report1'; Icon = 'table' },
    @{ Name = 'Report2'; Path = '/report2'; Icon = 'table' },
    @{ Name = 'Report3'; Path = '/report3'; Icon = 'table' }
)

$authUser = Get-PodeAuthUser

New-HTML -TitleText "Cloud Dashboard" -Online {
    
    # Top navigation bar
    New-HTMLNavTop -Logo 'https://media.datacenterdynamics.com/media/images/Azure-vs-AWS.width-880.png' `
                   -LogoLink "https://cenovus.com" `
                   -HomeLink "http://localhost:8081/home" `
                   -MenuItemsWidth '100px' `
                   -MenuColor White `
                   -MenuColorBackground '#1e1e2f' `
                   -HomeColor 'white' `
                   -HomeColorBackground '#1e1e2f' {

        # Authenticated user dropdown
        New-NavTopMenu -Name "$($authUser.name)" {
            New-NavLink -Name 'Logout' -Href '/logout' -IconSolid sign-out-alt
        }

        # Navigation menus
        foreach ($group in @('Cloud Ops', 'Azure', 'AWS')) {
            New-NavTopMenu -Name $group {
                foreach ($page in $Pages) {
                    New-NavLink -Name $page.Name -Href $page.Path -IconSolid $page.Icon -IconColor '#1e1e2f'
                }
            }
        }
    }

    # Main page content
    & $ContentBlock

    # Footer
    New-HTMLFooter {
        New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-style:italic;' } -Content {
            "📅 Last updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
        }
    }
}
