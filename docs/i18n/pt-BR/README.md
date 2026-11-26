[English](../../../README.md)

# Stocks Exporter

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_StocksExporter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_StocksExporter)
[![License](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/StocksExporter/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/StocksExporter)

Um aplicativo nativo para macOS para exportar sua lista de acompanhamento do Apple Stocks para o formato CSV ou JSON.

A Apple não oferece uma maneira oficial de exportar os dados da sua lista de acompanhamento do Stocks. Este aplicativo resolve esse problema usando dois métodos complementares:

1. **API de Acessibilidade** – Lê a interface do Stocks.app em execução em tempo real
2. **Cache do Widget** – Analisa arquivos de cache armazenados localmente quando o aplicativo não está aberto

## Recursos

- **Interface nativa em SwiftUI** com suporte a modo escuro e layout RTL
- **Múltiplas fontes de dados** – API de Acessibilidade ou análise de cache
- **Exportação para CSV ou JSON** com colunas personalizáveis
- **Pré-visualização antes de exportar** – Veja exatamente o que você está exportando
- **Seleção de colunas** – Escolha quais campos de dados incluir
- **Copiar para a área de transferência** – Exportação rápida sem salvar arquivo
- **Preferências persistentes** – Lembra suas configurações de exportação
- **Interface localizada** – Disponível em 45 idiomas

## Idiomas suportados

O Stocks Exporter usa as preferências de idioma do sistema do macOS e inclui localizações completas para 45 idiomas (incluindo suporte automático a layout da direita para a esquerda para árabe, persa, hebraico e urdu). Veja a lista completa no [README em inglês](../../../README.md#supported-languages).

## Requisitos

- macOS 14.0 (Sonoma) ou posterior
- Permissão de Acessibilidade (para dados em tempo real do Stocks.app)

## Compilação

```bash
swift build
swift run
```

Ou abra no Xcode e compile.

## Como usar

1. Abra o aplicativo
2. Conceda permissão de Acessibilidade quando solicitado (para dados em tempo real)
3. Abra o app Apple Stocks (opcional, para melhores resultados)
4. Clique em Atualizar para carregar sua lista de acompanhamento
5. Selecione ações (ou exporte todas)
6. Clique em Exportar e escolha o formato

## Privacidade

Este aplicativo:

- Lê apenas dados do app Stocks da Apple
- Não se conecta à internet
- Não coleta nem transmite nenhum dado
- Todo o processamento acontece localmente no seu Mac

## Licença

Licença MIT – consulte o arquivo [LICENSE](../../../LICENSE) para mais detalhes.
