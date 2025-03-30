param()

$layoutPath = Join-Path $PSScriptRoot 'layout.ps1'

& $layoutPath -ContentBlock {
    New-HTMLSection -HeaderText 'Welcome to the Cloud Dashboard Portal' {
        New-HTMLText -Text 'Choose a report below:'

        # FIXED: right-aligned links using a styled div inside a section
        New-HTMLSection {
            New-HTMLTag -Tag 'div' -Attributes @{ style = 'text-align:right;' } -Content {
                New-HTMLTag -Tag 'a' -Attributes @{ href = '/report1'; style = 'text-decoration:none; color:blue; font-weight:bold; margin-right: 10px;' } -Content { '🔍 Sample Table Report' }
                New-HTMLTag -Tag 'a' -Attributes @{ href = '/report2'; style = 'text-decoration:none; color:blue; font-weight:bold;' } -Content { '📊 Sample Chart Report' }
            }
        }
    }
}
