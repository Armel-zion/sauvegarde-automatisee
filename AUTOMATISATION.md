# Automatisation de la sauvegarde

## Objectif

La sauvegarde ne doit pas dependre d'une action manuelle.

Le script `backup.ps1` doit pouvoir etre lance automatiquement a une heure definie.

## Outil utilise

L'outil choisi est le Planificateur de taches Windows.

## Pourquoi cet outil

Le Planificateur de taches est integre a Windows.

Il permet d'executer automatiquement un script PowerShell selon un horaire defini.

## Frequence prevue

Pour le projet, la sauvegarde est planifiee tous les jours a 20h00.

## Script d'installation

Le projet contient un script qui cree ou met a jour automatiquement la tache planifiee :

```powershell
.\scripts\install-task.ps1
```

Ce script cree une tache nommee :

- `SauvegardeAutomatiqueProjet`

Cette tache lance automatiquement :

- `scripts\backup.ps1`

## Commande executee par la tache

La tache planifiee lance PowerShell avec le script de sauvegarde.

Exemple de commande :

```powershell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "C:\chemin\du\projet\scripts\backup.ps1"
```

## Verification

Pour verifier que la tache existe :

```powershell
Get-ScheduledTask -TaskName "SauvegardeAutomatiqueProjet"
```

Pour verifier le dernier resultat d'execution :

```powershell
Get-ScheduledTaskInfo -TaskName "SauvegardeAutomatiqueProjet"
```

Un `LastTaskResult` egal a `0` indique que la tache s'est terminee correctement.
