# SKILL.md — markitdown

## 描述
Microsoft MarkItDown —— 轻量级 Python 工具，将各种文件格式转换为 Markdown，专为 LLM 和文本分析管道设计。支持 PDF、PowerPoint、Word、Excel、图片、音频、HTML、CSV、JSON、XML、ZIP、YouTube 链接、EPub 等格式。

核心特点：
- 保留文档结构（标题、列表、表格、链接等）
- 专为 LLM 消费优化，非高保真人眼阅读
- Markdown 格式对 LLM 友好且 token 高效
- 支持 EXIF 元数据提取和 OCR/语音转录

## 触发条件
- 需要将 PDF/DOCX/PPTX/XLSX 转换为 Markdown 时
- 需要从图片中提取文字（OCR）时
- 需要从音频中转录语音时
- 需要批量转换文档供 LLM 分析时
- 需要处理 YouTube 视频字幕或 EPub 电子书时

## 使用方法
### 安装
```bash
# 创建虚拟环境
python -m venv .venv
source .venv/bin/activate

# 安装 MarkItDown
pip install 'markitdown[all]'

# 或从源码安装
cd ~/.openclaw/workspace/skills/markitdown
pip install -e 'packages/markitdown[all]'
```

### 命令行使用
```bash
# 基本转换
markitdown path-to-file.pdf > document.md

# 指定输出文件
markitdown -o output.md input.docx

# 批量转换
for f in *.pdf; do markitdown "$f" > "${f%.pdf}.md"; done
```

### 目录结构
```
~/.openclaw/workspace/skills/markitdown/
├── packages/
│   ├── markitdown/           # 核心转换包
│   ├── markitdown-mcp/       # MCP 集成
│   ├── markitdown-ocr/       # OCR 扩展
│   └── markitdown-sample-plugin/  # 示例插件
├── Dockerfile                 # Docker 构建
└── README.md                  # 完整文档
```

### Python API
```python
from markitdown import MarkItDown

md = MarkItDown()
result = md.convert("document.pdf")
print(result.text_content)
```

## 注意事项
- **红线/限制**：处理敏感文档时注意数据安全，MarkItDown 以进程权限执行 I/O
- 调用最窄的 `convert_*` 函数（如 `convert_stream()`、`convert_local()`）以降低风险
- 复杂格式（如复杂表格、公式）可能无法完美转换
- OCR 和语音转录需要额外依赖（tesseract、whisper 等）

## 最后更新
2026-05-22

## last_verified
2026-05-22
