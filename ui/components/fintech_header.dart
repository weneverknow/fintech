import 'package:flutter/material.dart';

class FintechHeader extends StatelessWidget {
  const FintechHeader({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap ?? () {},
          child: Icon(
            Icons.chevron_left_rounded,
            size: 40,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/unnamed.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(18)),
        )
      ],
    );
  }
}
