# Exchange-Purge-Log
Script Powershell Purge Log Exchange

Exchange Server conserve de nombreux fichiers de logs sous le format « E00000xxxx.log ». 
Ces fichiers de 1MB chacun se multiplient rapidement et consomment donc de l’espace disque. 
Si les backup d'Exchange sont correctes, il se chargera de purger ces logs pour vous dans certains cas, il est nécessaire de devoir le faire soi-même.
Ce script permet de purger les logs des MailboxDatabase en choisissant la rétention. Il suffit ensuite de le mettre en tâche planifiée.

