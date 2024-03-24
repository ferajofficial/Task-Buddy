import 'package:flutter/material.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:task_buddy/shared/global_loader.dart';
import 'package:velocity_x/velocity_x.dart';

class GlobalAlert extends StatelessWidget {
  final String loadingText;
  const GlobalAlert({
    super.key,
    this.loadingText = 'Please Wait..',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlobalText(
            text: loadingText,
            fontSize: 20,
          ),
          const GlobalLoader(),
        ],
      ).h(100).w(100),
    );
  }
}
