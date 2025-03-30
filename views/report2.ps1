param()

New-HTML {
    New-HTMLSection -HeaderText 'Report 2: Chart Sample' {
        New-HTMLChart -Title 'Performance Chart' -Type Column -Labels 'Alice', 'Bob', 'Charlie' -DataSet {
            New-ChartData -Name 'Scores' -Data 88, 92, 79
        }
    }
}
