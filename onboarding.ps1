param (
    [string]$username,
    [string]$fullname,
    [string]$action # "onboard" or "offboard"
)

if ($action -eq "onboard") {
    # Create a new user
    New-LocalUser -Name $username -FullName $fullname -Password (Read-Host -AsSecureString "Enter Password")
    Add-LocalGroupMember -Group "Users" -Member $username
    Write-Output "User $username onboarded successfully."
} elseif ($action -eq "offboard") {
    # Disable user account
    Disable-LocalUser -Name $username
    Write-Output "User $username offboarded (account disabled)."
} else {
    Write-Output "Invalid action. Use 'onboard' or 'offboard'."
}
