import 'package:flutter/material.dart';
import '../../shared/constants.dart';

class Bg extends StatelessWidget {
  const Bg({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/bg.jpg",
          fit: BoxFit.fill,
        ),
        Container(
          color: Colors.black.withOpacity(.72),
        ),
        SafeArea(
          child: child,
        ),
      ],
    );
  }
}
