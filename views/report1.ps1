param()

New-HTML {
    New-HTMLSection -HeaderText 'Report 1: Table Sample' {
        New-HTMLTable -DataTable @(
            @{ Name = 'Alice'; Score = 88 }
            @{ Name = 'Bob'; Score = 92 }
            @{ Name = 'Charlie'; Score = 79 }
        )
    }
}
