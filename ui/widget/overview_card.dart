import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.barValue,
    Key? key,
  }) : super(key: key);
  final Color color;
  final Color iconColor;
  final IconData icon;
  final String title;
  final double barValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.favorite, color: iconColor),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 3,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: color.withOpacity(0.2)),
                  ),
                  Container(
                    width: barValue,
                    height: 8,
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
