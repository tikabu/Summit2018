﻿<#
.SYNOPSIS
.DESCRIPTION
#>
function get-summit {
    [CmdletBinding()]
    param(

    )

    process {
        get-item c:\ | Out-Null

    }
}
