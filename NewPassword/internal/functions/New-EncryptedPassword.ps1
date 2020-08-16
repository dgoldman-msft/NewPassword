function New-EncryptedPassword {
    <#
    .SYNOPSIS
        Function to encrypt password

    .DESCRIPTION
        This function will take a 32 bit EAS key, encrypt a secure password and save to disk.

    .PARAMETER Password
        Randomly generated password

    .NOTES
        None
    #>

    [CmdletBinding()]
    param (
        [Parameter()]
        [securestring]
        $Password
    )

    begin {
        $path = Get-PSFConfigValue -FullName 'NewPassword.SaveFilePath'
        $pwFile = Get-PSFConfigValue -FullName 'NewPassword.PasswordFileName'
        $keyFile = Get-PSFConfigValue -FullName 'NewPassword.KeyFileName'
        # Creating AES key with random data and export to file
        Write-PSFMessage -Level Verbose -Message "Generating AES Key" -FunctionName Internal
        $Key = New-Object Byte[] 32 # You can use 16, 24, or 32 for AES
    }
    process {
        if (-NOT $path) { $path = 'c:\temp' }
        if (-NOT $pwFile) { $pwFile = 'NewPassword.txt' }
        if (-NOT $keyFile) { $keyFile = 'AESKey.txt' }
        [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
        Write-PSFMessage -Level Verbose -Message "Saving AESKey to {0}" -StringValues $path$keyFile -FunctionName Internal
        $Key | out-file $KeyFile

        # Creating SecureString object
        $Key = Get-Content $KeyFile
        $Password | ConvertFrom-SecureString -key $Key | Out-File $pwFile
        Write-PSFMessage -Level Verbose -Message "Saving credentials file to: {0} and AES Key to {1}" -StringValues $path$pwFile, $path$keyFile -FunctionName Internal
    }
}