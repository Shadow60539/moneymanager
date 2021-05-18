import 'package:flutter/material.dart';
import 'package:moneymanager/constants/constants.dart';
import 'package:moneymanager/views/payment_screen/payment_screen.dart';
import 'package:moneymanager/views/statistics_screen/statistics_screen.dart';
import 'package:moneymanager/views/transition_screen/transition_screen.dart';
import 'package:moneymanager/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void ontap(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  void onpagechanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  int _currentIndex = 0;

  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Money Manager",
          style: TextStyle(color: constantColors.textcolor),
        ),
        backgroundColor: ConstantColors().blueaccentcolor,
      ),
      backgroundColor: ConstantColors().bgcolor,
      body: IndexedStack(
        children: [PaymentScreen(), TransitionScreen(), StatisticsScreen()],
        index: _currentIndex,
      ),
      bottomNavigationBar: bottomAppBar(_currentIndex, ontap),
    );
  }
}
