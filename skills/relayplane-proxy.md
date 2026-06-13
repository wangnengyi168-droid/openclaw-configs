# SKILL.md — relayplane-proxy

## 描述
RelayPlane Proxy —— Node.js npm LLM 代理，位于 AI Agent 和提供商之间。可替代 OpenAI 和 Anthropic 基础 URL，无需 Docker/Python，仅需 `npm install`。

核心功能：
- **每次请求成本追踪**：覆盖 11+ 提供商
- **缓存感知成本追踪**：准确追踪 Anthropic 提示缓存的读取节省、创建成本和真实每次请求成本
- **可配置的任务感知路由**：基于复杂度、级联、模型覆盖的路由策略
- **断路器**：代理失败时 Agent 无感知
- **本地仪表板**：`localhost:4100` 查看成本分解、节省分析、提供商健康、Agent 分解
- **预算执行**：每日/每小时/每请求支出限制，支持阻止/警告/降级/告警操作
- **异常检测**：实时捕获失控 Agent 循环、成本激增、token 爆炸
- **成本告警**：可配置百分比阈值告警，Webhook 推送，告警历史
- **自动降级**：预算触达时自动切换到更便宜模型
- **激进缓存**：精确匹配响应缓存，gzip 磁盘持久化
- **每 Agent 成本追踪**：通过系统提示指纹识别 Agent，追踪每个 Agent 成本
- **内容日志**：仪表板显示每次请求的系统提示预览、用户消息、响应预览
- **OAuth 传递**：正确转发 `user-agent` 和 `x-app` 头（兼容 OpenClaw）
- **Osmosis mesh**：集体学习层，跨用户共享匿名路由信号（默认开启，可关闭）
- **systemd/launchd 服务**：`relayplane service install` 实现常开操作，自动重启
- **健康监控**：`/health` 端点带运行时间追踪和主动探测
- **配置弹性**：原子写入、自动备份/恢复、凭据分离

实时节省仪表板：[relayplane.com/live](https://relayplane.com/live)

## 触发条件
- 需要降低 AI API 调用成本时
- 需要智能路由 AI 请求到不同模型时
- 需要追踪每次 LLM 调用成本时
- 需要缓存 AI 响应以减少重复调用时
- 需要设置预算限制和告警时

## 使用方法
### 安装
```bash
npm install -g @relayplane/proxy
```

### 快速启动
```bash
relayplane init
relayplane start
# 仪表板地址：http://localhost:4100
```

### 配置 Agent
```bash
# 设置环境变量
export ANTHROPIC_BASE_URL=http://localhost:4100
export OPENAI_BASE_URL=http://localhost:4100
```

### Claude Code 自动启动
添加到 `~/.claude/settings.json`：
```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "relayplane ensure-running"
          }
        ]
      }
    ]
  }
}
```

### 目录结构
```
~/.openclaw/workspace/skills/relayplane-proxy/
├── src/               # TypeScript 源码
├── scripts/           # 脚本工具
│   ├── extract-knowledge.js
│   └── v1.7-harness.sh
├── test/              # 测试
├── __tests__/         # 集成测试
├── package.json
└── README.md          # 完整文档（655+ 行）
```

### 常用命令
```bash
# 查看状态
relayplane status

# 停止/重启
relayplane stop
relayplane start

# 安装为系统服务
relayplane service install

# 关闭遥测/mesh
relayplane telemetry off
relayplane mesh off
```

## 注意事项
- **红线/限制**：代理服务本地运行，提示数据不出本地
- 支持 11+ 提供商：Anthropic、OpenAI、Gemini、OpenRouter、xAI 等
- 缓存和路由策略可自定义，根据需求调整
- v1.8.14+ 版本遥测和 mesh 默认开启，可手动关闭

## 最后更新
2026-05-22

## last_verified
2026-05-22
