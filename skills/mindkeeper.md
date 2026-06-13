# SKILL.md — mindkeeper

## 描述
**Agent 配置的时间机器**。为 AI 的脑（SOUL.md、AGENTS.md、MEMORY.md、skills/**/*.md）提供版本控制。

核心功能：
- **自动快照**：后台捕获变更，即使忘记手动 checkpoint 也有历史记录
- **可读历史**：查看什么变了、何时变的、Agent 如何演化的
- **快速 diff**：比较任意两个版本，查看塑造行为的精确措辞变化
- **安全回滚**：恢复到早期版本，且回滚本身也可撤销
- **命名 checkpoint**：在重大实验前保存里程碑（如 `stable-v2`）
- **LLM 驱动摘要**（OpenClaw 模式）：将原始 diff 转为可读的 changelog

两种模式：
1. **OpenClaw 插件**：注册 `mind_*` 工具，自动启动 watcher，支持 LLM 生成 commit 消息
2. **独立 CLI**：在任何目录跟踪 agent markdown 文件，无需 OpenClaw

## 触发条件
- 需要备份当前 Agent 配置时
- 需要回滚到之前的配置版本时
- 需要查看配置变更历史时
- 需要在重大修改前创建 checkpoint 时
- 需要比较两个版本的 SOUL.md/AGENTS.md 差异时

## 使用方法
### 安装（OpenClaw 插件模式）
```bash
# 方式 1：直接安装插件
openclaw plugins install mindkeeper-openclaw
# 然后重启 Gateway

# 方式 2：通过技能安装（AI 会引导设置）
cd ~/.openclaw/workspace/skills/mindkeeper
pnpm install  # 或 npm install
```

### 安装（独立 CLI 模式）
```bash
cd ~/.openclaw/workspace/skills/mindkeeper
pnpm install
pnpm build
# 使用 CLI 命令
```

### 目录结构
```
~/.openclaw/workspace/skills/mindkeeper/
├── packages/          # monorepo 子包
├── node_modules/
├── package.json
├── pnpm-lock.yaml
└── README.md          # 完整文档
```

### 常用命令
```bash
# 创建快照
mindkeeper snapshot --name "pre-update" --message "更新前备份"

# 查看历史
mindkeeper history

# 比较差异
mindkeeper diff --from v1 --to v2

# 回滚
mindkeeper rollback --to v1

# 创建 checkpoint
mindkeeper checkpoint --name "stable-v2"
```

## 注意事项
- **红线/限制**：回滚操作会覆盖当前配置，执行前建议先创建快照
- 历史存储在 `.mindkeeper/` 影子仓库中，原文件位置不变
- OpenClaw 模式下 AI 可直接操作历史，注意权限控制
- 定期清理旧快照以节省空间

## 最后更新
2026-05-22

## last_verified
2026-05-22
