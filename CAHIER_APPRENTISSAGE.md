# Cahier d'apprentissage

## Compétences travaillées

- Créer une architecture avec deux VM.
- Configurer une adresse IP fixe.
- Comprendre le rôle du masque réseau `255.255.255.0`.
- Tester une communication réseau avec `ping`.
- Créer un partage SMB Windows.
- Gérer des droits d'accès sur un dossier partagé.
- Utiliser PowerShell pour automatiser des tâches.
- Utiliser Robocopy pour copier des dossiers.
- Lire une configuration JSON dans un script.
- Installer une tâche planifiée Windows.
- Lire des logs pour vérifier une sauvegarde.

## Points importants compris

Une sauvegarde doit être stockée sur une machine séparée pour réduire le risque de perte en cas de panne de la machine principale.

Le script doit être testé avec une vraie restauration. Une sauvegarde non restaurable n'est pas suffisante.

Le Planificateur de tâches permet de supprimer la dépendance à une action manuelle.

Les logs sont importants pour prouver qu'une sauvegarde s'est bien exécutée ou pour comprendre une erreur.

## Erreurs rencontrées

| Erreur | Ce que j'ai appris |
|---|---|
| Ping impossible | Vérifier les IP, les masques et le pare-feu |
| Accès refusé au partage | Vérifier les droits du partage et du dossier |
| Script PowerShell bloqué | Comprendre l'Execution Policy |
| `git` non reconnu | Vérifier l'installation et le PATH |

## Ce que je peux expliquer à un recruteur

J'ai mis en place une solution de sauvegarde automatisée avec deux VM Windows.

J'ai configuré un réseau interne, un serveur de stockage, des scripts PowerShell avec Robocopy, une restauration de test et une tâche planifiée.

J'ai aussi documenté l'installation, les tests et les problèmes rencontrés.
