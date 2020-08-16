<#
# Example:
Register-PSFTeppScriptblock -Name "NewPassword.alcohol" -ScriptBlock { 'Beer','Mead','Whiskey','Wine','Vodka','Rum (3y)', 'Rum (5y)', 'Rum (7y)' }
#>

Register-PSFTeppScriptblock -Name "GetPasswordParameters.settings" -ScriptBlock { 'UseSpecialCharacters', 'UseUpperCaseCharacters', 'UseSpecialLetters' }

