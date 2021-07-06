import 'package:flutter/material.dart';

class FintechBackground extends StatelessWidget {
  const FintechBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rec) {
        return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Colors.black,
              Color(0xFFad93b9).withOpacity(0.3),
              //Colors.black
            ]).createShader(Rect.fromLTRB(10, 0, 200, 0));
      },
      blendMode: BlendMode.dstIn,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
              Colors.white,
              Colors.white,
              Color(0xFFad93b9).withOpacity(0.2)
            ])),
      ),
    );
  }
}
