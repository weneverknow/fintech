import 'package:flutter/material.dart';

class Balance {
  final String name;

  final String balance;
  final String image;
  final Color color;
  final String date;

  Balance(
      {required this.name,
      required this.balance,
      required this.image,
      required this.date,
      required this.color});
}

List<Balance> balanceList = [
  Balance(
      name: 'Olivia Jones',
      image: 'assets/images/girl_1.png',
      balance: '-\$890.00',
      date: 'Sep 14, 4:10 AM',
      color: Color(0xff6743b1)),
  Balance(
      name: 'Liam Smith',
      image: 'assets/images/boy_1.png',
      balance: '+\$2,678',
      date: 'Sep 8, 8:10 AM',
      color: Color(0xFFC55693)),
  Balance(
      name: 'Michael Korner',
      image: 'assets/images/girl_2.png',
      balance: '+\$75.65',
      date: 'Sep 1, 6:45 AM',
      color: Color(0xFFC969D6)),
  Balance(
      name: 'Nick Tore',
      image: 'assets/images/man_1.png',
      balance: '+\$92.00',
      date: 'Sep 14, 4:10 AM',
      color: Color(0xFF55D6C5)),
  Balance(
      name: 'James Brown',
      image: 'assets/images/boy_2.png',
      balance: '-\$100.00',
      date: 'Sep 19, 4:10 AM',
      color: Color(0xFFDB5762))
];
