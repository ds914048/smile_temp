import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String msg;

  MyErrorWidget(this.msg);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            '$msg',
          ),
        ));
  }
}
