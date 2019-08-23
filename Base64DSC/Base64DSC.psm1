[String]$FunctionRoot = Join-Path -Path $PSScriptRoot -ChildPath "Functions" -Resolve

Get-ChildItem -Path $FunctionRoot -Filter "*.ps1" -Recurse | ForEach-Object -Process {
    Write-Verbose -Message "Importing $($_.FullName)"
    . $_.FullName | Out-Null
}