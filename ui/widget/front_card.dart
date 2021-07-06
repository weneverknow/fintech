import 'dart:math';

import 'package:flutter/material.dart';

class FrontCard extends StatelessWidget {
  const FrontCard({Key? key, required this.onFlip}) : super(key: key);
  final VoidCallback onFlip;

  //final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onFlip,
      child: Container(
        width: size.width * 0.9,
        height: 200,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color(0xffdeb1e5), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 55,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                ),
                Transform.rotate(
                    angle: pi / 4,
                    child: Icon(Icons.wifi, size: 32, color: Colors.white))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3487 8982 7887 9098',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
                Container(
                  height: 25,
                  width: 40,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: Offset(-1, -2), color: Colors.white54),
                            BoxShadow(
                                offset: Offset(1, 1), color: Colors.black38)
                          ], color: Colors.red[400], shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: Offset(-1, -2), color: Colors.white54),
                            BoxShadow(
                                offset: Offset(1, 1), color: Colors.black38)
                          ], color: Colors.yellow[400], shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
