param()

$layoutPath = Join-Path $PSScriptRoot 'layout.ps1'

& $layoutPath -CurrentPage 'Home' -ContentBlock {
    New-HTMLSection -CanCollapse -HeaderText '☁️ Welcome to the Cloud Dashboard Portal' {
        New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-size:16px;' } -Content {
            'Your centralized hub for cloud tagging, reporting, and infrastructure insights.'
        }

        New-HTMLSection -Direction 'row' -JustifyContent 'center' -Margin 10 {
            New-HTMLPanel -Width '250px' -BackgroundColor '#f0f4ff' -BorderRadius '15px' -Content {
                New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '🔍 Sample Table Report' }
                New-HTMLTag -Tag 'a' -Attributes @{ 
                    href = '/report1'; 
                    style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                } -Content { 'View Report' }
            }

            New-HTMLPanel -Width '250px' -BackgroundColor '#f0f4ff' -BorderRadius '15px' -Content {
                New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '📊 Sample Chart Report' }
                New-HTMLTag -Tag 'a' -Attributes @{ 
                    href = '/report2'; 
                    style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                } -Content { 'View Report' }
            }
        }

        New-HTMLSection -Margin 15 -Collapsed -CanCollapse {
            New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-style:italic;' } -Content {
                "📅 Last updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
            }
        }
    }
}
