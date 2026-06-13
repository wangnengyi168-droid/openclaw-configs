# SKILL.md — page-agent

## 描述
Page Agent —— 嵌入网页的 GUI Agent。用自然语言控制网页界面，无需浏览器扩展/Python/无头浏览器，仅需页面内 JavaScript。

核心特点：
- **简易集成**：一行脚本嵌入，无需后端重写
- **基于文本的 DOM 操作**：无需截图，无需多模态 LLM 或特殊权限
- **自带 LLM**：支持多种模型（Qwen、GPT-4 等）
- **可选 Chrome 扩展**：支持跨标签页任务
- **MCP 服务器**：从外部控制浏览器

适用场景：
- SaaS AI Copilot：快速在产品中嵌入 AI 助手
- 智能表单填写：将 20 次点击的工作流变成一句话
- 无障碍访问：通过自然语言/语音命令访问网页
- 跨页 Agent：通过 Chrome 扩展扩展 Agent 能力
- MCP：让 Agent 客户端控制浏览器

## 触发条件
- 需要自动化网页操作时
- 需要在网页中嵌入 AI 助手时
- 需要用自然语言控制网页表单/按钮时
- 需要跨标签页执行任务时（需 Chrome 扩展）
- 需要通过 MCP 协议控制浏览器时

## 使用方法
### 一行集成（快速体验）
```html
<script src="https://cdn.jsdelivr.net/npm/page-agent@1.8.1/dist/iife/page-agent.demo.js" crossorigin="true"></script>
```
> ⚠️ 仅用于技术评估，使用免费测试 LLM API

### NPM 安装
```bash
npm install page-agent
```

```javascript
import { PageAgent } from 'page-agent'

const agent = new PageAgent({
    model: 'qwen3.5-plus',
    baseURL: 'https://dashscope.aliyuncs.com/compatible-mode/v1',
    apiKey: 'YOUR_API_KEY',
    language: 'en-US',
})

await agent.execute('点击登录按钮')
```

### 目录结构
```
~/.openclaw/workspace/skills/page-agent/
├── packages/
│   ├── core/            # 核心逻辑
│   ├── extension/       # Chrome 扩展
│   ├── llms/            # LLM 集成
│   ├── mcp/             # MCP 服务器
│   ├── page-agent/      # 主包
│   ├── page-controller/ # 页面控制器
│   ├── ui/              # UI 组件
│   └── website/         # 文档网站
├── docs/                # 文档（含中文版）
├── package.json
└── README.md
```

### 使用示例
```
"填写登录表单并提交"
"提取表格中的所有数据"
"点击每个产品链接并保存标题"
```

## 注意事项
- **红线/限制**：遵守网站 robots.txt，避免高频请求
- 免费测试 API 仅用于评估，生产环境需自备 API Key
- Chrome 扩展需要额外安装和权限配置
- 支持模型：Qwen、GPT-4、Claude 等（需配置对应 API）

## 最后更新
2026-05-22

## last_verified
2026-05-22
