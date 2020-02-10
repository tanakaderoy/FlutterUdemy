import 'package:bmi_calculator/components/CalculateButtonWidget.dart';
import 'package:bmi_calculator/utils/Constants.dart';
import 'package:bmi_calculator/models/PersonData.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final PersonData personData;

  ResultsPage({@required this.personData});

  @override
  Widget build(BuildContext context) {
    print(personData);
    return Scaffold(
      appBar: AppBar(
        title: kAppName,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Normal',
                    style: kResultTextStyle,
                  ),
                  Text(
                    personData.calculateBMI().toStringAsFixed(1),
                    style: kBMITextStyle,
                  ),
                  Text(
                    personData.getBMIStatus(),
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          CalculateButtonWidget(
            'Re-Calculate',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }


}
