import 'package:flutter/material.dart';
import 'package:simlk_app/src/res/resources.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Resources.color.indigo700,
      ),
    );
  }
}
