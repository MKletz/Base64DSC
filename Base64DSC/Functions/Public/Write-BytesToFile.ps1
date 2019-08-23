<#
.Synopsis
   Uses the given bytes to create a file.
.DESCRIPTION
   Uses the given bytes to create a file.
.PARAMETER Bytes
    Array of bytes
.PARAMETER Path
    Path to the file
#>
function Write-BytesToFile
{
    [CmdletBinding()]
    [Alias()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [Bytes[]]
        $Bytes,

        [Parameter(Mandatory = $true)]
        [System.IO.FileInfo]
        $Path
    )

    Begin
    {
    }
    Process
    {
        [IO.File]::WriteAllBytes($Path,$Bytes)
    }
    End
    {
    }
}