# Présentation orale simple

## Durée conseillée

5 à 7 minutes.

## Plan

### 1. Introduction

Bonjour, je présente mon projet de système de sauvegarde automatisé.

Le contexte est simple : une entreprise veut éviter la perte de ses données importantes.

L'objectif est donc de sauvegarder automatiquement des dossiers vers un serveur dédié, puis de pouvoir les restaurer rapidement.

### 2. Besoin client

Le client attend quatre livrables :

- un outil ou script de sauvegarde automatique ;
- un serveur de stockage isolé ;
- une restauration fonctionnelle testée ;
- une documentation technique.

### 3. Architecture

J'ai utilisé deux machines virtuelles :

- VM-Client en `192.168.50.10` ;
- VM-ServeurSauvegarde en `192.168.50.20`.

La VM-Client contient les dossiers à protéger.

La VM-ServeurSauvegarde contient le partage réseau :

```text
\\192.168.50.20\Backups
```

### 4. Outils

J'ai choisi :

- PowerShell pour automatiser ;
- Robocopy pour copier les fichiers ;
- JSON pour configurer les dossiers ;
- le Planificateur de tâches Windows pour lancer la sauvegarde automatiquement.

### 5. Fonctionnement

Le fichier `backup-config.json` contient les dossiers à sauvegarder.

Le script `backup.ps1` lit cette configuration et copie les dossiers vers le serveur.

Le script `restore.ps1` restaure les fichiers dans :

```text
C:\RestaurationTest
```

Le script `install-task.ps1` crée la tâche planifiée :

```text
SauvegardeAutomatiqueProjet
```

### 6. Tests

J'ai testé :

- la communication entre les VM avec `ping` ;
- l'accès au partage avec `Test-Path` ;
- la sauvegarde vers le serveur ;
- la restauration depuis le serveur ;
- l'automatisation avec le Planificateur de tâches.

La tâche planifiée retourne :

```text
LastTaskResult : 0
```

Cela indique que l'exécution s'est terminée correctement.

### 7. Difficultés rencontrées

J'ai rencontré plusieurs problèmes :

- le ping ne fonctionnait pas à cause d'un mauvais masque réseau ;
- le partage répondait "Accès refusé" à cause des droits ;
- PowerShell bloquait les scripts avec l'Execution Policy.

J'ai corrigé ces problèmes en configurant correctement le réseau, les droits du partage et le lancement des scripts avec `-ExecutionPolicy Bypass`.

### 8. Conclusion

La solution répond au besoin client.

Elle sauvegarde automatiquement les données vers une VM dédiée et permet une restauration testée.

Ce projet m'a permis de pratiquer PowerShell, Robocopy, les VM, le réseau, les partages Windows, les logs et l'automatisation.

## Phrase finale à retenir

Ce projet montre une solution simple mais robuste pour protéger des données importantes avec une sauvegarde automatisée et une restauration vérifiée.
