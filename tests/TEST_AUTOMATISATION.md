# Test d'automatisation

## Objectif du test

Verifier que la tache planifiee Windows peut lancer automatiquement le script `backup.ps1`.

## Tache planifiee

Nom de la tache :

- `SauvegardeAutomatiqueProjet`

## Commande de test

```powershell
Start-ScheduledTask -TaskName "SauvegardeAutomatiqueProjet"
```

## Verification

Commande utilisee :

```powershell
Get-ScheduledTaskInfo -TaskName "SauvegardeAutomatiqueProjet"
```

Resultat attendu :

- `LastTaskResult : 0`

## Resultat obtenu

La tache planifiee a ete lancee avec succes apres correction de l'action, du chemin de configuration et du partage reseau.

## Conclusion

Le test d'automatisation est valide si `LastTaskResult` vaut `0` et si le fichier `C:\Logs\Sauvegarde\backup.log` est mis a jour.
