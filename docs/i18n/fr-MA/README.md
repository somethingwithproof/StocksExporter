[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Une application macOS native permettant d'exporter votre liste de suivi Apple Stocks au format CSV ou JSON.

Apple ne propose aucun moyen officiel d'exporter les données de votre liste de suivi Stocks. Cette application répond à ce besoin grâce à deux méthodes complémentaires :

1. **API d'accessibilité** — Lit en temps réel l'interface de l'application Stocks.app en cours d'exécution
2. **Cache du widget** — Analyse les fichiers de cache enregistrés localement lorsque l'application n'est pas ouverte

## Fonctionnalités

- **Interface SwiftUI native** prenant en charge le mode sombre et l'affichage RTL
- **Sources de données multiples** — API d'accessibilité ou analyse du cache
- **Export au format CSV ou JSON** avec colonnes personnalisables
- **Aperçu avant export** — Vérifiez précisément les données à exporter
- **Sélection des colonnes** — Choisissez les champs de données à inclure
- **Copie dans le presse-papiers** — Export rapide sans créer de fichier
- **Préférences persistantes** — Conserve automatiquement vos paramètres d'export
- **Interface localisée** — Disponible en 45 langues

## Langues prises en charge

Stocks Exporter s'adapte aux préférences linguistiques système de macOS et inclut une localisation complète pour 45 langues (avec prise en charge automatique de la disposition de droite à gauche pour l'arabe, le persan, l'hébreu et l'ourdou). Consultez la liste complète dans le [README en anglais](../../../README.md#supported-languages).

## Prérequis

- macOS 14.0 (Sonoma) ou version ultérieure
- Autorisation d'accessibilité (pour les données en temps réel depuis Stocks.app)

## Compilation

```bash
swift build
swift run
```

Vous pouvez également ouvrir le projet dans Xcode et le compiler.

## Utilisation

1. Ouvrez l'application
2. Accordez l'autorisation d'accessibilité lorsqu'elle est demandée (pour les données en temps réel)
3. Ouvrez l'application Apple Stocks (facultatif, recommandé pour de meilleurs résultats)
4. Cliquez sur Actualiser pour charger votre liste de suivi
5. Sélectionnez des valeurs (ou exportez l'ensemble)
6. Cliquez sur Exporter et choisissez le format souhaité

## Confidentialité

Cette application :

- Lit uniquement les données issues de l'application Apple Stocks
- N'établit aucune connexion Internet
- Ne collecte ni ne transmet aucune donnée
- Effectue l'intégralité du traitement localement sur votre Mac

## Licence

Licence MIT — consultez le fichier [LICENSE](../../../LICENSE) pour les détails.
