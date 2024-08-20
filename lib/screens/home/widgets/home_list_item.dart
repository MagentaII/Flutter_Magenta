import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {
  final String text;
  final Image image;
  final GestureTapCallback onTap;

  const HomeListItem({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 點擊事件
      child: Card(
        elevation: 0, // 設定陰影為 0，因為圖片可能已經提供陰影效果
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // 設定圓角
          side: const BorderSide(
            color: Color(0xff054b71), // 邊框顏色
            width: 1.5, // 邊框寬度
          )
        ),
        clipBehavior: Clip.antiAlias, // 確保圖片不會超出圓角邊界
        child: Column(
          children: [
            const SizedBox(height: 20),
            // 背景圖片
            Expanded(
              flex: 2, // 確保圖片佔用更多的空間
              child: image,
            ),
            // 文字區域
            Expanded(
              flex: 1, // 確保文字區域佔用適當的空間
              child: Container(
                alignment: Alignment.center, // 使文字區域的內容居中
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
