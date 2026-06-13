---
name: workspace-organizer
description: 工作空间整理与档案归档规范——文件命名、目录结构、密码存储、客户档案、报告归档的强制标准。适用于：(1) 新项目/客户建档 (2) 完成运维任务后存档 (3) 密码/凭据管理 (4) 定期清理临时文件 (5) 任何写文件操作前必查。任何Agent写文件前必须遵循本规范。
---

# 工作空间整理与档案归档规范

> ⚠️ **强制规范** — 所有 Agent 在创建/移动/修改文件前必须查阅本规范
> 最后更新：2026-05-04 | 制定人：总管 🐾 | 审核：多方会议（阿里云+DeepSeekV4+Hermes+Claude Code）

---

## 🎯 总管观点

**这套规范的核心就一句话：不再把时间浪费在找文件和重头排查上。**

今早西图 L2TP 部署就是一个典型案例——PPTP 连接已配好、API 令牌已研究过、网关密码已测试过，但因为这些信息散落在聊天记录、skill 文档、记忆文件的各处，没有统一存档，白白花了 40 分钟重新排查。

这不是能力问题，是**没有归档纪律**的问题。

规则写在这里了，**我（总管）和所有子 Agent 必须遵守**。违反一次，下次老王开会就得解释原因。

---

## 一、目录结构（硬性标准）

```
workspace/
├── AGENTS.md              # 总管行为规范
├── SOUL.md                # 人格定义
├── USER.md                # 用户档案（作息、偏好、联系方式）
├── MEMORY.md              # 长期记忆（决策、经验、教训）
├── TOOLS.md               # 本地工具配置（SSH、设备别名等）
├── HEARTBEAT.md           # 心跳任务
│
├── customers/             # 👈 客户技术档案（核心）
│   └── {客户名}/
│       ├── README.md      # 网络拓扑、设备清单、技术摘要
│       ├── credentials.asc # 🔒 GPG加密凭据（非明文！）
│       └── sessions/      # 运维记录 {YYYY-MM-DD}.md
│
├── ikuai_reports/         # 爱快巡检/审计报告
│   ├── screenshots/       # 截图归档
│   ├── data/              # JSON原始数据
│   └── *.md               # 报告文件
│
├── reports_archive/       # 历史报告按月归档
│   └── YYYY-MM/           # 例：2026-04/
│
├── memory/                # 每日记忆（每日自动生成）
│   └── YYYY-MM-DD.md
│
├── shared_knowledge/      # Agent协同知识库
├── scripts/               # 运维脚本
├── skills/                # 技能文件
├── stock-project/         # 股票交易系统
├── stock-learning/        # 股票学习材料
├── 股票交易系统/           # 交易系统（中文版）
├── 龙虾账本/               # 财务数据
└── raw/                   # 微信聊天原始记录（只读）
```

### 🚫 根目录禁止项
- ❌ 报告文件（移到对应子目录）
- ❌ 临时截图（放入 tmp/ 或用后删除）
- ❌ JSON 数据文件（放入对应子目录的 data/）
- ✅ 只允许元文件：AGENTS / SOUL / MEMORY / TOOLS / USER / HEARTBEAT / DREAMS / IDENTITY

---

## 二、文件命名规范

```
{客户/项目}_{类型}_{日期}[_{版本}].{扩展名}

正确示例：
  西图_网络拓扑_20260504.md
  山立_防火墙审计_20260504_v2.md
  K金_ARP绑定表_20260503.csv

错误示例：
  ❌ 报告.md
  ❌ 审计报告_4月1日-10日.md
  ❌ final_v3_revised_final2.md
```

| 类型 | 格式 | 示例 |
|------|------|------|
| 巡检报告 | `{客户}_巡检_{日期}.md` | `山立_巡检_20260504.md` |
| 安全审计 | `{客户}_安全审计_{日期}.md` | `西图_安全审计_20260504.md` |
| 配置变更 | `{客户}_配置变更_{日期}.md` | `西图_L2TP部署_20260504.md` |
| 网络拓扑 | `{客户}_网络拓扑_{日期}.md` | `山立_网络拓扑_20260504.md` |
| 防火墙日志 | `{客户}_防火墙_{日期}.md` | `K金_防火墙_20260504.md` |

---

## 三、密码与凭据管理 🔒

### ⚠️ 明文否决

**禁止在任何 .md / .json / .txt / .py 文件中明文存储密码或 API 令牌。**

