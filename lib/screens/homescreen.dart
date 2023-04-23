import 'package:bmi_calculator/components/slider_for_card.dart';
import 'package:bmi_calculator/components/volume_for_card.dart';
import 'package:bmi_calculator/entities/gender.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:bmi_calculator/services/calculator_brain.dart';
import 'package:flutter/material.dart';

import '../components/icon_for_card.dart';
import '../components/mycard.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;
  int? selectedHeight;
  int? selectedWeight;
  int? selectedAge;

  bool isReadyToCalculate() {
    return !(selectedGender == null ||
        selectedHeight == null ||
        selectedWeight == null ||
        selectedAge == null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: kAppNameText,
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 30,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: MyCard(
                        selectedGender == Gender.male
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.background,
                        IconForCard(
                          icon: Icons.male,
                          text: Gender.male.genderLabel,
                        ), () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    }),
                  ),
                  Expanded(
                    child: MyCard(
                        selectedGender == Gender.female
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.background,
                        IconForCard(
                          icon: Icons.female,
                          text: Gender.female.genderLabel,
                        ), () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: MyCard(
                      selectedHeight != null
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.background,
                      SliderForCard(
                          value: selectedHeight == null
                              ? 120
                              : selectedHeight!.toDouble(),
                          text: 'Height',
                          onChanged: (double newSelectedHeight) {
                            setState(() {
                              selectedHeight = newSelectedHeight.floor();
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: MyCard(
                      selectedWeight != null
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.background,
                      VolumeForCard(
                        value: selectedWeight ?? 60,
                        text: 'Weight',
                        onIncrement: () {
                          setState(() {
                            selectedWeight = selectedWeight != null
                                ? selectedWeight! + 1
                                : 61;
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            selectedWeight = selectedWeight != null
                                ? selectedWeight! - 1
                                : 59;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      selectedAge != null
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.background,
                      VolumeForCard(
                        value: selectedAge ?? 27,
                        text: 'Age',
                        onIncrement: () {
                          setState(() {
                            selectedAge =
                                selectedAge != null ? selectedAge! + 1 : 28;
                          });
                        },
                        onDecrement: () {
                          setState(
                            () {
                              selectedAge =
                                  selectedAge != null ? selectedAge! - 1 : 26;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {
                  CalculatorBrain brain = CalculatorBrain(
                    height: selectedHeight!,
                    weight: selectedWeight!,
                  );
                  _navigateToShowResultAndReset(brain);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.topCenter,
                  constraints: const BoxConstraints.expand(),
                  color: isReadyToCalculate()
                      ? Theme.of(context).colorScheme.onError
                      : Theme.of(context).colorScheme.onError.withAlpha(95),
                  padding: kPaddingAll10,
                  child: Text('Calculate',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToShowResultAndReset(CalculatorBrain brain) {
    if (isReadyToCalculate()) {
      _navigateToShowResult(brain);
    }
  }

  // async forces method to have Future as return type AND wraps results as a Future (even if you await and return is directly, simple bool wont be returned, instead it would be futurebool)
  Future<void> _navigateToShowResult(CalculatorBrain brain) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultsPage(bmi: brain.getBmi(), bmiLabel: brain.getBmiLabel()),
      ),
    );

    if (result) {
      setState(() {
        selectedGender = null;
        selectedHeight = null;
        selectedWeight = null;
        selectedAge = null;
      });
    }
  }
}
