[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Une application macOS native pour exporter votre liste de suivi Apple Stocks au format CSV ou JSON.

Apple ne fournit pas de fonctionnalité officielle pour exporter les données de votre liste de suivi Stocks. Cette application résout ce problème à l'aide de deux approches complémentaires :

1. **API d'accessibilité** — Lit en temps réel l'interface de l'application Stocks.app lorsqu'elle est ouverte
2. **Cache du widget** — Traite les fichiers de cache enregistrés localement lorsque l'application n'est pas lancée

## Fonctionnalités

- **Interface SwiftUI native** compatible avec le mode sombre et les dispositions RTL
- **Sources de données multiples** — API d'accessibilité ou traitement du cache
- **Exportation en CSV ou JSON** avec colonnes personnalisables
- **Aperçu avant exportation** — Visualisez exactement les données à exporter
- **Sélection des colonnes** — Choisissez les champs à inclure
- **Copier dans le presse-papiers** — Exportation rapide sans enregistrer de fichier
- **Préférences persistantes** — Mémorise vos paramètres d'exportation
- **Interface localisée** — Disponible en 45 langues

## Langues prises en charge

Stocks Exporter utilise les réglages linguistiques système de macOS et propose une localisation complète en 45 langues (incluant la gestion automatique de l'affichage de droite à gauche pour l'arabe, le persan, l'hébreu et l'ourdou). Retrouvez le tableau complet dans le [README en anglais](../../../README.md#supported-languages).

## Prérequis

- macOS 14.0 (Sonoma) ou version ultérieure
- Autorisation d'accessibilité (pour lire les données en direct depuis Stocks.app)

## Compilation

```bash
swift build
swift run
```

Ou ouvrez le projet dans Xcode et lancez la compilation.

## Mode d'emploi

1. Lancez l'application
2. Accordez l'accès à l'accessibilité à la demande du système (pour les données en direct)
3. Ouvrez l'application Apple Stocks (facultatif, pour des résultats optimaux)
4. Cliquez sur Rafraîchir pour charger votre liste de suivi
5. Sélectionnez des titres (ou exportez la liste complète)
6. Cliquez sur Exporter et choisissez votre format

## Confidentialité

Cette application :

- Lit exclusivement les données de l'application Apple Stocks
- Ne se connecte pas à Internet
- Ne collecte ni ne transmet aucune donnée
- Réalise tout le traitement localement sur votre Mac

## Licence

Licence MIT — consultez le fichier [LICENSE](../../../LICENSE) pour en savoir plus.
