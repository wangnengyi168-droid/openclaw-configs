# Claude Code 技能 - AI 员工集成

## 描述
调用本地 Claude Code 服务处理代码任务，让专业的人做专业的事。

## 触发条件
当用户请求涉及以下任务时自动使用：
- 代码生成/编写
- Bug 调试/修复
- 代码审查/优化
- 脚本开发
- 函数/类设计

## 使用方法

### 1. 直接调用（推荐）
```bash
/home/wang/.openclaw/workspace/scripts/claude-code-tool.sh "任务描述" [模型]
```

模型选项：
- `auto` (默认) - 智能路由
- `qwen2.5:14b` - 本地快速
- `deepseek-chat` - 云端高质量

### 2. API 调用
```bash
curl -X POST "http://localhost:8080/generate" \
    -H "Content-Type: application/json" \
    -d '{"prompt": "任务描述", "model": "auto"}'
```

## 服务状态检查
```bash
curl -s http://localhost:8080/health
```

## 日志位置
`/home/wang/.openclaw/workspace/logs/claude-code-tool.log`

---

*AI 员工 24 小时待命，随叫随到* 🐾
