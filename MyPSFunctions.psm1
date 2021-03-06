
$Public  = @( Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1"   -Recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1"  -Recurse -ErrorAction SilentlyContinue )

foreach ($import in @($Public + $Private)) 
{
    try
    {
        if($null -eq $import) {continue }
        if([string]::IsNullOrEmpty($import) ) { continue }

        Write-Verbose ". $import" #-Verbose
        . $import.FullName
    }
    catch 
    {
        Write-Error -Message "Failed to import function $import : $_"
        throw
    }
}

