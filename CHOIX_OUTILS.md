# Choix des outils

## Besoin technique

La solution doit permettre de sauvegarder automatiquement des dossiers importants vers un serveur distant.

Elle doit aussi permettre une restauration rapide en cas de problème.

## Outils possibles

| Outil | Rôle | Avantage principal |
|---|---|---|
| Robocopy | Copier les fichiers | Intégré à Windows et fiable |
| PowerShell | Écrire les scripts | Permet d'automatiser et de gérer les erreurs |
| Planificateur de tâches | Lancer automatiquement la sauvegarde | Intégré à Windows |
| VM de sauvegarde | Stocker les copies | Sépare les sauvegardes de la machine principale |

## Choix retenu

Pour ce projet, le choix retenu est :

- Windows
- PowerShell
- Robocopy
- Planificateur de tâches
- VM dédiée au stockage

Ce choix est adapté car il est simple, robuste, compréhensible et compatible avec le cahier des charges.