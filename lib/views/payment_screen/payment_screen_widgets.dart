import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanager/animations/popup_card/custom_rect_tween.dart';
import 'package:moneymanager/animations/popup_card/hero_dialoge_route.dart';
import 'package:moneymanager/animations/popup_card/popup_card_ui.dart';
import 'package:moneymanager/constants/constants.dart';
import 'package:moneymanager/models/category_Model.dart';

class Addbutton extends StatelessWidget {
  /// {@macro add_todo_button}
  const Addbutton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return AddCategoryPopupCard();
          }));
        },
        child: Hero(
          tag: "addcatogerytag",
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: ConstantColors().blueaccentcolor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}

Widget balancetab(context, balanceAmount) {
  return Container(
    child: Stack(
      children: [
        Positioned(
          top: 25,
          left: 25,
          child: Text(
            "Balance",
            style: TextStyle(
                color: constantColors.textcolor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 25,
          right: 20,
          child: Container(
            width: 100,
            height: 30,
            child: Center(
              child: Text(
                "$balanceAmount",
                style: TextStyle(color: constantColors.bgcolor, fontSize: 20),
              ),
            ),
            color: constantColors.textcolor,
          ),
        )
      ],
    ),
    color: constantColors.blueaccentcolor,
    height: MediaQuery.of(context).size.height * 0.1,
    width: double.infinity,
  );
}

deleteDialogue(BuildContext context, Box categorydata, int index) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: constantColors.boxcolor,
          title: Text(
            "Delete  ? ",
            style: TextStyle(
                color: constantColors.textcolor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "No",
                  style: TextStyle(
                      color: constantColors.textcolor,
                      decoration: TextDecoration.underline,
                      decorationColor: constantColors.bgcolor),
                )),
            MaterialButton(
                color: constantColors.blueaccentcolor,
                onPressed: () {
                  categorydata.deleteAt(index);
                  Navigator.pop(context);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(
                      color: constantColors.textcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ))
          ],
        );
      });
}
