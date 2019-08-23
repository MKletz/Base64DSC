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
        [Byte[]]
        $Bytes,

        [Parameter(Mandatory = $true)]
        [String]
        $Path
    )

    Begin
    {
        $Path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
    }
    Process
    {
        [IO.File]::WriteAllBytes($Path,$Bytes)
    }
    End
    {
    }
}