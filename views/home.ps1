param()

New-HTML {
    New-HTMLSection -HeaderText 'Dashboard Portal' {
        New-HTMLText -Text 'Choose a report below:'

        New-HTMLList {
            New-HTMLListItem {
                New-HTMLTag -Tag 'a' -Attributes @{ href = '/report1' } -Content {
                    '🔍 Sample Table Report'
                }
            }
            New-HTMLListItem {
                New-HTMLTag -Tag 'a' -Attributes @{ href = '/report2' } -Content {
                    '📊 Sample Chart Report'
                }
            }
        }
    }
}
