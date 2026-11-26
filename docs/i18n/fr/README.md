[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Une application macOS native pour exporter votre liste de suivi Apple Stocks au format CSV ou JSON.

Apple ne fournit aucun moyen officiel d'exporter les données de votre liste de suivi Stocks. Cette application résout ce problème à l'aide de deux méthodes complémentaires :

1. **API d'accessibilité** – Lit l'interface de Stocks.app en cours d'exécution en temps réel
2. **Cache du widget** – Analyse les fichiers de cache stockés localement lorsque l'application n'est pas ouverte

## Fonctionnalités

- **Interface SwiftUI native** avec prise en charge du mode sombre et des dispositions RTL
- **Sources de données multiples** – API d'accessibilité ou analyse du cache
- **Exportation en CSV ou JSON** avec colonnes personnalisables
- **Aperçu avant exportation** – Vérifiez exactement ce que vous exportez
- **Sélection des colonnes** – Choisissez les champs de données à inclure
- **Copier dans le presse-papiers** – Exportation rapide sans enregistrer de fichier
- **Préférences persistantes** – Mémorise vos réglages d'exportation
- **Interface localisée** – Disponible en 45 langues

## Langues prises en charge

Stocks Exporter utilise les préférences linguistiques système de macOS et inclut une localisation complète en 45 langues (avec prise en charge automatique de l'affichage de droite à gauche pour l'arabe, le persan, l'hébreu et l'ourdou). Consultez le tableau complet dans le [README en anglais](../../../README.md#supported-languages).

## Configuration requise

- macOS 14.0 (Sonoma) ou version ultérieure
- Autorisation d'accessibilité (pour les données en temps réel de Stocks.app)

## Compilation

```bash
swift build
swift run
```

Ou ouvrez le projet dans Xcode et compilez-le.

## Utilisation

1. Lancez l'application
2. Accordez l'autorisation d'accessibilité lorsque vous y êtes invité (pour les données en temps réel)
3. Ouvrez l'app Apple Stocks (facultatif, pour de meilleurs résultats)
4. Cliquez sur Actualiser pour charger votre liste de suivi
5. Sélectionnez des actions (ou exportez tout)
6. Cliquez sur Exporter et choisissez votre format

## Confidentialité

Cette application :

- Lit uniquement les données de l'app Stocks d'Apple
- Ne se connecte pas à Internet
- Ne collecte ni ne transmet aucune donnée
- Effectue tout le traitement localement sur votre Mac

## Licence

Licence MIT – consultez le fichier [LICENSE](../../../LICENSE) pour plus de détails.
