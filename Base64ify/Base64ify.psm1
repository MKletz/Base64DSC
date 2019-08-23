[String]$FunctionRoot = Join-Path -Path $PSScriptRoot -ChildPath "Functions" -Resolve

Get-ChildItem -Path $FunctionRoot -Filter "*.ps1" -Recurse | ForEach-Object -Process {
    Write-Verbose -Message "Importing $($_.FullName)"
    . $_.FullName | Out-Null
}

[DscResource()]
class Base64File
{    
    [DscProperty(Key)]
    [string]$Path

    [DscProperty(Mandatory)]
    [string]$Base64String

    [DscProperty()]
    [Boolean]$Force = $false

    [Base64File]Get()
    {   
        [System.IO.FileInfo]$File = $this.Path

        if($File.Exists)
        {
            $ExistingBase64 = Get-Base64File -Path $File
        }
        else
        {
            $ExistingBase64 = [String]::Empty
        }

        $Return = @{
            Exists = $File.Exists
            Base64String = $ExistingBase64
            Match = $ExistingBase64 -eq $this.Base64String
        }

        return $Return
    }

    [bool]Test()
    {
        $Test = $False
        [System.IO.FileInfo]$File = $this.Path

        if(!$File.Exists)
        {
            Write-Verbose -Message "File does not exist. Action required."
            $Test = $false
        }
        elseif($File.Exists -and !$this.Force)
        {
            $Test = $True
        }
        elseif($File.Exists -and $this.Force)
        {
            Write-Verbose -Message "File exists at path checking if content matches."
            $ExistingBase64 = Get-Base64File -Path $this.Path

            if($ExistingBase64 -eq $this.Base64String)
            {
                Write-Verbose -Message "Existing file's base64 value matches supplied value. No action required."
                $Test = $True
            }
            else
            {
                Write-Verbose -Message "Existing file's base64 value does not match supplied value. Action required."
                $Test = $false
            }
        }
        
        return $Test
    }

    [void]Set()
    {        
        New-Base64File -Path $this.Path -Base64String $this.Base64String -Force:$this.Force
    }
}