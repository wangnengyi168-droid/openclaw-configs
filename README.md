# OpenClaw Configs

老王的 OpenClaw 运维配置仓库。

## 目录结构

```
├── scripts/          # 运维脚本（NOC监控、备份、Wiki同步等）
├── skills/           # Agent Skill 定义文件
├── templates/        # 报告模板
├── docs/             # 技术文档（网络拓扑等）
└── image-search-tools/  # 图片搜索工具
```

## 脚本说明

| 脚本 | 用途 |
|------|------|
| `noc_monitor.sh` | NOC 健康检查监控 |
| `noc_health_check.sh` | 系统健康状态检测 |
| `sync_session_to_wiki.sh` | 会话记录自动归档到 Wiki |

## Skills

包含 20+ 个 Agent Skill 定义，覆盖：
- iKuai 网关运维
- 向日葵远程控制
- 群晖 NAS 管理
- 网络安全攻防演练
- 桌面自动化
- 股票分析
- 知识库管理

## 更新频率

每周自动同步，保持与本地环境一致。

---
*Last updated: 2026-06-13*
