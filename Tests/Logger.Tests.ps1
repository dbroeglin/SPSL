Set-PSDebug -Strict
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$PSScriptRoot\..\SPSL\Logger.ps1"

Describe 'Logger' {
    
    Context 'Default configuration' {
        $Logger = [Logger]::new()
        $TestDate = Get-Date -Year 1984 -Month 11 -Day 3  -Hour 3 -Minute 4 -Second 59
        $FormattedTestDate = Get-Date -Date $TestDate -Format s
        Mock Get-Date { $TestDate }

        "DEBUG", "INFO", "WARN", "ERROR", "FATAL" | ForEach-Object {
            $Level = $_
            It "should write as $Level" {
                Mock Write-Host {} -ParameterFilter { 
                    ("{0} {1,-5} {2}" -f ($FormattedTestDate, $Level, "Message")) -ceq $Object 
                } -Verifiable
                
                $Logger.$Level("Message")
                Assert-VerifiableMocks
            }
        }
    }
}