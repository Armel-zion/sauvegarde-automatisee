# Documentation technique - Système de sauvegarde automatisé

## 1. Objectif

Le projet met en place une solution de sauvegarde et de restauration automatisée.

L'objectif est de protéger des dossiers importants d'une entreprise en les copiant automatiquement vers un serveur de stockage dédié.

En cas de perte ou de suppression de données, les fichiers peuvent être restaurés rapidement.

## 2. Architecture validée

La solution utilise deux machines virtuelles Windows.

| Machine | Adresse IP | Rôle |
|---|---:|---|
| VM-Client | `192.168.50.10` | Contient les données à sauvegarder et exécute les scripts |
| VM-ServeurSauvegarde | `192.168.50.20` | Stocke les sauvegardes dans un dossier partagé |

Schéma :

```text
VM-Client
192.168.50.10

C:\Donnees\RendezVous
C:\Donnees\Patients
C:\Donnees\Medecins
        |
        | Robocopy via PowerShell
        v
VM-ServeurSauvegarde
192.168.50.20

\\192.168.50.20\Backups
```

## 3. Réseau des VM

Chaque VM utilise deux cartes réseau.

| Carte | Mode | Utilité |
|---|---|---|
| Carte 1 | NAT | Accès Internet dans la VM |
| Carte 2 | Réseau interne | Communication entre VM-Client et VM-ServeurSauvegarde |

Configuration IP :

```text
VM-Client
IP : 192.168.50.10
Masque : 255.255.255.0

VM-ServeurSauvegarde
IP : 192.168.50.20
Masque : 255.255.255.0
```

Commande de test depuis la VM-Client :

```powershell
ping 192.168.50.20
```

Résultat attendu :

```text
Réponse de 192.168.50.20
```

## 4. Serveur de stockage

Sur la VM-ServeurSauvegarde, le dossier de stockage est :

```text
C:\Backups
```

Il est partagé sur le réseau avec le nom :

```text
Backups
```

Chemin réseau utilisé par la VM-Client :

```text
\\192.168.50.20\Backups
```

Compte utilisé pour accéder au partage :

```text
backupuser
```

Le partage a été testé depuis la VM-Client avec :

```powershell
Test-Path "\\192.168.50.20\Backups"
```

Résultat attendu :

```text
True
```

## 5. Outils utilisés

| Outil | Rôle |
|---|---|
| PowerShell | Exécuter les scripts |
| Robocopy | Copier les dossiers de manière fiable |
| JSON | Configurer les dossiers sources et destinations |
| Planificateur de tâches Windows | Lancer automatiquement la sauvegarde |
| Partage SMB Windows | Exposer le dossier de sauvegarde sur le réseau |

## 6. Organisation du projet

```text
sauvegarde-automatisee/
  config/
    backup-config.json
  scripts/
    backup.ps1
    restore.ps1
    install-task.ps1
  tests/
    TEST_SAUVEGARDE.md
    TEST_RESTAURATION.md
    TEST_AUTOMATISATION.md
  ARCHITECTURE.md
  AUTOMATISATION.md
  CAHIER_DES_CHARGES.md
  CHOIX_OUTILS.md
  DOCUMENTATION_TECHNIQUE.md
  README.md
  SUIVI_PROJET.md
  VALIDATION_VM.md
  PRESENTATION_ORALE.md
```

## 7. Configuration de la sauvegarde

Le fichier de configuration est :

```text
config\backup-config.json
```

Configuration utilisée :

```json
{
  "jobs": [
    {
      "name": "RendezVous",
      "source": "C:\\Donnees\\RendezVous",
      "destination": "\\\\192.168.50.20\\Backups\\RendezVous"
    },
    {
      "name": "Patients",
      "source": "C:\\Donnees\\Patients",
      "destination": "\\\\192.168.50.20\\Backups\\Patients"
    },
    {
      "name": "Medecins",
      "source": "C:\\Donnees\\Medecins",
      "destination": "\\\\192.168.50.20\\Backups\\Medecins"
    }
  ]
}
```

Signification :

| Champ | Rôle |
|---|---|
| `name` | Nom du dossier sauvegardé |
| `source` | Dossier source sur la VM-Client |
| `destination` | Dossier de destination sur la VM-ServeurSauvegarde |

## 8. Préparation de la VM-Client

Créer les dossiers sources :

```powershell
mkdir C:\Donnees\RendezVous
mkdir C:\Donnees\Patients
mkdir C:\Donnees\Medecins
```

Créer des fichiers de test :

```powershell
"Test rendez-vous" > C:\Donnees\RendezVous\rdv-test.txt
"Test patient" > C:\Donnees\Patients\patient-test.txt
"Test medecin" > C:\Donnees\Medecins\medecin-test.txt
```

Cloner le projet :

```powershell
mkdir C:\Projets
cd C:\Projets
git clone https://github.com/Armel-zion/sauvegarde-automatisee.git
cd sauvegarde-automatisee
```

