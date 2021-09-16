#Creating New cluster

Import-Module FailoverClusters

$servername1 = Read-Host "Input first server name:"
$servername2 = Read-Host "Input second server name:"
$CNOName = Read-Host "Input Cluster Name Object (CNO) Name:"

[String]$CNOIP= Read-Host "Input Cluster IP Address:"

#$VCOName = Read-Host "Input Virtual Cluster Object (VCO - AG) Name:"

New-Cluster -Name $CNOName -Node $servername1,$servername2 -NoStorage -StaticAddress $CNOIP