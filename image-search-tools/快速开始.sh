#!/bin/bash

echo "🚀 0405 - 快速开始"
echo "================="
echo "目标: 找到8张相似项链图片"
echo "时间: 5分钟"
echo "方法: Yandex图片搜索 (手动)"
echo ""

# 打开Yandex图片搜索
echo "🌐 打开Yandex图片搜索..."
xdg-open 'https://yandex.com/images/' &

# 打开源图片参考
echo "🖼️ 打开源图片参考..."
xdg-open "$HOME/桌面/测试结果/源图_项链.png" &

# 打开操作指南
echo "📖 打开操作指南..."
xdg-open "操作指南.txt" &

# 打开HTML查看器
echo "🔍 打开图片查看器..."
xdg-open "查看图片.html" &

# 打开当前文件夹
echo "📁 打开当前文件夹..."
xdg-open . &

echo ""
echo "✅ 所有工具已打开！"
echo ""
echo "📋 接下来操作:"
echo "1. 在Yandex网站上传源图片"
echo "2. 选择8张最相似的项链图片"
echo "3. 保存到本文件夹 (~/桌面/0405/)"
echo "4. 按 necklace_1.jpg ~ necklace_8.jpg 命名"
echo ""
echo "🛠️ 验证命令:"
echo "./验证结果.sh"
echo ""
echo "⏰ 预计完成时间: 5分钟"
echo "🐾 技术支持: 总管"
echo ""
echo "🚀 立即开始操作！"