Si PowerShell bloque l'exécution des scripts, lancer les scripts avec :

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\backup.ps1
```

## 9. Script de sauvegarde

Script :

```text
scripts\backup.ps1
```

Fonctionnement :

1. Le script lit `config\backup-config.json`.
2. Il parcourt chaque sauvegarde déclarée dans `jobs`.
3. Il lance Robocopy pour copier chaque dossier source vers le serveur.
4. Il écrit un journal dans `C:\Logs\Sauvegarde\backup.log`.
5. Il retourne `0` si tout est correct, sinon `1`.

Commande :

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\backup.ps1
```

Options Robocopy utilisées :

| Option | Utilité |
|---|---|
| `/E` | Copie tous les sous-dossiers, même les dossiers vides |
| `/R:3` | Réessaie 3 fois en cas d'erreur |
| `/W:5` | Attend 5 secondes entre deux essais |
| `/TEE` | Affiche le résultat dans la console et dans le fichier log |
| `/LOG+` | Ajoute les logs à la suite du fichier existant |

Robocopy retourne plusieurs codes. Dans ce projet, un code supérieur ou égal à `8` est considéré comme une erreur.

## 10. Script de restauration

Script :

```text
scripts\restore.ps1
```

Fonctionnement :

1. Le script lit la même configuration JSON.
2. Il prend les sauvegardes depuis `\\192.168.50.20\Backups`.
3. Il restaure les fichiers dans `C:\RestaurationTest`.
4. Il écrit un journal dans `C:\Logs\Sauvegarde\restore.log`.

Commande :

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\restore.ps1
```

La restauration se fait dans un dossier de test pour éviter d'écraser directement les données originales.

## 11. Automatisation

Script :

```text
scripts\install-task.ps1
```

Commande :

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\install-task.ps1
```

Ce script crée une tâche planifiée Windows :

```text
SauvegardeAutomatiqueProjet
```

Horaire :

```text
Tous les jours à 20h00
```

Vérifier la tâche :

```powershell
Get-ScheduledTask -TaskName "SauvegardeAutomatiqueProjet"
```

Lancer la tâche manuellement :

```powershell
Start-ScheduledTask -TaskName "SauvegardeAutomatiqueProjet"
```

Vérifier le résultat :

```powershell
Get-ScheduledTaskInfo -TaskName "SauvegardeAutomatiqueProjet"
```

Résultat attendu :

```text
LastTaskResult : 0
```

## 12. Tests réalisés

| Test | Commande principale | Résultat |
|---|---|---|
| Communication réseau | `ping 192.168.50.20` | Validé |
| Accès au partage | `Test-Path "\\192.168.50.20\Backups"` | Validé |
| Sauvegarde | `powershell.exe -ExecutionPolicy Bypass -File .\scripts\backup.ps1` | Validé |
| Restauration | `powershell.exe -ExecutionPolicy Bypass -File .\scripts\restore.ps1` | Validé |
| Automatisation | `Start-ScheduledTask -TaskName "SauvegardeAutomatiqueProjet"` | Validé |

## 13. Vérifications après sauvegarde

Depuis la VM-Client :

```powershell
dir "\\192.168.50.20\Backups"
```

Dossiers attendus :

```text
RendezVous
Patients
Medecins
```

Vérifier le log :

```powershell
Get-Content C:\Logs\Sauvegarde\backup.log -Tail 30
```

## 14. Vérifications après restauration

Depuis la VM-Client :

```powershell
dir C:\RestaurationTest -Recurse
```

Fichiers attendus :

```text
rdv-test.txt
patient-test.txt
medecin-test.txt
```

Vérifier le log :

```powershell
Get-Content C:\Logs\Sauvegarde\restore.log -Tail 30
```

## 15. Problèmes rencontrés et corrections

| Problème | Cause | Correction |
|---|---|---|
| Le ping ne répondait pas | Masque réseau incorrect `255.255.255.255` | Reconfiguration en `255.255.255.0` |
| Le partage répondait `Accès refusé` | Droits insuffisants | Création du compte `backupuser` et attribution des droits |
| `Test-Path` retournait `False` | Partage SMB ou droits non prêts | Vérification du partage et connexion avec `net use` |
| PowerShell bloquait `backup.ps1` | Execution Policy Windows | Lancement avec `-ExecutionPolicy Bypass` |

## 16. Sécurité minimale

La solution utilise une VM dédiée pour isoler les sauvegardes de la machine cliente.

Bonnes pratiques respectées :

- stockage sur une machine séparée ;
- accès par un compte dédié `backupuser` ;
- restauration dans un dossier de test avant remplacement des données originales ;
- logs de sauvegarde et de restauration ;
- automatisation par tâche planifiée.

Améliorations possibles :

- ajouter une rotation des anciennes sauvegardes ;
- compresser les sauvegardes ;
- envoyer une alerte mail en cas d'échec ;
- utiliser un compte avec des droits plus limités ;
- ajouter une sauvegarde hors site.

## 17. Conclusion

Le projet répond au brief client.

Les scripts de sauvegarde et de restauration fonctionnent, le serveur de stockage est isolé dans une VM dédiée, la restauration a été testée et l'automatisation est validée avec le Planificateur de tâches Windows.
