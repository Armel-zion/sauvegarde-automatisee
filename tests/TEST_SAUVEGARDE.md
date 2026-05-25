# Test de sauvegarde

## Objectif du test

Vérifier que le script `backup.ps1` copie correctement plusieurs dossiers sources vers les dossiers de destination.

## Configuration testée

Sources :

- `C:\Donnees\RendezVous`
- `C:\Donnees\Patients`
- `C:\Donnees\Medecins`

Destinations :

- `C:\BackupTest\RendezVous`
- `C:\BackupTest\Patients`
- `C:\BackupTest\Medecins`

## Commande exécutée

```powershell
.\scripts\backup.ps1