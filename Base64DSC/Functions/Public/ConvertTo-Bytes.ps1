<#
.Synopsis
   Converts a given Base64 formatted string into a byte array.
.DESCRIPTION
   Converts a given Base64 formatted string into a byte array.
.PARAMETER Base64String
    Base64 encoded bytes that represent the file. Can be retrieved from ConvertTo-Base64String.
#>
function ConvertTo-Bytes
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([Byte[]])]

    Param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Base64String
    )

    Begin
    {
    }
    Process
    {
        [Convert]::FromBase64String($Base64String)
    }
    End
    {
    }
}