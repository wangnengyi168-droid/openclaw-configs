# SKILL.md — dingtalk-skills

## 描述
钉钉 Agent 技能库。让 AI Agent 直接操作钉钉——无需手写 API 调用，无需手动管理 Token。基于 Anthropic skills 规范构建，**仅依赖 `curl`**，无需安装 Python、SDK 或任何第三方库。

已上线技能：
- **dingtalk-document**：钉钉知识库/文档管理（创建、查询、目录浏览、内容读写、成员管理）
- **dingtalk-ai-table**：钉钉 AI 表格（工作表管理、字段管理、记录增删改查）
- **dingtalk-message**：钉钉消息发送（Webhook 机器人、单聊/群聊、工作通知）
- **dingtalk-todo**：钉钉待办管理（创建、查询、更新、完成、删除）
- **dingtalk-contact**：钉钉通讯录（搜索用户/部门、用户详情、部门树、成员列表）
- **dingtalk-ai-web-search**：网页搜索（关键词搜索、时间过滤、JSON 输出）
- **dingtalk-calendar**：钉钉日程（CRUD、闲忙、视频会议、会议室、签到签退）

计划中技能：dingtalk-approval（审批）、dingtalk-attendance（考勤）、dingtalk-meeting（会议）

## 触发条件
- 需要向钉钉发送消息或通知时
- 需要管理钉钉知识库、文档、AI 表格时
- 需要创建/查询钉钉待办、日程时
- 需要搜索钉钉通讯录或进行网页搜索时
- 需要集成钉钉协作功能到自动化流程时

## 使用方法
### 安装技能
```bash
# 从 ClawHub 安装单个技能
clawhub install breath57/dingtalk-document

# 或从 skills.sh 安装
npx skills add breath57/dingtalk-skills@dingtalk-document

# 一键安装全部
npx skills add breath57/dingtalk-skills \
  --skill dingtalk-document dingtalk-ai-table dingtalk-message dingtalk-todo dingtalk-contact dingtalk-ai-web-search dingtalk-calendar
```

### 配置
首次运行时 Agent 会询问并配置：
- `appKey`：钉钉应用 Key
- `appSecret`：钉钉应用 Secret
- `operatorId`：操作人钉钉 userId

配置保存在 `~/.dingtalk-skills/config`

### 脚本目录
```bash
# 脚本位置
ls ~/.openclaw/workspace/skills/dingtalk-skills/scripts/
# 包含：
# - collect-traffic.sh：流量收集脚本
# - merge_traffic.py：流量合并脚本
# - common_scripts_load.sh：通用脚本加载器
# - common/dt_helper.sh：钉钉助手工具
```

### 使用示例
```
"查看我的钉钉知识库列表"
"往 AI 表格的'需求池'工作表添加一条记录：标题=登录优化，优先级=高"
"发群消息说明天上午十点开周会，Markdown 格式"
"帮我建一个待办：下周五前完成竞品分析报告"
```

## 注意事项
- **红线/限制**：遵守钉钉 API 调用频率限制，保护 Webhook 密钥和 appSecret 安全
- 配置信息保存在 `~/.dingtalk-skills/config`，注意权限保护
- 需要钉钉企业内部应用和相应 API 权限
- 仅依赖 curl，无需额外运行时

## 最后更新
2026-05-22

## last_verified
2026-05-22
