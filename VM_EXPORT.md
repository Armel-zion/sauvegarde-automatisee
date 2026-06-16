# Gestion des machines virtuelles

## Objectif

Les deux machines virtuelles utilisées pour valider le projet existent sur le PC local.

Elles ne doivent pas être ajoutées directement dans GitHub, car les fichiers de VM sont très lourds et peuvent contenir des données sensibles.

## Emplacement local des VM

Les VM sont stockées ici :

```text
C:\Users\HP\VirtualBox VMs
```

VM présentes :

| VM | Rôle | Emplacement |
|---|---|---|
| VM-Client | Machine qui exécute les scripts | `C:\Users\HP\VirtualBox VMs\VM-Client` |
| VM-ServeurSauvegarde | Serveur de stockage des sauvegardes | `C:\Users\HP\VirtualBox VMs\VM-ServeurSauvegarde` |

## Pourquoi ne pas mettre les VM dans Git

Les fichiers principaux des VM sont des disques virtuels.

Exemples :

```text
VM-Client.vdi
VM-ServeurSauvegarde.vdi
```

Ces fichiers font plusieurs dizaines de Go.

Risques si on les met dans Git :

- dépôt GitHub trop lourd ;
- push impossible ou très lent ;
- risque de publier des données personnelles ;
- risque de publier des comptes, mots de passe ou fichiers système ;
- Git n'est pas adapté au suivi de gros disques virtuels.

La bonne pratique est donc :

- GitHub contient le code, les scripts et la documentation ;
- les VM restent en local ou sont exportées séparément si le professeur les demande.

## Protection ajoutée

Le fichier `.gitignore` bloque les fichiers de VM :

```text
*.vdi
*.vmdk
*.vhd
*.vhdx
*.ova
*.ovf
*.vbox
*.vbox-prev
*.iso
```

Cela évite de les ajouter par erreur dans Git.

## Comment exporter les VM si besoin

Si le professeur demande une preuve ou une copie des VM, il faut faire un export VirtualBox.

Dans VirtualBox :

1. Éteindre les deux VM.
2. Aller dans `Fichier`.
3. Cliquer sur `Exporter un appareil virtuel`.
4. Sélectionner `VM-Client`.
5. Exporter au format `.ova`.
6. Refaire la même chose avec `VM-ServeurSauvegarde`.

Exemples de fichiers exportés :

```text
VM-Client.ova
VM-ServeurSauvegarde.ova
```

Ces fichiers doivent être transmis hors GitHub, par exemple :

- clé USB ;
- disque externe ;
- lien Drive/OneDrive ;
- espace de dépôt demandé par l'école.

## Ce qui doit être sur GitHub

Le dépôt GitHub doit contenir :

- les scripts PowerShell ;
- la configuration JSON ;
- la documentation technique ;
- la validation des deux VM ;
- les tests ;
- la présentation orale ;
- le cahier d'apprentissage.

Le dépôt ne doit pas contenir :

- les fichiers `.vdi` ;
- les fichiers `.ova` ;
- les fichiers `.iso` ;
- les dossiers complets des VM.

## Phrase à dire à l'oral

Les VM ont servi à valider concrètement la solution, mais je ne les ai pas ajoutées dans GitHub car ce sont des fichiers très lourds et sensibles. Le dépôt contient les scripts, la configuration, la documentation et les preuves de validation. Si besoin, les VM peuvent être exportées séparément au format OVA.
