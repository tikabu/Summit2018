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

    Describe "New-Subnet" {
        It "Should throw if ip is not valid" {
            {New-Subnet -Ip "test" -SubnetMask 255.255.255.0} | Should -Throw
        }

        It "Should throw if subnetmask is not valid" {
            {New-Subnet -Ip 192.168.1.1 -SubnetMask test} | Should -Throw
        }

        It "Should return a IPNetworkAddress object if inputs are valid" {
            New-Subnet -Ip 192.168.1.1 -SubnetMask 255.255.255.0 | Should -BeOfType "TakeIo.NetworkAddress.IPNetworkAddress"
        }

    }

}
