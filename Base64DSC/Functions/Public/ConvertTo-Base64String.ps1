<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function ConvertTo-Base64String
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([String])]
    Param
    (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        $InputObject
    )

    Begin
    {
    }
    Process
    {   
        if($InputObject -isnot [System.Byte[]])
        {
            $InputObject = [System.Text.Encoding]::UTF8.GetBytes($InputObject)
        }
        
        [Convert]::ToBase64String($InputObject)
    }
    End
    {
    }
}