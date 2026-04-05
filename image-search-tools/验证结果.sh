#!/bin/bash

echo "🔍 验证0405文件夹图片"
echo "====================="
echo "文件夹: ~/桌面/0405/"
echo "目标: 8张相似项链图片"
echo ""

# 检查文件夹
FOLDER="$HOME/桌面/0405"
if [ ! -d "$FOLDER" ]; then
    echo "❌ 文件夹不存在: $FOLDER"
    exit 1
fi

cd "$FOLDER"

# 检查图片数量
echo "📊 检查图片数量..."
JPG_COUNT=$(ls -1 *.jpg 2>/dev/null | wc -l)
JPEG_COUNT=$(ls -1 *.jpeg 2>/dev/null | wc -l)
PNG_COUNT=$(ls -1 *.png 2>/dev/null | wc -l)
TOTAL=$((JPG_COUNT + JPEG_COUNT + PNG_COUNT))

echo "找到图片:"
echo "  JPG文件: $JPG_COUNT 张"
echo "  JPEG文件: $JPEG_COUNT 张"
echo "  PNG文件: $PNG_COUNT 张"
echo "  总计: $TOTAL 张"
echo ""

# 检查命名规范
echo "📝 检查命名规范..."
EXPECTED_FILES=("necklace_1.jpg" "necklace_2.jpg" "necklace_3.jpg" "necklace_4.jpg" 
                "necklace_5.jpg" "necklace_6.jpg" "necklace_7.jpg" "necklace_8.jpg")

CORRECT_COUNT=0
for file in "${EXPECTED_FILES[@]}"; do
    if [ -f "$file" ]; then
        size=$(stat -c%s "$file" 2>/dev/null || echo "0")
        echo "✅ $file 存在 ($size 字节)"
        CORRECT_COUNT=$((CORRECT_COUNT + 1))
    else
        echo "❌ $file 不存在"
    fi
done

echo ""

# 显示所有图片文件
echo "🖼️ 所有图片文件:"
ls -la *.jpg *.jpeg *.png 2>/dev/null || echo "未找到图片文件"

echo ""

# 图片大小统计
echo "📏 图片大小统计:"
for img in *.jpg *.jpeg *.png 2>/dev/null; do
    if [ -f "$img" ]; then
        size=$(stat -c%s "$img")
        human_size=$(numfmt --to=iec --suffix=B $size 2>/dev/null || echo "${size}B")
        echo "  $img: $human_size"
    fi
done

echo ""

# 创建摘要文件
SUMMARY_FILE="图片摘要.txt"
cat > "$SUMMARY_FILE" << EOF
# 📋 0405图片摘要
生成时间: $(date)
文件夹: $FOLDER

## 📊 统计信息
总图片数: $TOTAL 张
规范命名: $CORRECT_COUNT/8 张

## 🖼️ 图片列表
EOF

for img in *.jpg *.jpeg *.png 2>/dev/null; do
    if [ -f "$img" ]; then
        size=$(stat -c%s "$img")
        human_size=$(numfmt --to=iec --suffix=B $size 2>/dev/null || echo "${size}B")
        echo "- $img ($human_size)" >> "$SUMMARY_FILE"
    fi
done

cat >> "$SUMMARY_FILE" << EOF

## 🎯 完成状态
EOF

if [ $CORRECT_COUNT -eq 8 ]; then
    echo "✅ 完美完成: 8张图片全部正确命名" >> "$SUMMARY_FILE"
    COMPLETION_STATUS="✅ 完美完成"
elif [ $CORRECT_COUNT -ge 5 ]; then
    echo "⚠️ 基本完成: $CORRECT_COUNT/8 张图片正确命名" >> "$SUMMARY_FILE"
    COMPLETION_STATUS="⚠️ 基本完成"
else
    echo "❌ 未完成: 只有 $CORRECT_COUNT/8 张图片" >> "$SUMMARY_FILE"
    COMPLETION_STATUS="❌ 未完成"
fi

echo "摘要文件: $SUMMARY_FILE" >> "$SUMMARY_FILE"

echo "📄 摘要文件已创建: $SUMMARY_FILE"

echo ""
echo "="*60
echo "📊 验证结果总结"
echo "="*60
echo "图片总数: $TOTAL 张"
echo "规范命名: $CORRECT_COUNT/8 张"
echo "完成状态: $COMPLETION_STATUS"
echo "文件夹: $FOLDER"
echo "查看器: 查看图片.html"
echo "摘要文件: $SUMMARY_FILE"
echo ""

if [ $CORRECT_COUNT -eq 8 ]; then
    echo "🎉 完美！所有8张图片都已正确保存！"
    echo ""
    echo "🚀 下一步:"
    echo "1. 查看图片: xdg-open 查看图片.html"
    echo "2. 验证相似度质量"
    echo "3. 准备客户演示"
    echo "4. 开始商业化部署"
elif [ $CORRECT_COUNT -ge 5 ]; then
    echo "⚠️ 基本完成，但缺少 $((8 - CORRECT_COUNT)) 张图片"
    echo ""
    echo "📋 缺少的文件:"
    for file in "${EXPECTED_FILES[@]}"; do
        [ ! -f "$file" ] && echo "  - $file"
    done
    echo ""
    echo "🔄 请补充缺少的图片"
else
    echo "❌ 未完成，请按照操作指南重新操作"
    echo ""
    echo "📖 操作指南:"
    echo "1. 打开 https://yandex.com/images/"
    echo "2. 上传 源图_项链.png"
    echo "3. 保存8张最相似的项链图片"
    echo "4. 按 necklace_1.jpg ~ necklace_8.jpg 命名"
    echo "5. 保存到本文件夹"
fi

echo ""
echo "💡 快速命令:"
echo "查看图片: xdg-open 查看图片.html"
echo "打开文件夹: xdg-open ."
echo "重新验证: ./验证结果.sh"
echo "="*60