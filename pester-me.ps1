
param(

        $watch_path = "Tests", 
        [switch]$run_changed_only,
        [string]$Tags = $null

    )

$here = (Split-Path -parent $MyInvocation.MyCommand.Definition)
. $here\modules\pswatch.ps1
. $here\Functions\pester-me.utils.ps1

$test_path = "$here\$watch_path"

write-host "Whatching Here: $test_path `n" -Fore Yellow

watch $test_path | %{

    Write-Host "$($_.Path) has changed!" -Fore Magenta
    
    if($run_changed_only){

        $test_path = convert-ToTestPath $_.Path     #run tests only for scripts
    }
    
    Import-Module -name ("$here\modules\Pester\Pester.psm1")  -ErrorAction stop
    Invoke-Pester -relative_path $test_path 
    
}

<#
[Parameter(Position=0,Mandatory=0)]
            [string]$relative_path = ".",
            [Parameter(Position=1,Mandatory=0)]
            [string]$testName = $null, 
            [Parameter(Position=2,Mandatory=0)]
            [switch]$EnableExit, 
            [Parameter(Position=3,Mandatory=0)]
            [string]$OutputXml = 'test.xml',
            [Parameter(Position=4,Mandatory=0)]
            [string]$Tags = $null,
            [string]$startUrl = "http://qa.win.mercer.com/v3/"
#>
