param()

$layoutPath = Join-Path $PSScriptRoot 'layout.ps1'

& $layoutPath -CurrentPage 'Report3' -ContentBlock {

    New-HTMLSection -HeaderText 'Sparklines - Defaults' {
        New-HTMLPanel {
            New-HTMLChart {
                $Categories = @(
                    'Testing1'
                    'Testing2'
                    'Testing3'
                    'Testing4'
                    'Testing5'
                    'Testing6'
                    'Testing7'
                    'Testing8'
                    'Testing9'
                    'Testing10'
                    'Testing11'
                )
                New-ChartAxisX -Type category -Names $Categories
                New-ChartSpark -Name 'Test1' -Value 12, 14, 2, 47, 42, 15, 47, 75, 65, 19, 14 -Color Red
                New-ChartSpark -Name 'Test2' -Value 15, 19, 20, 20, 11, 13, 70, 30, 45, 20, 18 -Color Yellow
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                $Categories = @(
                    'Testing1'
                    'Testing2'
                    'Testing3'
                    'Testing4'
                    'Testing5'
                    'Testing6'
                    'Testing7'
                    'Testing8'
                    'Testing9'
                    'Testing10'
                    'Testing11'
                )
                New-ChartAxisX -Type category -Names $Categories
                New-ChartSpark -Name 'Test1' -Value 12, 14, 2, 47, 42, 15, 47, 75, 65, 19, 14
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartSpark -Name 'Test1' -Value 12, 14, 2, 47, 42, 15, 47, 75, 65, 19, 14
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartSpark -Name 'Test1' -Value 12, 14, 2, 47, 42, 15, 47, 75, 65, 19, 14
            }
        }
    }
}
