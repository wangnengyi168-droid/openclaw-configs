# SKILL.md — nas-management

## 描述
NAS 远程管理技能。提供 NAS API 封装和健康检查脚本。

当前状态：**脚本目录为空，待实现具体功能**

## 触发条件
- 需要远程管理 NAS 设备时（待实现）
- 需要检查 NAS 健康状态时（待实现）
- 需要自动化 NAS 维护任务时（待实现）

## 使用方法
### 当前状态
```bash
# 脚本目录位置
ls ~/.openclaw/workspace/skills/nas-management/scripts/
# 当前为空目录
```

### 待实现功能
本技能目录结构已创建，但具体脚本尚未实现。计划功能：
- 健康检查脚本：检查 NAS 磁盘状态、温度、存储空间、服务状态
- API 封装脚本：封装 NAS 厂商 API（如 Synology、QNAP），支持文件管理、用户管理、共享设置
- 自动化任务：定时备份、日志清理、快照管理

### 预期用法
```bash
# 健康检查（待实现）
python health_check.py --host 192.168.1.100 --user admin

# API 操作（待实现）
python api_wrapper.py --action list_shares --host 192.168.1.100
```

## 注意事项
- **红线/限制**：保护 NAS 认证凭据安全，避免硬编码密码
- 当前为占位符技能，实际功能待开发
- 实现时需支持主流 NAS 厂商 API（Synology DSM、QNAP QTS 等）
- 建议使用环境变量或配置文件存储凭据

## 最后更新
2026-05-22

## last_verified
2026-05-22
