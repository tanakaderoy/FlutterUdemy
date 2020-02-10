import 'dart:math';

import 'package:bmi_calculator/components/CalculateButtonWidget.dart';
import 'package:bmi_calculator/utils/Constants.dart';
import 'package:bmi_calculator/components/IconContent.dart';
import 'package:bmi_calculator/utils/MyTheme.dart';
import 'package:bmi_calculator/models/PersonData.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/screens/ResultsPage.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  double height = 180;
  int weight = 200;
  int age = 22;

  String returnFeetInches(double cm) {
    double inches = (cm / 2.54);
    double feet = (inches / 12);
    String foot = feet.toInt().toString();
    String inch =
        (((10 * feet - 10 * feet.toInt()) / 10) * 100).toStringAsFixed(0);
    return '$foot\'$inch';
  }

  void updateGenderColor(Gender gender) {
    if (gender == Gender.male) {
      maleCardColor = maleCardColor == kInactiveCardColor
          ? kActiveCardColor
          : kInactiveCardColor;
      femaleCardColor = kInactiveCardColor;
    } else {
      femaleCardColor = femaleCardColor == kInactiveCardColor
          ? kActiveCardColor
          : kInactiveCardColor;
      maleCardColor = kInactiveCardColor;
    }
  }

  void updateWeight(Increment increment) {
    switch (increment) {
      case Increment.increment:
        setState(() {
          weight++;
        });
        break;
      case Increment.decrement:
        setState(() {
          weight--;
        });
        break;
      default:
        return;
    }
  }

  void updateAge(Increment increment) {
    switch (increment) {
      case Increment.increment:
        setState(() {
          age++;
        });
        break;
      case Increment.decrement:
        setState(() {
          age--;
        });
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kAppName,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    maleCardColor,
                    onPress: () {
                      setState(() {
                        updateGenderColor(Gender.male);
                      });
                    },
                    cardChild: IconContent(gender: Gender.male),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    femaleCardColor,
                    cardChild: IconContent(
                      gender: Gender.female,
                    ),
                    onPress: () {
                      setState(() {
                        updateGenderColor(Gender.female);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        returnFeetInches(height),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'ft\'in',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: kBottomContainerColor,
                        activeTrackColor: Colors.white,
                        overlayColor: MyTheme.transparentPinkColor),
                    child: Slider(
                      value: height.toDouble(),
                      min: kSliderMin,
                      max: kSliderMax,
                      inactiveColor: kLightGreyColor,
                      onChanged: (val) {
                        setState(() {
                          height = val;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                updateWeight(Increment.decrement);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                updateWeight(Increment.increment);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                updateAge(Increment.decrement);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                updateAge(Increment.increment);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          CalculateButtonWidget(
            'Calculate',
            onPress: () {
              PersonData personData = PersonData.create('Male', height, weight, age);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage( personData: personData)));
            },
          )
        ],
      ),
    );
  }
}


enum Gender { male, female }

enum Increment { increment, decrement }
