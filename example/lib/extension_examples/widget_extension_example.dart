import 'package:flutter/material.dart';
import 'package:super_extensions/super_extensions.dart';

class WidgetExtensionExample extends StatelessWidget {
  const WidgetExtensionExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
              children: [
            Container(height: 100, width: 50, color: Colors.red),
            Container(height: 100, width: 50, color: Colors.blue),
            Container(height: 100, width: 50, color: Colors.green),
            Container(height: 100, width: 50, color: Colors.yellow),
          ].paddingDirectional(
            top: 20,
            left: 40,
          )),
          Row(
            children: [
              Container(height: 100, width: 50, color: Colors.red),
              Container(height: 100, width: 50, color: Colors.blue),
              Container(height: 100, width: 50, color: Colors.green),
              Container(height: 100, width: 50, color: Colors.yellow),
            ].paddingAll(13).paddingSymmetric(horizontal: 5),
          ),
        ],
      ),
    );
  }
}
