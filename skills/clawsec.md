# SKILL.md — clawsec

## 描述
ClawSec 是 OpenClaw/NanoClaw/Hermes 平台的完整安全技能套件。提供统一的安全监控、完整性验证和威胁情报，保护 AI Agent 的认知架构免受提示注入、漂移和恶意指令攻击。

核心功能：
- **套件安装器**：一键安装所有安全技能，带完整性验证
- **文件完整性保护**：检测关键 Agent 文件（SOUL.md、IDENTITY.md 等）的漂移并自动恢复
- **实时安全公告**：自动轮询 NVD CVE 和社区威胁情报
- **安全审计**：自检脚本检测提示注入标记和漏洞
- **校验和验证**：所有技能工件的 SHA256 校验和
- **健康检查**：自动更新和完整性验证所有已安装技能

支持平台：OpenClaw、NanoClaw、Hermes、Picoclaw

## 触发条件
- 需要安装或验证 OpenClaw 安全技能时
- 需要检测 Agent 配置文件是否被篡改时
- 需要运行安全审计或自渗透测试时
- 需要检查最新 CVE 威胁情报时
- 需要验证技能安装完整性时

## 使用方法
### 套件安装
```bash
# 安装完整安全套件
cd ~/.openclaw/workspace/skills/clawsec
npm install  # 或 pnpm install
```

### 技能目录
已包含 12 个子技能：
- `claw-release` - OpenClaw 发布验证
- `clawsec-clawhub-checker` - ClawHub 技能检查器
- `clawsec-feed` - 安全公告订阅
- `clawsec-nanoclaw` - NanoClaw 容器化安全
- `clawsec-scanner` - 安全扫描器
- `clawsec-suite` - 套件管理器
- `clawtributor` - 贡献者工具
- `hermes-attestation-guardian` - Hermes 证明守护
- `openclaw-audit-watchdog` - OpenClaw 审计监控
- `picoclaw-security-guardian` - Picoclaw 安全守护
- `picoclaw-self-pen-testing` - Picoclaw 自渗透测试
- `soul-guardian` - SOUL.md 漂移检测

### 安全公告
```bash
# 查看 advisories 目录中的 CVE 数据
ls ~/.openclaw/workspace/skills/clawsec/advisories/
```

### 签名验证
使用 `clawsec-signing-public.pem` 验证技能签名。

## 注意事项
- **红线/限制**：仅在授权范围内进行安全扫描，避免对生产环境造成影响
- 渗透测试技能需要明确授权才能执行
- 安全公告数据来自 NVD 和社区，需自行验证关键漏洞
- 文件完整性保护会监控关键 Agent 文件，修改时可能触发告警

## 最后更新
2026-05-22

## last_verified
2026-05-22
