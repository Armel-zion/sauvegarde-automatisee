# Système de sauvegarde automatisé

## Contexte

Une entreprise souhaite protéger ses données importantes contre la perte, la panne ou une attaque informatique.

## Objectif

Mettre en place une solution simple qui sauvegarde automatiquement les données vers un serveur de stockage dédié et permet leur restauration en cas de problème.

## Architecture validée

- VM-Client : `192.168.50.10`
- VM-ServeurSauvegarde : `192.168.50.20`
- Partage réseau : `\\192.168.50.20\Backups`
- Dossiers sauvegardés : `C:\Donnees\RendezVous`, `C:\Donnees\Patients`, `C:\Donnees\Medecins`
- Restauration de test : `C:\RestaurationTest`

## Documentation

- [Documentation technique](DOCUMENTATION_TECHNIQUE.md)
- [Validation des deux VM](VALIDATION_VM.md)
- [Gestion des VM](VM_EXPORT.md)
- [Présentation orale](PRESENTATION_ORALE.md)
