---
name: synology-nas
description: "群晖NAS运维——DSM API调用、SSH安全加固、备份策略、套件管理、权限批量操作。适用于：(1) 远程文件管理 (2) 备份任务配置 (3) SSH安全加固 (4) 套件管理 (5) 用户权限批量操作 (6) 监控告警。"
---

# 群晖NAS运维 Skill

## 适用场景
1. 远程文件管理 (File Station API)
2. 备份任务配置 (Hyper Backup / Snapshot Replication / rsync)
3. SSH安全加固
4. 套件远程管理
5. 用户/组/共享文件夹权限批量操作
6. 监控告警配置

## 技术背景

### DSM版本
- 当前主流：DSM 7.2-7.3
- DSM 7.3 新特性：数据分层存储 (Tiering)、主动式安全补丁、第三方硬盘支持

### 官方API文档
| API | 文档链接 |
|-----|---------|
| DSM Login API | [PDF](https://global.download.synology.com/download/Document/Software/DeveloperGuide/Os/DSM/All/enu/DSM_Login_Web_API_Guide_enu.pdf) |
| File Station API | [PDF](https://global.download.synology.com/download/Document/Software/DeveloperGuide/Package/FileStation/All/enu/Synology_File_Station_API_Guide.pdf) |
| 在线文档 | [Knowledge Center](https://kb.synology.com/en-global/DG/DSM_Login_Web_API_Guide/2) |

### API 接口分类
| 分类 | 说明 |
|------|------|
| 文件管理 | File Station API (上传/下载/目录浏览/权限设置) |
| 套件管理 | Package Center API (安装/卸载/状态查询) |
| 用户权限 | User/Group API (创建/组管理/权限分配) |
| 备份管理 | Hyper Backup API (任务管理/恢复) |
| 系统监控 | System Info API (CPU/内存/磁盘) |

## SSH 安全加固

### 基础配置
1. 控制面板 → 终端机与SNMP → 启用SSH服务
2. 配置SSH密钥认证（禁用密码登录）
3. 防火墙限制：仅允许受信任IP访问SSH端口

### 加固步骤
```bash
# SSH登录
ssh admin@NAS_IP

# 编辑配置
sudo vi /etc/ssh/sshd_config

# 关键配置
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
ClientAliveInterval 300
ClientAliveCountMax 2

# 重启SSH
sudo systemctl restart sshd
```

### 安全工具
- **Security Advisor**: 预装应用，可扫描配置问题
- **Log Center**: 系统日志集中管理

## 备份方案

### 方案对比
| 方案 | 适用场景 | 优势 | 限制 |
|------|---------|------|------|
| Hyper Backup | 跨平台备份 | 增量备份、版本管理、加密 | 需要目标服务器 |
| Snapshot Replication | Synology-to-Synology | 快照技术、低开销、快速恢复 | 必须都是Synology |
| rsync | 标准协议备份 | 跨平台兼容性好 | 无版本管理 |

### 备份策略建议
1. **本地备份**: Snapshot Replication (如果有多台Synology)
2. **异地备份**: Hyper Backup 到远程服务器/NAS
3. **云备份**: Hyper Backup 到公有云 (S3/Backblaze)
4. **3-2-1原则**: 3份数据、2种介质、1份异地

## 套件管理

### 图形界面
- Package Center: 一键安装/更新/卸载

### 命令行
```bash
# SSH登录
ssh admin@NAS_IP

# 切换root
sudo -i

# 查看已安装包
ls /volume1/@appstore/

# 卸载包
rm -rf /volume1/@appstore/<package_name>
# 清理数据库
```

### Task Scheduler自动化
- 创建定时任务执行套件管理脚本

## 权限管理

### 组策略（推荐）
1. 先创建组
2. 分配用户到组
3. 设置共享文件夹权限（组级别）
4. 用户自动继承组权限

### CLI批量操作
```bash
# 用户管理
synouser --add <用户名> <密码> <描述> 0 "" 0
synouser --del <用户名>

# 组管理
synogroup --add <组名> <用户1> <用户2>
synogroup --del <组名>

# 共享文件夹权限
synoacltool -add <路径> <权限>
```

## 监控告警

### 内置工具
| 工具 | 功能 |
|------|------|
| Resource Monitor | CPU/内存/磁盘/网络实时监控 |
| Log Center | 系统日志集中管理 |
| Storage Manager | 硬盘SMART数据监控 |
| Notification Center | 邮件/SMS/推送通知 |

### 告警配置
1. 控制面板 → 通知 → 配置邮件/推送通知
2. DS Finder 移动应用集成，实时推送
3. SMART 监控自动检测硬盘健康

## 参考资料
- [DSM Login API Guide](https://global.download.synology.com/download/Document/Software/DeveloperGuide/Os/DSM/All/enu/DSM_Login_Web_API_Guide_enu.pdf)
- [File Station API](https://global.download.synology.com/download/Document/Software/DeveloperGuide/Package/FileStation/All/enu/Synology_File_Station_API_Guide.pdf)
- [SSH Security Tips](https://kb.synology.com/en-us/DSM/tutorial/How_to_add_extra_security_to_your_Synology_NAS)
- [10 Security Tips Blog](https://blog.synology.com/10-security-tips-to-keep-your-data-safe)

---
*创建于 2026-05-11，基于情报专员调研报告*
