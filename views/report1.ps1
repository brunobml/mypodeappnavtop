param()

$layoutPath = Join-Path $PSScriptRoot 'layout.ps1'

& $layoutPath -CurrentPage 'Report1' -ContentBlock {
    New-HTMLSection -CanCollapse -HeaderText 'Report 1: Sample Table' {
        New-HTMLTable -DataTable @(
            @{ Name = 'Alice'; Age = 30 }
            @{ Name = 'Bob'; Age = 35 }
            @{ Name = 'Charlie'; Age = 42 }
        )
    }
}
