param()

$layoutPath = Join-Path $PSScriptRoot 'layout.ps1'

& $layoutPath -ContentBlock {
    New-HTMLSection -HeaderText 'Chart' {
        New-HTMLChart -Title 'OneDrive Utilization' -TitleAlignment center {
            New-ChartLegend -LegendPosition bottom
            New-ChartDonut -Name 'OneDrive Utilization' -Value 15 -Color '#6dbf88'
            New-ChartDonut -Name 'Not Utilized' -Value 20 -Color Yellow
        }
    }
}
