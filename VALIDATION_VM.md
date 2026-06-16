# Validation des deux machines virtuelles

## Objectif

Ce document résume la validation finale réalisée avec deux VM.

## Machines utilisées

| Machine | IP | Rôle |
|---|---:|---|
| VM-Client | `192.168.50.10` | Machine qui contient les scripts et les données |
| VM-ServeurSauvegarde | `192.168.50.20` | Machine qui stocke les sauvegardes |

## Réseau

Les deux VM utilisent :

- une carte NAT pour Internet ;
- une carte réseau interne pour communiquer entre elles.

Test de communication depuis la VM-Client :

```powershell
ping 192.168.50.20
```

Résultat :

```text
Communication validée.
```

## Partage de sauvegarde

Sur la VM-ServeurSauvegarde :

```text
C:\Backups
```

Chemin réseau depuis la VM-Client :

```text
\\192.168.50.20\Backups
```

Test depuis la VM-Client :

```powershell
Test-Path "\\192.168.50.20\Backups"
```

Résultat obtenu :

```text
True
```

## Sauvegarde

Commande lancée depuis la VM-Client :

```powershell
cd C:\Projets\sauvegarde-automatisee
powershell.exe -ExecutionPolicy Bypass -File .\scripts\backup.ps1
```

Résultat :

```text
Sauvegarde validée vers \\192.168.50.20\Backups.
```

## Restauration

Commande lancée depuis la VM-Client :

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\restore.ps1
```

Résultat :

```text
Restauration validée dans C:\RestaurationTest.
```

## Automatisation

Commande d'installation :

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\install-task.ps1
```

Commande de test :

```powershell
Start-ScheduledTask -TaskName "SauvegardeAutomatiqueProjet"
Get-ScheduledTaskInfo -TaskName "SauvegardeAutomatiqueProjet"
```

Résultat attendu et validé :

```text
LastTaskResult : 0
```

## Conclusion

Les livrables principaux sont validés :

- script de sauvegarde ;
- serveur de stockage isolé ;
- restauration fonctionnelle ;
- automatisation par tâche planifiée ;
- documentation technique.
