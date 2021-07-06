import 'package:flutter/material.dart';

class CategoryAccount extends StatefulWidget {
  const CategoryAccount({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryAccountState createState() => _CategoryAccountState();
}

class _CategoryAccountState extends State<CategoryAccount>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation animation;

  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animController, curve: Curves.bounceInOut));
    // _animController
    //   ..addStatusListener((status) {
    //     if (status == AnimationStatus.dismissed) {
    //       _animController.forward();
    //     } else if (status == AnimationStatus.completed) {
    //       _animController.reverse();
    //     }
    //   });
    //_animController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset:
                    Offset((((size.width - 60) / 2) + 15) * animation.value, 0),
                child: Container(
                  width: ((size.width - 60) / 2) - 15,
                  //height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  //width: size.width-80/2,
                  //height: 40,
                  //alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _animController.reverse();
                      },
                      child: Text(
                        'Incomes',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Flexible(
                child: Container(
                  //height: 40,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _animController.forward();
                      },
                      child: Text(
                        'Expenses',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
