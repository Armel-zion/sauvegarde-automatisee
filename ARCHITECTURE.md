# Architecture de la solution

## Vue générale

La solution utilise deux machines virtuelles :

- VM-Client : `192.168.50.10`
- VM-ServeurSauvegarde : `192.168.50.20`

## Rôle de la VM-Client

La VM-Client contient les données importantes de l'entreprise.

Exemples de dossiers à protéger :

- `C:\Donnees\RendezVous`
- `C:\Donnees\Patients`
- `C:\Donnees\Medecins`

## Rôle de la VM-ServeurSauvegarde

La VM-ServeurSauvegarde est dédiée au stockage des sauvegardes.

Elle contient un dossier de sauvegarde :

- `C:\Backups`

Ce dossier est partagé sur le réseau avec le chemin suivant :

- `\\192.168.50.20\Backups`

## Communication réseau

Les deux machines doivent être dans le même réseau virtuel.

La VM-Client devra pouvoir envoyer les sauvegardes vers la VM-ServeurSauvegarde.

Configuration réseau utilisée :

- Carte 1 : NAT pour Internet
- Carte 2 : réseau interne pour la communication entre les deux VM
- Réseau interne : `192.168.50.0/24`
