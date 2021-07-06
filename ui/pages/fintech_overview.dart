import 'package:example_tutorial/dribble/Anastasia/Fintech/model/balance.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/components/category_account.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/components/fintech_background.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/components/fintech_header.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/components/fintech_line_chart.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/widget/overview_card.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/widget/title_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class FintechOverview extends StatelessWidget {
  FintechOverview({Key? key, required this.balance}) : super(key: key);
  final Balance balance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FintechBackground(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FintechHeader(
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TitleSection(title: 'Overview'),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Total Balance',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  balance.balance,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CategoryAccount(),
              Flexible(flex: 2, child: FintechLineChart()),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 30, bottom: 30, left: 30),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffdeb1e5).withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              bottomLeft: Radius.circular(18))),
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          OverviewCard(
                            color: Colors.blue[400]!,
                            iconColor: Colors.pink[400]!,
                            icon: Icons.favorite,
                            title: 'Health',
                            barValue: 40,
                          ),
                          OverviewCard(
                            color: Colors.deepPurple[400]!,
                            iconColor: Colors.yellow[400]!,
                            icon: Icons.api_rounded,
                            title: 'Utilities',
                            barValue: 10,
                          ),
                          OverviewCard(
                            color: Colors.red[200]!,
                            iconColor: Colors.red,
                            icon: Icons.add_shopping_cart,
                            title: 'Entertainment',
                            barValue: 20,
                          ),
                          OverviewCard(
                            color: Colors.green[300]!,
                            iconColor: Colors.blue[600]!,
                            icon: Icons.cake_rounded,
                            title: 'F & B',
                            barValue: 50,
                          )
                        ],
                      )),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
