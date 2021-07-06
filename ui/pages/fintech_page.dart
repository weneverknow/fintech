import 'dart:math';

import 'package:example_tutorial/dribble/Anastasia/Fintech/model/balance.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/components/card_flip_builder.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/components/fintech_header.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/widget/back_card.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/widget/title_section.dart';
import 'package:flutter/material.dart';

import '../components/fintech_background.dart';
import '../components/fintect_list_tile.dart';
import '../widget/front_card.dart';
import 'package:get/get.dart';

class FintechPage extends StatelessWidget {
  //FintechPage({Key? key}) : super(key: key);

  final clipKey = GlobalKey<CardFlipBuilderState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FintechHeader(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TitleSection(
                  title: 'My Card',
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CardFlipBuilder(
                      key: clipKey,
                      frontBuilder: (_) => FrontCard(onFlip: () {
                            clipKey.currentState?.flip();
                          }),
                      backBuilder: (_) => BackCard(onFlip: () {
                            clipKey.currentState?.flip();
                          })),
                ),
              ],
            ),
            buildDraggableWidget(context)
          ],
        ),
      ),
    );
  }

  Widget buildDraggableWidget(BuildContext context) => DraggableScrollableSheet(
      initialChildSize: 0.5,
      //maxChildSize: 1,
      maxChildSize: 0.5,
      minChildSize: 0.1,
      builder: (context, controller) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22))),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 30,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: balanceList.length,
                      itemBuilder: (context, index) => FintechListTile(
                            balance: balanceList[index],
                          )),
                ),
              ],
            ),
          ));
}
