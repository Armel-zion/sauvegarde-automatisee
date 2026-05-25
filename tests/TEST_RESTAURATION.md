# Test de restauration

## Objectif du test

Vérifier que les fichiers sauvegardés peuvent être restaurés dans un dossier de test sans écraser les données originales.

## Données utilisées

Fichiers sauvegardés :

- `rdv-test.txt`
- `patient-test.txt`
- `medecin-test.txt`

## Source de restauration

Les fichiers sont restaurés depuis :

- `C:\BackupTest\RendezVous`
- `C:\BackupTest\Patients`
- `C:\BackupTest\Medecins`

## Destination de restauration

Les fichiers sont restaurés vers :

- `C:\RestaurationTest\RendezVous`
- `C:\RestaurationTest\Patients`
- `C:\RestaurationTest\Medecins`

## Commande exécutée

```powershell
.\scripts\restore.ps1