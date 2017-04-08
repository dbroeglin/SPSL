Set-PSDebug -Strict
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$PSScriptRoot\..\SPSL\Logger.ps1"
. "$PSScriptRoot\..\SPSL\$sut"

Describe "Get-Logger" {
    $Logger = Get-Logger

    It "should be of type Logger" {
        # For some reason BeOfType does not work here
        $Logger.GetType() | Should Be Logger
    }

    It "should return the same Logger" {
        (Get-Logger) | Should Be $Logger
    }

    AfterAll {
        Remove-Variable -Scope Global -Name SPSLLogger
    }
}

Describe "Get-Logger -File " {
    $LogFileName = Join-Path $TestDrive "test.log"
    $Logger = Get-Logger -File $LogFileName

    It "should be of type Logger" {
        # For some reason BeOfType does not work here
        $Logger.GetType() | Should Be Logger
    }

    It "should return the same Logger" {
        (Get-Logger) | Should Be $Logger
    }

    It "should log to test.log" {
        $Logger.info("Hello World")
        $LogFileName | Should Contain "Hello world"
    }

    AfterAll {
        Remove-Variable -Scope Global -Name SPSLLogger
    }
}