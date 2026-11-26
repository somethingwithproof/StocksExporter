[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Un'app macOS nativa per esportare la tua watchlist di Apple Stocks in formato CSV o JSON.

Apple non offre un modo ufficiale per esportare i dati della tua watchlist di Stocks. Questa app risolve il problema utilizzando due metodi complementari:

1. **API di Accessibilità** – Legge in tempo reale l'interfaccia dell'app Stocks.app in esecuzione
2. **Cache del widget** – Analizza i file di cache salvati localmente quando l'app non è aperta

## Funzionalità

- **Interfaccia SwiftUI nativa** con supporto per la modalità scura e il layout RTL
- **Origini dati multiple** – API di Accessibilità o analisi della cache
- **Esportazione in CSV o JSON** con colonne personalizzabili
- **Anteprima prima dell'esportazione** – Verifica esattamente cosa stai esportando
- **Selezione delle colonne** – Scegli quali campi dati includere
- **Copia negli appunti** – Esportazione rapida senza salvare file
- **Preferenze persistenti** – Ricorda le tue impostazioni di esportazione
- **Interfaccia localizzata** – Disponibile in 45 lingue

## Lingue supportate

Stocks Exporter utilizza le preferenze di lingua di sistema di macOS e include la localizzazione completa per 45 lingue (incluso il supporto automatico per il layout da destra a sinistra per arabo, persiano, ebraico e urdu). Consulta l'elenco completo nel [README in inglese](../../../README.md#supported-languages).

## Requisiti

- macOS 14.0 (Sonoma) o successivo
- Autorizzazione di Accessibilità (per i dati in tempo reale da Stocks.app)

## Compilazione

```bash
swift build
swift run
```

Oppure apri il progetto in Xcode e compilalo.

## Utilizzo

1. Avvia l'app
2. Concedi l'autorizzazione di Accessibilità quando richiesto (per i dati in tempo reale)
3. Apri l'app Apple Stocks (opzionale, per risultati ottimali)
4. Fai clic su Aggiorna per caricare la tua watchlist
5. Seleziona i titoli (oppure esportali tutti)
6. Fai clic su Esporta e scegli il formato

## Privacy

Questa app:

- Legge solo i dati dall'app Stocks di Apple
- Non si connette a Internet
- Non raccoglie né trasmette alcun dato
- Elabora tutto localmente sul tuo Mac

## Licenza

Licenza MIT – consulta il file [LICENSE](../../../LICENSE) per i dettagli.
