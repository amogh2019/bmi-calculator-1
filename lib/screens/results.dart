import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../entities/bmi_label.dart';

/// ----------------------------------------
///
///  another route /// aka screen,page
///
/// what you see on a page/screen is a tree of widgets /// aka widget tree
/// context stores info about this tree, root, other settings /// context === pointer to root
/// we give each screen a label to identify it ///  route === a  widget tree === label of widget tree === label for a page
///
/// ----------------------------------------

class ResultsPage extends StatelessWidget {
  const ResultsPage({this.bmiLabel, this.bmi});

  final BmiLabel? bmiLabel;
  final String? bmi;

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
// need appbar, else stack nagivation button not present and its difficut to navigate it its not webapp :(
//             Text(textAlign: TextAlign.center,
//               'Results',
//               style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     fontSize: 30,
//                   ),
//             ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 0),
              child: Text(
                'Your Result',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onError),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            bmiLabel != null ? bmiLabel!.labelName : 'n/a',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
//                               color: Color(0xFF24D876),
                              fontSize: 26,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            bmi != null ? bmi! : 'n/a',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onError),
                          ),
                          Text(
                            bmiLabel != null ? bmiLabel!.description : 'n/a',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onError,
                              fontSize: 18,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w100,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                constraints: BoxConstraints.tight(const Size.fromHeight(50)),
                alignment: Alignment.topCenter,
                color: Theme.of(context).colorScheme.onError,
                padding: kPaddingAll10,
                child: Text('Re - Calculate',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
