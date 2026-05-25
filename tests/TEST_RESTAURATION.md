# Test de restauration

## Objectif du test

Verifier que les fichiers sauvegardes peuvent etre restaures dans un dossier de test sans ecraser les donnees originales.

## Donnees utilisees

Fichiers sauvegardes :

- `rdv-test.txt`
- `patient-test.txt`
- `medecin-test.txt`

## Source de restauration

Les fichiers sont restaures depuis :

- `C:\BackupTest\RendezVous`
- `C:\BackupTest\Patients`
- `C:\BackupTest\Medecins`

## Destination de restauration

Les fichiers sont restaures vers :

- `C:\RestaurationTest\RendezVous`
- `C:\RestaurationTest\Patients`
- `C:\RestaurationTest\Medecins`

## Commande executee

```powershell
.\scripts\restore.ps1
```

## Resultat attendu

Les fichiers doivent etre presents dans `C:\RestaurationTest`.

## Resultat obtenu

Les fichiers ont ete restaures avec succes dans le dossier de test.

## Conclusion

Le test de restauration est valide.
