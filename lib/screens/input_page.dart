import 'package:bmi_calc/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calc/components/reusable_card.dart';
import '../components/icon_content.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import '../calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int myHeight = 180;
  int myWeight = 75;
  int myAge = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  mycolour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInActiveCardColour,
                  cardChild: const IconContent(
                    iconImage: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  mycolour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInActiveCardColour,
                  cardChild: const IconContent(
                    iconImage: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReuseableCard(
              onPress: () {
                setState(() {
                  // Height Functions to be Called.;
                });
              },
              mycolour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        myHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: myHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          myHeight = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  mycolour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        myWeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  myWeight++;
                                });
                              },
                              myIcon: FontAwesomeIcons.plus
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  myWeight--;
                                });
                              },
                              myIcon: FontAwesomeIcons.minus),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  mycolour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        myAge.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  myAge++;
                                });
                              },
                              myIcon: FontAwesomeIcons.plus
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  myAge--;
                                });
                              },
                              myIcon: FontAwesomeIcons.minus),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: myHeight, weight: myWeight);

                Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation() ,
                )));
          },),
        ],
      ),
    );
  } //commit
}

