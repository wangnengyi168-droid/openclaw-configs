---
name: yun-ikuai-firewall
description: "爱快云防火墙远程运维——通过浏览器自动化+开放API远程管理防火墙策略。适用于：(1) 远程读取/修改云防火墙策略 (2) 登录yun.ikuai8.com/firewall.ikuai8.com (3) 白名单/IPS/URL过滤配置 (4) 安全审计+策略优化。"
---

# 爱快云防火墙运维 Skill

> 最后更新：2026-06-05 | 平台已升级至ICC

## 适用场景
1. 远程读取/修改云防火墙策略
2. 登录 yun.ikuai8.com / firewall.ikuai8.com
3. 白名单/IPS/URL过滤/QoS配置
4. 安全审计+策略优化

## 技术背景

### 云平台地址
- **icc.ikuai8.com**: 爱快云中心(iKuai Cloud Center)，统一管理平台，包含项目管理、设备管理、应用、服务等模块
- **yun.ikuai8.com**: 旧平台，已跳转至ICC升级页面
- **firewall.ikuai8.com**: 云防火墙专用管理平台，主要用于管理SGW-R1200等专业防火墙设备

### 认证体系
- **OAuth 2.0 + RSA签名**: 需要合作商资质才能获取完整API
- **JWT Cookie 跨域问题**: yun.ikuai8.com 和 firewall.ikuai8.com 使用不同Cookie域

### Open API 3.0
- 文档：https://open.ikuai8.com/doc/3.0/
- 主要API：AccessToken、AccountList、OnlineUserList、WhiteList
- 要求：HTTPS + RSA加密，需要合作商资质

## 登录流程

### Playwright 浏览器自动化
1. 启动浏览器上下文
2. 访问 yun.ikuai8.com 登录页面
3. 输入用户名密码，处理验证码
4. 获取认证Cookie
5. 切换到 firewall.ikuai8.com 并注入Cookie
6. 验证登录状态

### Cookie 跨域处理
```python
# Playwright 手动设置 Cookie
await context.add_cookies([
    {
        'name': 'jwt_token',
        'value': 'xxx',
        'domain': '.ikuai8.com',  # 设置父域
        'path': '/'
    }
])
```

## 防火墙规则管理

### 通过Open API（合作商）
| API | 功能 |
|-----|------|
| WhiteListRequest | 管理白名单 |
| OnlineUserListRequest | 获取在线用户 |
| AccountListRequest | 获取上网账号 |

### 通过浏览器自动化（非合作商）
1. 登录 firewall.ikuai8.com
2. 导航到策略管理页面
3. 读取/修改规则（DOM操作）
4. 截图留存

### SGW-R1200 防火墙能力
- 防火墙规则管理
- 入侵防护系统 (IPS)
- 防病毒功能
- URL过滤
- 上网行为管理
- QoS流量管理
- IPsec/SSL VPN

## 安全注意事项
1. 抓包显示存在 report.ikuai8.com 等上报域名，注意数据隐私
2. 认证Cookie有效期有限，需要及时刷新
3. API调用需RSA加密，防止中间人攻击

## 参考资料
- [爱快云绑定文档](https://www.ikuai8.com/support/ymgn/lyym/xtsz/c542c.html)
- [iKuai Open API 3.0](https://open.ikuai8.com/doc/3.0/)
- [爱快云防火墙产品](https://www.ikuai8.com/product/hardware/firewall.html)
- [抓包分析](https://wusiyu.me/2022-ikuai-non-cloud-background-activities/)

---
*创建于 2026-05-11，基于情报专员调研报告*
