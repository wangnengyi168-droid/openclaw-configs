---
name: browser-use
version: 0.12.5
description: >
  🌐 AI Agent browser automation. Control web browsers with natural language —
  fill forms, scrape data, click buttons, navigate pages, extract structured
  information. 92K+ GitHub stars, MIT licensed.
  Use when: the task involves web browser interaction (forms, data extraction,
  login flows, web scraping), or when clawdcursor is too heavy for simple
  web tasks. Complements clawdcursor — browser-use for web, clawdcursor for
  desktop apps.
homepage: https://browser-use.com
source: https://github.com/browser-use/browser-use
metadata:
  openclaw:
    requires:
      bins:
        - python3
        - browser-use
    install:
      - pip3 install browser-use --break-system-packages
      - playwright install chromium
---

# Browser-Use — AI Agent Browser Automation

**92K+ stars** on GitHub. The standard library for AI agents to control web browsers.

## Quick Start

```bash
# Already installed
browser-use --version
```

## Core Capabilities

| Capability | Description |
|-----------|-------------|
| 🌐 Navigation | Open URLs, follow links, go back/forward |
| 📝 Form Filling | Fill text inputs, select dropdowns, checkboxes |
| 🖱️ Clicking | Click buttons, links, any interactive element |
| 📄 Data Extraction | Scrape tables, lists, structured data from pages |
| 🔐 Authentication | Handle login forms, cookies, sessions |
| 📸 Screenshots | Capture page screenshots for visual verification |
| 🔍 Search | Execute search queries and parse results |
| 📊 Structured Output | Extract data as JSON/dict with defined schemas |

## Usage

```python
from browser_use import Agent
from langchain_openai import ChatOpenAI

agent = Agent(
    task="Go to google.com, search for 'OpenClaw AI agent', and return the first 5 results",
    llm=ChatOpenAI(model="gpt-4"),
)
result = agent.run()
```

## Integration with our Agent System

- **情报专员**: Web scraping for intelligence gathering
- **Claude Code**: Automate web-based workflows
- **总管**: Data extraction from supplier websites, competitor analysis
- **山立搜索系统**: Web-based quote gathering automation
