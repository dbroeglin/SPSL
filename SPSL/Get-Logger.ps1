function Get-Logger {
    <#
    .SYNOPSIS
        Returns the Logger

    .DESCRIPTION
        Either returns a Logger already created in this session or creates
        a new one and returns it.

    .EXAMPLE
        $Logger = Get-Logger

    #>
    [CmdletBinding()]
    Param(
        [String]$File
    )

    if (-not (Get-Variable -Scope Global -Name SPSLLogger -ErrorAction SilentlyContinue) -or 
        $Null -eq $global:SPSLLogger) {
        $global:SPSLLogger = [Logger]::new()
        if ($File) {
            $global:SPSLLogger.FilePath = $File
        }
    }
    
    $global:SPSLLogger
}