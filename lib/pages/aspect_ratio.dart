import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue.withOpacity(0.7),
        alignment: Alignment.center,
        width: double.infinity,
        height: 100.0,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.green[300],
          ),
        ),
      ),
    );
  }
}
