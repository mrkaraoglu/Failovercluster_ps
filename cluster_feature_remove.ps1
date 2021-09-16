#Failover Cluster Feature remove to server


$servername = Read-Host "Input server name for remove:"

Uninstall-WindowsFeature -Name Failover-Clustering -IncludeAllSubFeature -ComputerName $servername -Restart