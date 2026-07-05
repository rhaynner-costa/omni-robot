# AGENT.md — PDV OMNI Robot Framework Automation

## Contexto do Projeto

Automação de testes E2E/UI para o aplicativo desktop **PDV OMNI** (TOTVS Varejo — Módulo Venda Assistida), utilizando Robot Framework com a biblioteca FlaUILibrary para automação de apps Windows.

- **App**: PDV OMNI v4.3.340.0
- **Plataforma**: Windows Desktop (UWP/WPF)
- **Framework**: Robot Framework + robotframework-flaui
- **Identificação de elementos**: AutomationId (via FlaUInspect.exe)
- **Padrão**: Page Objects + Keywords reutilizáveis

---

## Estrutura do Projeto

```
omni-robot/
├── AGENT.md
├── requirements.txt
├── .vscode/
│   ├── extensions.json
│   └── settings.json
├── resources/
│   ├── variables/
│   │   └── common_variables.robot    # Variáveis globais
│   ├── locators/
│   │   ├── login_locators.robot      # AutomationIds da tela de Login
│   │   ├── home_locators.robot       # AutomationIds da Home
│   │   └── atendimento_locators.robot
│   ├── page_objects/
│   │   ├── login_page.robot          # Keywords de ação — Login
│   │   ├── home_page.robot           # Keywords de ação — Home
│   │   └── atendimento_page.robot    # Keywords de ação — Atendimento
│   └── keywords/
│       └── common_keywords.robot     # Keywords transversais (abrir app, login, etc.)
├── tests/
│   └── pedido/
│       └── (testes serão adicionados aqui)
└── results/                          # Relatórios gerados pelo Robot
```

---

## Fluxo do Modo Pedido/Atendimento (mapeado pelas telas)

| # | Tela | Ação |
|---|------|------|
| 1 | Login | Informar usuário e senha → Entrar |
| 2 | Home | Clicar "Iniciar Atendimento" [F10] |
| 3 | Atendimento | Buscar cliente por CPF/CNPJ/Nome |
| 4 | Modal Vendedor | Informar código do vendedor → Aplicar |
| 5 | Modal Iniciar Atendimento | Selecionar Pedido → Iniciar atendimento |
| 6 | Atendimento ativo | Adicionar produto por código/barras |
| 7 | Atendimento ativo | Avançar para Negociação |
| 8 | Negociação | Selecionar forma de pagamento |
| 9 | Salvar Pedido | Confirmar salvamento |

---

## Regras e Padrões do Projeto

- **Locators**: usar exclusivamente `AutomationId`. Nunca usar posição na tela (XPath por índice, coordinate clicks).
- **Mapeamento**: AutomationId é sempre passado primeiro, Name em segundo.
- **Ferramenta de inspeção**: FlaUInspect.exe
- **Page Objects**: separação entre locators (variáveis) e keywords de ação.
- **Um teste por vez**: testes são codificados individualmente com aprovação.
- **Tags**: todos os testes possuem tags para organização e execução seletiva.
- **Comentários**: apenas quando o "porquê" não é óbvio pelo código.
- **Fluxo de solicitações**: A IA primeiro vai **entender a solicitação**, apresentar a **sugestão de implementação** explicando de forma **objetiva e concisa**, e somente vai iniciar a **codificação após aprovação do usuário**.

---

## Guardrails — Regras Obrigatórias

### Interação com campos
- Para digitar em campos: `Click` para foco → `Set Text To Textbox` → `Press Key    s'ENTER'    ${LOCATOR}`.
- `Press Key` (singular): primeiro a tecla, depois o locator — `Press Key    s'ENTER'    ${LOCATOR}`.
- Antes de clicar em botões ou campos de modais/popups: sempre usar `Wait Until Element Is Enabled`.
- **Exceção — campos de senha (PasswordBox):** o Windows bloqueia `Set Text To Textbox`. Usar `pyautogui.typewrite()` exclusivamente nesses campos: `Evaluate    __import__('pyautogui').typewrite('${senha}', interval=0.1)`.

### Estrutura de arquivos
- **Locators nunca em page objects.** Variáveis XPath/AutomationId pertencem exclusivamente a `resources/locators/`.
- Page objects (`resources/page_objects/`) contêm apenas `*** Keywords ***`, sem `*** Variables ***`.

### Preservação de código existente
- A IA **nunca modifica** código que já está funcionando, mesmo que identifique melhorias de formatação, estilo ou organização.
- Alterações ocorrem **somente no escopo exato do que foi solicitado** — nenhuma linha além do necessário.
- Arquivos não mencionados na solicitação **não são tocados**.

### Preservação de código existente
- A IA **nunca modifica** código que já está funcionando, mesmo que identifique melhorias de formatação, estilo ou organização.
- Alterações ocorrem **somente no escopo exato do que foi solicitado** — nenhuma linha além do necessário.
- Arquivos não mencionados na solicitação **não são tocados**.

### Banco de dados
- Conexão via `DatabaseLibrary` com `Connect To Database    psycopg2`.
- Banco do projeto: `TotvsPDV` (não `postgres`).

---

## Dependências

| Pacote | Versão mínima | Finalidade |
|--------|--------------|------------|
| robotframework | 7.0 | Framework de testes |
| robotframework-flaui | 2.0.0 | Automação Windows via FlaUI |

---

## Avanços

| Data | O que foi feito |
|------|----------------|
| 2026-06-20 | Estrutura inicial do projeto criada |
| 2026-06-20 | AGENT.md, requirements.txt, .vscode configurados |
| 2026-06-20 | Variables, Locators (placeholders), Page Objects e Common Keywords criados |
| 2026-06-20 | Função de login implementada em common_keywords.robot |
| 2026-06-23 | AutomationIds reais mapeados: Login, Home e Atendimento (via FlaUInspect) |
| 2026-06-23 | TC001 codificado — fluxo completo: Login → Atendimento → Produto → Negociação → Salvar Pedido |

---

## Próximos Passos

- [ ] Mapear AutomationIds dos botões com TODO nos locators (radio Pedido/Orçamento, Cancelar, etc.)
- [ ] Codificar TC002 — Iniciar Atendimento sem cliente identificado

