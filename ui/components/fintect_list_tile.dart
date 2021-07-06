import 'package:example_tutorial/dribble/Anastasia/Fintech/model/balance.dart';
import 'package:example_tutorial/dribble/Anastasia/Fintech/ui/pages/fintech_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FintechListTile extends StatelessWidget {
  const FintechListTile({Key? key, required this.balance}) : super(key: key);
  final Balance balance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(FintechOverview(balance: balance));
      },
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: balance.color.withOpacity(0.6),
            image: DecorationImage(
                image: AssetImage(balance.image), fit: BoxFit.contain)),
      ),
      title: Text(balance.name),
      subtitle: Text(balance.date),
      trailing: Text(
        balance.balance,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
