function New-Password {
    <#
    .SYNOPSIS
        Generate a random password

    .DESCRIPTION
        This is a simple password generated that will use special characters, special numbers and special letters.

    .PARAMETER Length
        Length of the password to be generated

    .PARAMETER UseSpecialChars
        Switch to indicate to use special characters

    .PARAMETER UseSpecialLetters
        Switch to indicate to use special letters

    .PARAMETER UseUpperCase
        Switch to indicate to use upper case letters

    .PARAMETER UseNumbers
        Switch to indicate to use numbers

    .EXAMPLE
        C:\> New-Password -Length 15

    .EXAMPLE
        C:\> New-Password -Length 15 -UseSpecialChars

    .EXAMPLE
        C:\> New-Password -Length 15 -UseSpecialChars -UseSpecialLetters

    .EXAMPLE
        C:\> New-Password -Length 15 -UseSpecialChars -UseSpecialLetters -UseUpperCase

    .EXAMPLE
        C:\> New-Password -Length 15 -UseSpecialChars -UseSpecialLetters -UseUpperCase -UserNumbers

    .NOTES
        None
    #>

    [cmdletbinding()]
    Param(
        [Parameter(Mandatory = $True, HelpMessage = "Indicate the word length between 1 and 25.")]
        [ValidateRange(1, 25)]
        [int]$Length,
        [switch]
        $UseSpecialChars,
        [switch]
        $UseSpecialLetters,
        [switch]
        $UseUpperCase,
        [switch]
        $UseNumbers
    )

    begin {
        $lowerCaseletters = [Char[]]'abcdefghijklmnopqrstuvwxyz'
        $upperCaseletters = [Char[]]'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        $specialLetters += [Char]0x00EB, [Char]0x00E4, [Char]0x00E9 # Add some diacritical characters
        $specialCharacters = [char[]](33..47), [char[]](59..64), [char[]](91..96)
        $numbers = (48..58)
        $password += $lowerCaseletters
    }

    process {
        if ($UseSpecialChars) { $password += $specialCharacters }
        if ($UseSpecialLetters) { $password += $specialLetters }
        if ($UseUpperCase) { $password += $upperCaseletters }
        if ($UseNumbers) { $password += $numbers }
        $password = -join ( $password | Get-Random -count $Length) # Default is just lower case letters
        Write-PSFMessage -Level Host -Message 'New Password is <c="yellow">{0}</c>' -StringValues $password
    }
}