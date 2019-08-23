configuration CreateBase64File
{
    Import-DscResource -ModuleName Base64ify

    Base64File 'test File'
    {
        Path = "C:\DSC.txt"
        Base64String = "aGFp"
        Force = $True
    }
}