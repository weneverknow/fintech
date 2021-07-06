import 'package:flutter/material.dart';

class BackCard extends StatelessWidget {
  const BackCard({Key? key, required this.onFlip}) : super(key: key);
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onFlip,
      child: Container(
          width: size.width * 0.9,
          height: 200,
          //padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color(0xffdeb1e5),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 40,
                child: Container(
                    width: size.width * 0.9,
                    height: 45,
                    color: Colors.grey[300]),
              ),
              Positioned(
                bottom: 15,
                right: 16,
                child: Text('07/22'),
              ),
              Positioned(
                bottom: 50,
                child: Text(
                  '3487 8982 7887 9098',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              )
            ],
          )),
    );
  }
}
