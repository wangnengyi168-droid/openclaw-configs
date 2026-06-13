# SKILL.md — network-topology

## 描述
网络拓扑图生成工具。用于可视化网络结构、生成网络拓扑图进行文档说明、分析网络连接关系。

当前状态：**脚本目录为空，待实现具体功能**

## 触发条件
- 需要可视化网络结构时（待实现）
- 需要生成网络拓扑图进行文档说明时（待实现）
- 需要分析网络连接关系时（待实现）

## 使用方法
### 当前状态
```bash
# 脚本目录位置
ls ~/.openclaw/workspace/skills/network-topology/scripts/
# 当前为空目录
```

### 待实现功能
本技能目录结构已创建，但具体脚本尚未实现。计划功能：
- 拓扑发现脚本：使用 ICMP/SNMP/LLDP 等协议扫描网络设备
- 图形生成脚本：将发现的网络结构渲染为 PNG/SVG/DOT 格式
- 网络分析工具：分析单点故障、带宽瓶颈、路由路径

### 预期用法
```bash
# 拓扑发现（待实现）
python discover.py --range 192.168.1.0/24 --timeout 2

# 图形生成（待实现）
python generate_graph.py --input topology.json --format svg --output network.svg

# 或使用常见工具
# - nmap：网络扫描
# - graphviz：图形渲染
# - netbox：网络文档
```

## 注意事项
- **红线/限制**：网络扫描需获得授权，避免影响生产网络
- 当前为占位符技能，实际功能待开发
- 实现时需注意扫描频率，避免触发 IDS/IPS 告警
- 建议支持多种输出格式（PNG、SVG、Graphviz DOT）

## 最后更新
2026-05-22

## last_verified
2026-05-22
