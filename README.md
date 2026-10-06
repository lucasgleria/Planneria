# Planneria

Planejador diário pessoal para iOS (SwiftUI + SwiftData), instalado via SideStore. Plano completo em `../Plano_Alinhado.md`.

Bundle ID: `com.lucasleria.planneria` (congelado). O SideStore pode acrescentar um sufixo de Team ID ao assinar; ele se mantém igual entre refreshes, então os dados persistem.

## Fase 0: provar o pipeline

1. Publicar este diretório como repositório **público** no GitHub (a raiz do repositório é a pasta `app`).
2. Em *Actions*, aguardar o workflow "Build iOS". Ele roda os testes e gera o artefato `Planneria-ipa`.
3. Baixar o `Planneria.ipa` e abri-lo no iPhone pelo SideStore.
4. No app, tocar em **Gravar PERSISTENCIA_OK**, fechar e reabrir.
5. Mudar `MARKETING_VERSION` para `0.0.2` em `project.yml`, dar push, baixar o novo IPA e instalar **por cima**, sem apagar o app.
6. Confirmar que o registro gravado na v0.0.1 continua aparecendo.

Só depois de aprovar o passo 6 começam as telas reais (Fase 1 em diante).