credential.md 明文方案已被阿里云审计否决，必须用加密。

### 推荐方案：GPG 对称加密

```bash
# 创建/更新凭据文件
gpg --symmetric --cipher-algo AES256 -o customers/{客户名}/credentials.asc

# 读取凭据
gpg --decrypt customers/{客户名}/credentials.asc 2>/dev/null

# 编辑凭据
gpg --decrypt customers/{客户名}/credentials.asc > /tmp/cred_tmp.md
vim /tmp/cred_tmp.md
gpg --symmetric --cipher-algo AES256 -o customers/{客户名}/credentials.asc /tmp/cred_tmp.md
shred -u /tmp/cred_tmp.md
```

### 凭据文件模板

```yaml
# {客户名} 凭据档案
# 更新: YYYY-MM-DD | 更新人: 总管

网关:
  公网入口: http://{IP}:81
  内网IP: 192.168.x.1
  用户名: {username}
  密码: {password}
  API令牌: {token}

VPN:
  PPTP:
    服务器: {server}
    用户名: {user}
    密码: {password}
  L2TP:
    预共享密钥: {psk}
    用户名: {user}
    密码: {password}

其他:
  ToDesk设备码: {device_id}
  ToDesk临时密码: {password}
```

### 权限设置

```bash
chmod 600 customers/{客户名}/credentials.asc
chmod 700 customers/{客户名}/
```

---

## 四、客户档案标准（customers/{客户名}/README.md）

每次完成客户技术工作后，**必须**更新此文件。这是下次接手的第一入口。

### README.md 必填项

```markdown
# {客户名} 技术档案

> 最后更新：YYYY-MM-DD | 更新人：总管 🐾

## 基本信息
- 公司全称：
- 联系人：
- 电话：
- 地址：

## 网络拓扑
（文字描述 + IP规划表）
- 中心节点：192.168.1.1（公网 xx.xx.xx.xx:81）
- 分厂1：192.168.x.1
- 分厂2：192.168.x.1
- 互联方式：PPTP / L2TP / SD-WAN

## 网关清单
| 名称 | LAN网段 | 公网IP | 固件版本 | 爱快云GWID |
|------|---------|--------|----------|-----------|
| 总部 | 192.168.1.0/24 | x.x.x.x | 4.0.x | xxxx |

## VPN配置
- 类型：PPTP（已部署） / L2TP（待迁移）
- 服务端：
- 客户端：
- 地址池：
- 凭据文件：credentials.asc

## 运维记录
| 日期 | 操作 | 结果 |
|------|------|------|
| YYYY-MM-DD | 操作内容 | 成功/失败 |
```

---

## 五、报告归档规则

| 报告类型 | 存放位置 | 归档时机 | 保留期 |
|----------|----------|----------|--------|
| 巡检报告 | ikuai_reports/ | 生成即刻 | 永久 |
| 安全审计 | ikuai_reports/ | 生成即刻 | 永久 |
| 配置变更记录 | customers/{客户}/sessions/ | 操作完成即刻 | 永久 |
| 临时工作文件 | /tmp/ | 用完删除 | ≤24h |
| 调试截图 | 删除 | 用完删除 | 即刻 |
| 历史月报 | reports_archive/YYYY-MM/ | 次月1日 | 永久 |

---

## 六、截图与临时文件

### 截图存放规则
- 调试过程的截图 → **用完必须删除**
- 需要保留的 → 放入对应目录的 `screenshots/` 子目录
- 临时文件统一放 `/tmp/` 不要污染工作空间

### 自动清理（建议cron）

```bash
# 每日清理7天以前的临时截图
find /tmp -name "*.png" -mtime +7 -delete 2>/dev/null
```

---

## 七、权限矩阵

| 目录 | 权限 | 说明 |
|------|------|------|
| customers/{客户}/ | 700 | 老王和可信Agent |
| customers/{客户}/credentials.asc | 400 | 只读加密 |
| ikuai_reports/ | 755 | 报告可共享 |
| memory/ | 700 | 个人记忆 |
| reports_archive/ | 755 | 历史归档 |
| scripts/ | 755 | 可执行脚本 |

---

## 八、.gitignore 必须包含

```gitignore
# 凭据（绝对不能提交）
customers/*/credentials.asc
customers/*/credentials.md
*.gpg
*.key

# 临时文件
*.png
*.jpg
tmp/

# 敏感配置
.env
*secret*
*credential*
```

---

