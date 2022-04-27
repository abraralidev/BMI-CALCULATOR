// ignore_for_file: deprecated_member_use

import 'package:bmical/Widgets/Reusedcard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/card_data.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

const ActiveCardcolor = Color(0xff1d1e33);
const Bottomcolor = Color(0xffeb1555);
const InActiveCardcolor = Color(0xff111328);
enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  //  late Gender selectedGender;
  Color maleCardColor = InActiveCardcolor;
  Color femaleCardColor = InActiveCardcolor;
  void updatecolor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == InActiveCardcolor) {
        maleCardColor = ActiveCardcolor;
        femaleCardColor = InActiveCardcolor;
      } else {
        maleCardColor = InActiveCardcolor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColor == InActiveCardcolor) {
        femaleCardColor = ActiveCardcolor;
        maleCardColor = InActiveCardcolor;
      } else {
        femaleCardColor = InActiveCardcolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusedCard(
                    // colour: selectedGender == Gender.male
                    // ? ActiveCardcolor
                    // : InActiveCardcolor,
                    cardchild: card_data(
                      text: 'MALE',
                      icons: FontAwesomeIcons.mars,
                    ),
                    colour: maleCardColor,
                    onPress: () {
                      setState(() {
                        updatecolor(Gender.male);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusedCard(
                    // colour: selectedGender == Gender.female
                    // ? ActiveCardcolor
                    // : InActiveCardcolor,
                    cardchild: card_data(
                        text: 'FEMALE', icons: FontAwesomeIcons.venus),
                    colour: femaleCardColor,
                    onPress: () {
                      setState(() {
                        updatecolor(Gender.female);
                      });
                    },
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusedCard(
                colour: ActiveCardcolor,
                cardchild: Container(),
                onPress: () {},
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusedCard(
                    colour: ActiveCardcolor,
                    cardchild: Column(children: []),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusedCard(
                    colour: ActiveCardcolor,
                    cardchild: Column(children: []),
                    onPress: () {},
                  ),
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: Bottomcolor, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ));
  }
}
