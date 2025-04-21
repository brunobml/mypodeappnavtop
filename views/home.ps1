#home.ps1
# This file is part of the Cloud Dashboard Portal project.
# /routes/home.ps1
param()

$layoutPath = Join-Path $PSScriptRoot 'layout.ps1'

& $layoutPath -CurrentPage 'Home' -ContentBlock {
    New-HTMLSection -HeaderTextSize 15px -HeaderText '☁️ Welcome to the Cloud Dashboard Portal' -HeaderBackGroundColor '#1e1e2f' {   
        
        New-HTMLSection -Direction column -JustifyContent 'center' -Margin 10 -HeaderBackGroundColor RoyalBlue -HeaderText 'AZURE'{
            
            New-HTMLContainer  {

                $report1Count = 143  # This is your dynamic KPI

                New-HTMLPanel -AlignContentText center -BackgroundColor 'AliceBlue' -BorderRadius '15px' -Content {

                    New-HTMLTag -Tag 'p' -Attributes @{
                        #style = 'text-align:center; font-weight:bold; margin-top:0;'
                        style = 'font-weight:bold;'
                    } -Content {
                        '💻 Virtual Machines'
                    }

                    New-HTMLTag -Tag 'p' -Attributes @{
                       # style = 'text-align:center; font-size:32px; font-weight:bold; color:#0078D7; margin-bottom:5px;'
                       style = 'font-size:40px; font-weight:bold; color:RoyalBlue; '
                    } -Content {
                        "$report1Count"  # Show the KPI number in big bold text
                    }

                    New-HTMLTag -Tag 'a' -Attributes @{
                        href = '/report1'
                       # style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;'
                    } -Content {
                        'View Report'
                    }
                }

                $test = @(
                        @{ datetime = 'May 03 08:10:22'; participantNumber = 6 }
                        @{ datetime = 'May 06 10:51:58'; participantNumber = 15 }
                        @{ datetime = 'May 08 09:40:55'; participantNumber = 2 }
                        @{ datetime = 'May 11 12:09:04'; participantNumber = 18 }
                        @{ datetime = 'May 14 00:36:06'; participantNumber = 1 }
                        @{ datetime = 'May 17 04:13:46'; participantNumber = 11 }
                        @{ datetime = 'May 18 17:57:19'; participantNumber = 3 }
                        @{ datetime = 'May 22 22:59:21'; participantNumber = 10 }
                        @{ datetime = 'May 24 07:29:10'; participantNumber = 1 }
                        @{ datetime = 'May 26 13:22:50'; participantNumber = 8 }
                        @{ datetime = 'May 29 06:05:37'; participantNumber = 3 }
                        @{ datetime = 'June 03 16:27:49'; participantNumber = 1 }
                        @{ datetime = 'June 04 02:46:37'; participantNumber = 10 }
                        @{ datetime = 'June 06 13:42:35'; participantNumber = 2 }
                        @{ datetime = 'June 08 06:28:39'; participantNumber = 4 }
                        @{ datetime = 'June 09 01:16:53'; participantNumber = 5 }
                        @{ datetime = 'June 12 17:07:18'; participantNumber = 0 }
                        @{ datetime = 'June 15 19:20:39'; participantNumber = 4 }
                        @{ datetime = 'June 19 14:17:36'; participantNumber = 16 }
                        @{ datetime = 'June 20 23:36:08'; participantNumber = 9 }
                        @{ datetime = 'June 21 10:12:02'; participantNumber = 17 }
                        @{ datetime = 'June 24 20:30:00'; participantNumber = 14 }
                        @{ datetime = 'June 27 07:38:54'; participantNumber = 11 }
                        @{ datetime = 'June 29 00:05:14'; participantNumber = 0 }
                        @{ datetime = 'July 01 06:48:57'; participantNumber = 7 }
                        @{ datetime = 'July 04 01:51:25'; participantNumber = 13 }
                        @{ datetime = 'July 06 14:03:14'; participantNumber = 7 }
                        @{ datetime = 'July 07 18:51:12'; participantNumber = 20 }
                        @{ datetime = 'July 09 20:34:00'; participantNumber = 17 }
                        @{ datetime = 'July 11 23:30:33'; participantNumber = 6 }
                        @{ datetime = 'July 13 05:33:32'; participantNumber = 19 }
                        @{ datetime = 'July 14 21:38:15'; participantNumber = 18 }
                        @{ datetime = 'July 17 15:44:43'; participantNumber = 5 }
                        @{ datetime = 'July 21 16:19:47'; participantNumber = 3 }
                        @{ datetime = 'July 23 03:39:41'; participantNumber = 9 }
                        @{ datetime = 'July 25 07:14:11'; participantNumber = 0 }
                        @{ datetime = 'July 29 12:15:30'; participantNumber = 8 }
                        @{ datetime = 'August 03 07:08:20'; participantNumber = 19 }
                        @{ datetime = 'August 05 21:05:28'; participantNumber = 2 }
                        @{ datetime = 'August 08 04:26:45'; participantNumber = 9 }
                        @{ datetime = 'August 09 19:11:42'; participantNumber = 4 }
                        @{ datetime = 'August 10 11:58:12'; participantNumber = 7 }
                        @{ datetime = 'August 11 11:25:54'; participantNumber = 12 }
                        @{ datetime = 'August 12 02:03:16'; participantNumber = 0 }
                        @{ datetime = 'August 15 22:32:48'; participantNumber = 6 }
                        @{ datetime = 'August 16 10:49:01'; participantNumber = 15 }
                        @{ datetime = 'August 19 23:00:59'; participantNumber = 13 }
                        @{ datetime = 'August 22 15:43:29'; participantNumber = 12 }
                        @{ datetime = 'August 26 05:18:27'; participantNumber = 14 }
                        @{ datetime = 'August 27 09:45:03'; participantNumber = 20 }
                )


    
                New-HTMLPanel -BackgroundColor AliceBlue -BorderRadius 15px -Content {
                    # New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '📊 Sample Chart Report' }
                    New-HTMLChart {
                        New-ChartAxisX -Name $test.datetime
                        ChartLegend -Name 'Calls Number'
                        New-ChartLine -Name 'Participants Number' -Value $test.participantNumber -Color RoyalBlue
                        New-ChartAxisY -Show -TitleText 'Calls'
                    }
                    New-HTMLTag -Tag 'a' -Attributes @{ 
                        href = '/report2'; 
                        style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                    } -Content { 'View Report' }
                }
            }

            New-HTMLContainer {
                New-HTMLPanel -BackgroundColor AliceBlue -BorderRadius 15px -Content {
                    New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '🔍 Sample Table Report' }
                    New-HTMLTag -Tag 'a' -Attributes @{ 
                        href = '/report1'; 
                        style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                    } -Content { 'View Report' }
                }
    
                New-HTMLPanel -BackgroundColor AliceBlue -BorderRadius 15px -Content {
                    New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '📊 Sample Chart Report' }
                    New-HTMLTag -Tag 'a' -Attributes @{ 
                        href = '/report2'; 
                        style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                    } -Content { 'View Report' }
                }
            }

           
        }

        New-HTMLSection -Direction column -JustifyContent 'center' -Margin 10 -HeaderBackGroundColor DarkOrange -HeaderText 'AWS' {

            New-HTMLContainer {
                New-HTMLPanel -BackgroundColor SeaShell -BorderRadius 15px -Content {
                    New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '🔍 Sample Table Report' }
                    New-HTMLTag -Tag 'a' -Attributes @{ 
                        href = '/report1'; 
                        style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                    } -Content { 'View Report' }
                }
    
                New-HTMLPanel -BackgroundColor SeaShell -BorderRadius 15px -Content {
                    New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '📊 Sample Chart Report' }
                    New-HTMLTag -Tag 'a' -Attributes @{ 
                        href = '/report2'; 
                        style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                    } -Content { 'View Report' }
                }
            }

            New-HTMLContainer {
                New-HTMLPanel -BackgroundColor SeaShell -BorderRadius 15px -Content {
                    New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '🔍 Sample Table Report' }
                    New-HTMLTag -Tag 'a' -Attributes @{ 
                        href = '/report1'; 
                        style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                    } -Content { 'View Report' }
                }
    
                New-HTMLPanel -BackgroundColor SeaShell -BorderRadius 15px -Content {
                    New-HTMLTag -Tag 'p' -Attributes @{ style = 'text-align:center; font-weight:bold;' } -Content { '📊 Sample Chart Report' }
                    New-HTMLTag -Tag 'a' -Attributes @{ 
                        href = '/report2'; 
                        style = 'display:block; text-align:center; margin-top:10px; font-weight:bold; color:#085fd1; text-decoration:none;' 
                    } -Content { 'View Report' }
                }
            }            
        }
    }
} 
