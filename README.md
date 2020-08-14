# Description

This is a simple password generator

### Getting Started with NewPassword
1. Place the NewPassword directory in your modules directory

> This will place the NewPassword module into your local PowerShell module path.

2. Run the following command:

```powershell
Import-Module NewPassword
```

> This will import the New-Password module into your local PowerShell session.

At this point you have loaded the NewPassword module and you are ready to create new passwords.

### Example
```powershell
C:\> New-Password -Length 15
C:\> New-Password -Length 15 -UseSpecialChars
C:\> New-Password -Length 15 -UseSpecialChars -UseSpecialLetters
C:\> New-Password -Length 15 -UseSpecialChars -UseSpecialLetters -UseUpperCase
C:\> New-Password -Length 15 -UseSpecialChars -UseSpecialLetters -UseUpperCase -UserNumbers
```

Enjoy!
