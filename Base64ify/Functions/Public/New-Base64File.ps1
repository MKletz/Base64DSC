<#
.Synopsis
   Creates a new file based on the provided Base64String. This is intended to be a string of bytes retrieved from Get-Base64File.
.DESCRIPTION
   Creates a new file based on the provided Base64String. This is intended to be a string of bytes retrieved from Get-Base64File.
.PARAMETER Path
    Specifies the path of the location of the new item.
.PARAMETER Base64String
    Base64 encoded bytes that represent the file. Can be retrieved from Get-Base64File.
.PARAMETER Force
    Will overwrite the file if it is present.
#>
function New-Base64File
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Path,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Base64String,

        [Switch]
        $Force
    )

    Begin
    {
        $Path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
    }
    Process
    {
        Write-Verbose -Message "Testing if file is present at $($Path)"
        
        if((Test-Path -path $Path) -and !$Force)
        {
            throw "The file '$($Path)' already exists"
        }
        else
        {
            Write-BytesToFile -Path $Path -Bytes ([Convert]::FromBase64String($Base64String))
        }
    }
    End
    {
    }
}