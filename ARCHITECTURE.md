# Architecture de la solution

## Vue générale

La solution utilise deux machines virtuelles :

- VM-Client
- VM-ServeurSauvegarde

## Rôle de la VM-Client

La VM-Client contient les données importantes de l'entreprise.

Exemples de dossiers à protéger :

- `C:\Donnees\RendezVous`
- `C:\Donnees\Patients`
- `C:\Donnees\Medecins`

## Rôle de la VM-ServeurSauvegarde

La VM-ServeurSauvegarde est dédiée au stockage des sauvegardes.

Elle contient un dossier de sauvegarde :

- `D:\Backups`

## Communication réseau

Les deux machines doivent être dans le même réseau virtuel.

La VM-Client devra pouvoir envoyer les sauvegardes vers la VM-ServeurSauvegarde.