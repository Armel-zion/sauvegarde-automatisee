# Automatisation de la sauvegarde

## Objectif

La sauvegarde ne doit pas dépendre d'une action manuelle.

Le script `backup.ps1` doit pouvoir être lancé automatiquement à une heure définie.

## Outil utilisé

L'outil choisi est le Planificateur de tâches Windows.

## Pourquoi cet outil

Le Planificateur de tâches est intégré à Windows.

Il permet d'exécuter automatiquement un script PowerShell selon un horaire défini.

## Fréquence prévue

Pour le projet, la sauvegarde sera planifiée tous les jours à 20h00.

## Commande à exécuter

Le Planificateur de tâches devra lancer PowerShell avec le script de sauvegarde.

Exemple :

```powershell
powershell.exe -ExecutionPolicy Bypass -File C:\chemin\du\projet\scripts\backup.ps1