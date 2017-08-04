# Script Powershell permettant d'afficher l’espace disque disponible en taille et pourcentage de toutes les partitions sur un serveur.
Get-WmiObject win32_volume -computer "Server Name" | Sort-Object -Property Name | ft SystemName, Name,
@{ e={[math]::round($_.FreeSpace/1GB,2) } ;l="FreeSpace (GB)" },
@{ e={[math]::round(($_.FreeSpace*100)/$_.Capacity) } ;l="PourcentFree" }