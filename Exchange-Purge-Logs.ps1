#
# Script to Purge Log Exchange when backup is an error.
# Copyright (c) 2016 Jerome Kermorvant
# ---------------------------------------------------------------------
#
# Exchange Server conserve de nombreux fichiers de logs sous le format « E00000xxxx.log ». 
# Ces fichiers de 1MB chacun se multiplient rapidement et consomment donc de l’espace disque. 
# Si les backup d'Exchange sont correctes, il se chargera de purger ces logs pour vous. 
#
# Le principe du script
# Ce script écrit en powershell est très simple. Il prend 4 arguments :
# – 1er argument : Le chemin où sont stockés les fichiers de logs
# – 2ème argument : L’extension des fichiers à purger
# – 3ème argument : Le nombre de jour entre aujourd’hui et la date de création des fichiers qui sont à purger
# - 4ème argument : Le nom des fichiers à purger (ou une partie du nom)
#
# Paramétrage de la tâche planifiée :
# Program/script : C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
# Argument : -file « E:\Scripts\PurgeExchangeLogs.ps1?

$Path = "D:\Mailbox\DB\MailboxDatabase01\LogFolder\"
$Ext = ".log"
$Day = "7"
$Like = "E00000*"
 
Get-ChildItem $Path -Recurse | Where {$_.LastWriteTime -le (Get-Date).AddDays(-$Day) -and $_.Extension -eq $Ext -and $_.name -like $Like } | remove-item


