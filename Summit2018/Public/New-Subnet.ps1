<#
.SYNOPSIS
Takes an ip address and subnet mask and returns details about the subnet
.DESCRIPTION
Takes an ip address and subnet mask and returns details about the subnet
#>
function New-Subnet {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidatePattern('\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b')]
        [string] $Ip,

        [Parameter(Mandatory = $true)]
        [ValidatePattern('\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b')]
        [string] $SubnetMask

    )

    process {
        [TakeIo.NetworkAddress.IpNetworkAddress]::New($Ip, $SubnetMask)

    }
}
