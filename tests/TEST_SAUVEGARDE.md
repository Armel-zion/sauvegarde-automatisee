# Test de sauvegarde

## Objectif du test

Verifier que le script `backup.ps1` copie correctement plusieurs dossiers sources vers les dossiers de destination.

## Configuration testee

Sources :

- `C:\Donnees\RendezVous`
- `C:\Donnees\Patients`
- `C:\Donnees\Medecins`

Destinations :

- `C:\BackupTest\RendezVous`
- `C:\BackupTest\Patients`
- `C:\BackupTest\Medecins`

## Commande executee

```powershell
.\scripts\backup.ps1
```

## Resultat attendu

Les fichiers suivants doivent etre presents dans les dossiers de sauvegarde :

- `C:\BackupTest\RendezVous\rdv-test.txt`
- `C:\BackupTest\Patients\patient-test.txt`
- `C:\BackupTest\Medecins\medecin-test.txt`

## Resultat obtenu

Les trois dossiers de test ont ete copies avec succes.

## Conclusion

Le test de sauvegarde locale est valide.
