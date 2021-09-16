#Failover Cluster Feature add to server


$servername = Read-Host "Input server name:"

$check_mgmt_console = Get-WindowsFeature -Name RSAT-Clustering-MGMT -ComputerName $servername
#Write-Output $check_mgmt_console.InstallState


if ($check_mgmt_console.InstallState -eq "Available") {
    Install-WindowsFeature -Name RSAT-Clustering-MGMT -ComputerName $servername
}
else {
    Write-Output "Failover Cluster Management Console already installed"
}
    
$check_feature_installed = Get-WindowsFeature -Name Failover-Clustering -ComputerName $servername

#Write-Output $check_feature_installed.Installed 

if ($check_feature_installed.Installed -eq "True") {
    Write-Output "Failover Cluster Feature already installed"
}
else{
    Install-WindowsFeature -Name Failover-Clustering -IncludeAllSubFeature -ComputerName $servername -Restart
    Write-Output "Server has been restarting Please Wait."
}





