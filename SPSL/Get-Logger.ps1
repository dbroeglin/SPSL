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

    )

    if (-not (Get-Variable -Scope Global -Name SPSLLogger -ErrorAction SilentlyContinue)) {
        $global:SPSLLogger = [Logger]::new()
    } 
    
    $global:SPSLLogger
}