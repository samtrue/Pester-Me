    $here = Split-Path -Parent $MyInvocation.MyCommand.Path
    .  "$here\pester-me.utils.ps1"

Describe -Tags "Utils" "pester-me utils" {
    It "should replace .ps1 with Test.ps1" {

        $result = convert-ToTestPath "c:\myfunctions.ps1"
        $result | Should Be "c:\myfunctions.Tests.ps1"
    }s

    It "should not replace if Tests.ps1 is at end"{

        $result = convert-ToTestPath "c:\myfunctions.Tests.ps1"
        $result | Should Be "c:\myfunctions.Tests.ps1"   
    }

}