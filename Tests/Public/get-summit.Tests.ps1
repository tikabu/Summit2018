$moduleName = ($MyInvocation.MyCommand.Path -split '\\')[-4]
$here = (Split-Path -Parent $MyInvocation.MyCommand.Path).Replace("Tests\Public","$moduleName\Public")
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")

. "$here\$sut"

# To make test runable from project root, and from test directory itself. Do quick validation.
if ((Get-Location).Path -match "\\Tests\\Public") {
    $psmPath = (Resolve-Path "..\..\$moduleName\$moduleName.psm1").Path
} else {
    $psmPath = (Resolve-Path ".\$moduleName\$moduleName.psm1").Path
}

Import-Module $psmPath -Force -NoClobber

InModuleScope "$moduleName" {
    get-summit

    Describe "get-summit" {
        It 'Passing test' {
            1 | Should -Be 1
        }


    }

}
