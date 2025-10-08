<#
.SYNOPSIS
    This Script Will Create a new file easily
.DESCRIPTION
    A file will be created in the $Dest so that you don't have to look up how to create a file from the command line in powershell
.PARAMETER Dest
    The File in which you will create
.EXAMPLE
    C:\PS> NewFile -Dest C:\crazynewfile.txt
.NOTES
    Author: Nate Lowinger
    Date: October 7th, 2025
#>

function New-File {
	<#
	.SYNOPSIS
    	This Script Will Create a new file easily
	.DESCRIPTION
    	A file will be created in the $Dest so that you don't have to look up how to create a file from the command line in powershell
	.PARAMETER Dest
    	The File in which you will create
	.EXAMPLE
    	C:\PS> NewFile -Dest C:\crazynewfile.txt
	.NOTES
    	Author: Nate Lowinger
    	Date: October 7th, 2025
	#>

    param (
        [Parameter()]
        [string]
        $Dest,

		[Alias("h")]
		[switch]
		$help
    )

    if ($help) {
		Get-Help New-File
    } else {
		if ($Dest -eq $null) {
			Write-Host "No File to Create Defined"
			
		}


    	if (Test-Path -Path $Dest) {
        	Write-Error "Cannot Create a file that already exists!!!"
        	
    	}

    	New-Item -Path $Dest -ItemType File
    }
}

Export-ModuleMember -Function New-File
