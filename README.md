# SPSL PowerShell module

Module SPSL has been generated with Forge.

# Installation

    Install-Module SPSL

# Getting started

Add the following to your main script:

    $Logger = Get-Logger -File "/tmp/app.log"

And then use the `$Logger` object to emit your log events:

    $Logger.info("Starting application...")
    $Logger.debug("Processing foo...")
    $Logger.error("Error while processing foo!")
    $Logger.info("Stopping application.")