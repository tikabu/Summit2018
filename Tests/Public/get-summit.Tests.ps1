$here = (Split-Path -Parent $MyInvocation.MyCommand.Path).Replace("Tests\Public","Summit2018\Public")
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")

. "$here\$sut"

# To make test runable from project root, and from test directory itself. Do quick validation.
if ((Get-Location).Path -match "\\Tests\\Public") {
    $psmPath = (Resolve-Path "..\..\Summit2018\Summit2018.psm1").Path
} else {
    $psmPath = (Resolve-Path ".\Summit2018\Summit2018.psm1").Path
}

Import-Module $psmPath -Force -NoClobber

InModuleScope "Summit2018" {
    get-summit

    Describe "get-summit" {
        It 'Should return text' {
            Get-summit | Should -Be "PowerShell and VSTS rock!!!"
        }


    }

}
