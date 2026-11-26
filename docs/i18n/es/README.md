[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Una aplicación nativa de macOS para exportar tu lista de seguimiento de Apple Stocks en formato CSV o JSON.

Apple no ofrece ninguna forma oficial de exportar los datos de tu lista de seguimiento de Stocks. Esta aplicación resuelve el problema mediante dos métodos complementarios:

1. **API de Accesibilidad** – Lee la interfaz de Stocks.app en ejecución en tiempo real
2. **Caché del widget** – Analiza archivos de caché almacenados localmente cuando la aplicación no está abierta

## Características

- **Interfaz nativa en SwiftUI** con compatibilidad con modo oscuro y diseño RTL
- **Múltiples fuentes de datos** – API de Accesibilidad o análisis de caché
- **Exportación a CSV o JSON** con columnas personalizables
- **Vista previa antes de exportar** – Revisa exactamente qué vas a exportar
- **Selección de columnas** – Elige qué campos de datos incluir
- **Copiar al portapapeles** – Exportación rápida sin guardar un archivo
- **Preferencias persistentes** – Recuerda tu configuración de exportación
- **Interfaz localizada** – Disponible en 45 idiomas

## Idiomas admitidos

Stocks Exporter utiliza las preferencias de idioma del sistema de macOS e incluye localizaciones completas para 45 idiomas (incluida compatibilidad automática de diseño de derecha a izquierda para árabe, persa, hebreo y urdu). Consulta la lista completa de idiomas en el [README en inglés](../../../README.md#supported-languages).

## Requisitos

- macOS 14.0 (Sonoma) o posterior
- Permiso de Accesibilidad (para datos en tiempo real de Stocks.app)

## Compilación

```bash
swift build
swift run
```

O ábrelo en Xcode y compílalo.

## Uso

1. Inicia la aplicación
2. Concede el permiso de Accesibilidad cuando se solicite (para datos en tiempo real)
3. Abre la app Apple Stocks (opcional, para obtener los mejores resultados)
4. Haz clic en Actualizar para cargar tu lista de seguimiento
5. Selecciona acciones (o exporta todas)
6. Haz clic en Exportar y elige tu formato

## Privacidad

Esta aplicación:

- Solo lee datos de la app Stocks de Apple
- No se conecta a internet
- No recopila ni transmite ningún dato
- Todo el procesamiento ocurre localmente en tu Mac

## Licencia

Licencia MIT – consulta el archivo [LICENSE](../../../LICENSE) para obtener más detalles.
