So I was wanting to create a .gitignore file for one of my other repositories and I was sticking in PowerShell, when I realized I didn't know how to create a file within PowerShell. So I looked it up and I thought that the way to do it was dumb the normal way requires this long command to memorize and I didn't like that so I decided to make my own script to speed it up.

Normal PowerShell Create a File
```powershell
New-Item -Path path -ItemType File
```

This script I made is made to speed up the process of creating a file within powershell. What is does is it creates the function called New-File. Then define the 2 parameters within this file: The File to Create and the Help. I added the help as I have been more comfortable in linux command lines so the help makes my life easier when I inevitably forget the Get-Help command. The File to Create or as Called in the Script "$Dest" is the file you want to create. In my example I used the path "C:\mycrazyfile.txt" The script would then check if $Dest is null because we can't create a undefined file. Then it runs that New-Item command from above. It's Pretty Simple but nice and helpful so that I can't forget that pesky New-Item Command. 

I've marked up the function here for reference but the actual script is near this file in the repository
```powershell
param (
    [Parameter()]
    [string]
    $Dest, # Define the File to Create Variable

    [Alias("h")]
    [switch]
    $help # Define the Help Flag
)

if ($help) {
	Get-Help New-File # Displays the Help menu
} else {
    if ($Dest -eq $null) { # Checks if $Dest is null and tells user
        Write-Host "No File to Create Defined" 
	}

	if (Test-Path -Path $Dest) { # Error if the File Already Exists
        Write-Error "Cannot Create a file that already exists!!!"

    }

    New-Item -Path $Dest -ItemType File # Create the New File
}
```