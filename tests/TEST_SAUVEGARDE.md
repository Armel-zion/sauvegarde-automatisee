# Test de sauvegarde

## Objectif du test

Verifier que le script `backup.ps1` copie correctement plusieurs dossiers sources vers les dossiers de destination.

## Configuration testee

Sources :

- `C:\Donnees\RendezVous`
- `C:\Donnees\Patients`
- `C:\Donnees\Medecins`

Destinations :

- `\\192.168.50.20\Backups\RendezVous`
- `\\192.168.50.20\Backups\Patients`
- `\\192.168.50.20\Backups\Medecins`

## Commande executee

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\backup.ps1
```

## Resultat attendu

Les fichiers suivants doivent etre presents dans les dossiers de sauvegarde :

- `\\192.168.50.20\Backups\RendezVous\rdv-test.txt`
- `\\192.168.50.20\Backups\Patients\patient-test.txt`
- `\\192.168.50.20\Backups\Medecins\medecin-test.txt`

## Resultat obtenu

Les trois dossiers de test ont ete copies avec succes vers le serveur de sauvegarde.

## Conclusion

Le test de sauvegarde vers le serveur distant est valide.