## 九、执行纪律

### 每次完成客户技术工作后：

1. ✅ 更新 `customers/{客户}/README.md`
2. ✅ 更新 `customers/{客户}/credentials.asc`（如有变更）
3. ✅ 写运维记录到 `customers/{客户}/sessions/{日期}.md`
4. ✅ 删除本次产生的临时截图
5. ✅ 如有巡检报告，放入 `ikuai_reports/`

### 每次发现新信息时：

- 网关密码/令牌 → 立即加密存入 credentials.asc
- 网络拓扑变更 → 立即更新 README.md
- 新联系人 → 更新 README.md

### Agent 启动时：

- 如果任务涉及特定客户，**必须先读** `customers/{客户}/README.md`
- 如果需要凭据，通过 `gpg --decrypt` 读取

---

## 十、采集与生成分离（防模型编数据）

> ⚠️ 2026-05-04新增 — 等保合规 + 2026-05-03假数据事故教训

### 核心原则
**数据采集和报告生成必须分离。模型只做分析，不做采集。**

### 工作流程
```
采集器(纯机械脚本)          模型/Agent(只做分析)
─────────────────          ───────────────────
Playwright登录网关           读取 raw JSON
↓                            ↓
调用API + DOM提取            阈值判断(ARP<50%标红等)
↓                            ↓
输出 raw_{日期}.json          生成分析报告
(无判断、无结论、无文本)       (有判断、有建议、有文字)
```

### 强制规则
1. **采集脚本禁止输出分析文本** — 只输出JSON/CSV结构化数据
2. **模型禁止接触采集过程** — 不调用Playwright、不调API、不拼数据
3. **模型拿到空数据就是空** — 缺失数据只能写「需现场排查」，不能编
4. **每次巡检先跑采集器，再跑分析** — 顺序不能反

### 现有采集器
- `scripts/shanli_collector.py` — 山立13台网关数据采集（L2TP+Playwright+API）
- 输出: `ikuai_reports/data/shanli_raw_{日期}.json`

---

## 十一、数据持续性闭环

> ⚠️ 2026-05-04新增 — 数据不能丢失，历史必须可追溯

### 闭环流程
```
老王手动导出防火墙日志/技术报告
        ↓
  放入 ikuai_reports/data/ 对应日期目录
        ↓
采集器自动运行(shanli_collector.py)
        ↓
  输出 shanli_raw_{日期}.json
        ↓
对比器(shanli_diff.py)对比今天vs上次
        ↓
  输出变化报告 → 通知老王
        ↓
总管基于最新JSON生成分析报告
        ↓
全部原始数据永久保留
```

### 数据目录规范
```
ikuai_reports/data/
├── shanli_raw_{YYYYMMDD}.json     # 采集器输出（每日）
├── firewall_logs_{YYYYMMDD}/      # 云防火墙CSV（按需）
├── sl_debug_{YYYYMMDD}.tar.gz     # debug_syslog技术报告（按需）
└── shanli_diff_{YYYYMMDD}.md      # 变化对比报告（自动）
```

### 强制规则
1. **原始数据永不删除** — 每次采集的 raw JSON 永久保留
2. **文件名必须带日期** — `{类型}_{YYYYMMDD}.{扩展名}`
3. **手动导出数据立即存档** — 老王下载的日志放入对应日期目录
4. **对比器每次采集后自动运行** — 发现变化立即通知

### 现有工具
- `scripts/shanli_collector.py` — 数据采集
- `scripts/shanli_diff.py` — 变化对比

---

## 十二、总管观点总结

这套规则的核心逻辑：

1. **密码加密是底线** — 明文否决，没商量。阿里云审计意见非常明确。
2. **客户档案是第一入口** — 每次接手客户工作，README.md 应该能在 30 秒内告诉你全部技术信息。
3. **截图用完即删** — 调试截图占地方、泄风险、毫无长期价值。
4. **文件命名有日期** — 没有日期的文件名是组织混乱的根源。
5. **根目录是门面** — 只放元文件，其他全部归类。
6. **采集生成分离** — 采集器只输出数据不分析，模型只分析不采集，杜绝假数据。

这套规则不是「建议」，是「必须」。每次违反都是在消耗未来的时间。

---

*本规范由 2026-05-04 多方会议制定*
*参会：总管🐾(OpenClaw+DeepSeekV4) | 阿里云审计专员 | Hermes技术专员 | Claude Code*
*下次评审：2026-06-04*
