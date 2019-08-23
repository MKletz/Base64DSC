<#
.Synopsis
   Verifies if a file exists at the given path for use in ValidateScripts.
.DESCRIPTION
   Verifies if a file exists at the given path for use in ValidateScripts.
.PARAMETER Path
    The path to test.
#>
function Test-PathParameter
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([Boolean])]
    Param
    (
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
        [Boolean]$Return = $true

        if(!($Path | Test-Path) )
        {
            throw "File does not exist"
            $Return = $false

        }
        elseif(!($Path | Test-Path -PathType Leaf) )
        {
            throw "The Path argument must be a file."
            $Return = $false
        }

        $true
    }
    End
    {
    }
}