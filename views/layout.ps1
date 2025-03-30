param (
    [ScriptBlock]$ContentBlock
)

New-HTML -TitleText 'My Dashboard' {
    # Header
    New-HTMLSection -Direction 'column' -HeaderText '☰ Cloud Report Menu' -CanCollapse {
        New-HTMLTag -Tag 'div' -Attributes @{ style = 'background-color:#2196f3; color:white; padding:10px;' } -Content {
            New-HTMLTag -Tag 'h2' -Content { '☁️ Cenovus Cloud Dashboard' }
            New-HTMLTag -Tag 'div' -Attributes @{ style = 'text-align:left;' } -Content {
                New-HTMLTag -Tag 'a' -Attributes @{ href = '/' ; style = 'margin-right:15px; color:white;' } -Content { '🏠 Home' }
                New-HTMLTag -Tag 'a' -Attributes @{ href = '/report1'; style = 'margin-right:15px; color:white;' } -Content { '📋 Report 1' }
                New-HTMLTag -Tag 'a' -Attributes @{ href = '/report2'; style = 'color:white;' } -Content { '📊 Report 2' }
            }
        }
    }

    # Main content
    & $ContentBlock

    # Footer
    New-HTMLSection {
        New-HTMLTag -Tag 'div' -Attributes @{ style = 'text-align:center; color:gray; padding:10px; font-size:smaller;' } -Content {
            New-HTMLText -Text "© $(Get-Date -Format yyyy) Cenovus CloudOps"
        }
    }
}
