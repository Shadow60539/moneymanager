import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanager/animations/popup_card/custom_rect_tween.dart';
import 'package:moneymanager/animations/popup_card/hero_dialoge_route.dart';
import 'package:moneymanager/animations/popup_card/popup_card_ui.dart';
import 'package:moneymanager/constants/constants.dart';
import 'package:moneymanager/models/category_Model.dart';
import 'package:moneymanager/views/payment_screen/payment_screen_widgets.dart';

import '../../models/category_Model.dart';

class PaymentScreen extends StatelessWidget {
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.bgcolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Stack(
          children: [
            Column(
              children: [
                balancetab(context, 981),
                Expanded(child: _buildListView(context)),
              ],
            ),
            Align(alignment: Alignment.bottomRight, child: Addbutton())
          ],
        ),
      ),
    );
  }
}

Widget _buildListView(context) {
  final categorydata = Hive.box("category");

  return WatchBoxBuilder(
    box: categorydata,
    builder: (context, box) {
      return ListView.builder(
        itemCount: categorydata.length,
        itemBuilder: (context, index) {
          final CategoryModel categorymodel = categorydata.getAt(index);
          return GestureDetector(
            onLongPress: () => deleteDialogue(context, categorydata, index),
            child: categoryBox(
                context, categorymodel.categoryName, categorymodel.totalAmount),
          );
        },
      );
    },
  );
}

Widget categoryBox(context, String categoryName, int amount) {
  ConstantColors constantColors = ConstantColors();
  return Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: Row(
      children: [
        Container(
          child: Stack(
            children: [
              Positioned(
                top: 25,
                left: 25,
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: constantColors.textcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  top: 28,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        "\$ $amount",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ))
            ],
          ),
          color: constantColors.blueaccentcolor,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.77,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
              return Popupcard(
                categoryname: categoryName,
              );
            }));
          },
          child: Hero(
            tag: categoryName,
            createRectTween: (begin, end) {
              return CustomRectTween(begin: begin, end: end);
            },
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.2,
                color: constantColors.boxcolor,
                child: Center(child: Icon(Icons.add)),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
