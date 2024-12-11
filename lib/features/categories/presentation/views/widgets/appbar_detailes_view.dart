import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarCategoriesBottomSheetView extends StatelessWidget {
  const AppBarCategoriesBottomSheetView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (scroll) {
        if (scroll.delta.dy > 0) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Navigator.pop(context);
        }
      },
      child: Container(
        height: 5,
        width: 80,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
