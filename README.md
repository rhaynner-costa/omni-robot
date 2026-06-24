# PDV OMNI — Automação de Testes

Automação de testes E2E/UI para o **PDV OMNI** (TOTVS Varejo), cobrindo os modos **Pedido** e **Venda**. Desenvolvido com Robot Framework + FlaUILibrary para automação de apps Windows Desktop.

---

## Pré-requisitos

- Python 3.11+
- PDV OMNI instalado
- **Processo do PDV online** — o serviço do PDV OMNI deve estar em execução e com conexão ativa antes de rodar os testes
- [FlaUInspect.exe](https://github.com/FlaUI/FlaUInspect) (para mapeamento de elementos)
- PostgreSQL (banco `TotvsPDV` acessível em localhost)
- Extensão VS Code [RobotCode](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode)

## Instalação

```bash
pip install -r requirements.txt
```

---

## Estrutura

```
omni-robot/
├── resources/
│   ├── variables/
│   │   ├── common_variables.robot   # Variáveis globais (app, credenciais, timeouts, device)
│   │   └── db_variables.robot       # Credenciais do banco de dados
│   ├── locators/                    # AutomationIds mapeados por tela
│   │   ├── login_locators.robot
│   │   ├── home_locators.robot
│   │   ├── atendimento_locators.robot
│   │   ├── prevenda_locators.robot
│   │   └── pagamento_locators.robot
│   ├── page_objects/                # Keywords de ação por tela
│   │   ├── login_page.robot
│   │   ├── home_page.robot
│   │   ├── atendimento_page.robot
│   │   ├── prevenda_page.robot
│   │   └── pagamento_page.robot
│   └── keywords/
│       ├── common_keywords.robot    # Keywords transversais (abrir app, login, etc.)
│       └── db_keywords.robot        # Keywords de banco de dados
├── tests/
│   ├── pedido/
│   │   └── TC001_iniciar_atendimento.robot
│   └── venda/
│       └── TC001_venda.robot
└── results/                         # Relatórios gerados (ignorado pelo git)
```

---

## Como Executar

### Rodar um módulo específico

```bash
# Modo Pedido
robot -d results tests/pedido/TC001_iniciar_atendimento.robot

# Modo Venda
robot -d results tests/venda/TC001_venda.robot
```

### Rodar jornada completa (pedido + venda em sequência)

```bash
robot -i jornada_1 -d results tests/
```

---

## Jornadas Mapeadas

| Tag | Descrição | Testes |
|-----|-----------|--------|
| `jornada_1` | Pedido com cliente identificado → Resgate de pré-venda | TC001 pedido + TC001 venda |

---

## Relatórios

Após cada execução os relatórios ficam em `results/`:

```bash
results/
├── output.xml
├── log.html      # Log detalhado com screenshots
└── report.html   # Relatório resumido
```
