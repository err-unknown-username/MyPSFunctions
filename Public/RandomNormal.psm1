function Get-RandomNormal
{
    [CmdletBinding()]
    Param ( 
        [Parameter(Mandatory=$true)]
        [double]$Mean, 

        [Parameter(Mandatory=$true)]
        [double]$StandardDeviation 
    )
 
    $RandomNormal = $Mean + $StandardDeviation * [math]::Sqrt( -2 * [math]::Log( ( Get-Random -Minimum 0.0 -Maximum 1.0 ) ) ) * [math]::Cos( 2 * [math]::PI * ( Get-Random -Minimum 0.0 -Maximum 1.0 ) )
 
    Write-Output $RandomNormal
}
Export-ModuleMember -Function Get-RandomNormal

#Get-RandomNormal 100 30
