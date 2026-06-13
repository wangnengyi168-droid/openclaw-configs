# SKILL.md — longmen-inn

## 描述
龙门客栈多Agent协作框架，含 INN_RULES.md, ROSTER.md, LEDGER.md。

## 触发条件
- 需要多Agent协同工作时
- 需要任务分配和状态跟踪时
- 需要遵循标准化协作流程时

## 使用方法
### 任务管理
- 命令路径：`~/.openclaw/workspace/skills/longmen-inn/LEDGER.md`
- 参数说明：查看当前任务状态、优先级、负责人等信息
- 示例：`cat LEDGER.md | grep "⏳ 待开始"`

### 角色管理
- 命令路径：`~/.openclaw/workspace/skills/longmen-inn/ROSTER.md`
- 参数说明：查看各Agent角色职责、协作关系
- 示例：`cat ROSTER.md | head -30`

### 规则遵循
- 命令路径：`~/.openclaw/workspace/skills/longmen-inn/INN_RULES.md`
- 参数说明：查看客栈运营规则和工作流程
- 示例：`cat INN_RULES.md`

## 注意事项
- 红线/限制：必须严格遵守INN_RULES.md中的规定
- 常见问题：待补充