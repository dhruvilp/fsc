import 'package:flutter/material.dart';
import 'package:fsc_cert/notifiers/self_identify_notifier.dart';
import 'package:fsc_cert/widgets/question.dart';
import 'package:provider/provider.dart';

import '../../style.dart';

class SelfIdentifyStep extends StatefulWidget {
  @override
  _SelfIdentifyStepState createState() => _SelfIdentifyStepState();
}

class _SelfIdentifyStepState extends State<SelfIdentifyStep> {
  var _levelOneOneSelected = -1;
  var _levelOneOneSubSelected = -1;

  var _levelTwoOneSelected = -1;
  var _levelTwoOneSubSelected = -1;
  var _levelTwoOneSubSubSelected = -1;
  var _levelTwoOneSubSubSubSelected = -1;
  var _levelTwoOneSubSubSubSubSelected = -1;

  var _levelThreeOneSelected = -1;
  var _levelThreeOneSubSelected = -1;
  var _levelThreeOneSubSubSelected = -1;
  var _levelThreeTwoSelected = -1;
  var _levelThreeTwoSubSelected = -1;
  var _levelThreeTwoSubSubSelected = -1;
  var _levelThreeTwoSubSubSubSelected = -1;
  var _levelThreeThreeSelected = -1;
  var _levelThreeThreeSubSelected = -1;
  var _levelThreeThreeSubSubSelected = -1;
  var _levelThreeFourSelected = -1;
  var _levelThreeFiveSelected = -1;

  var _shouldContinueEval = true;

  @override
  Widget build(BuildContext context) {
    var _selfIdEvalNotifier =
        Provider.of<SelfIdentifyEvaluationNotifier>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //=======================================================
        //                       LEVEL I
        //=======================================================
        Align(
          alignment: Alignment.topRight,
          child: FlatButton(
            onPressed: _selfIdEvalNotifier.getLevel1Eval != null
                ? () async {
                    resetLevelSelectionVars();
                    var _isClearEvalPref =
                        await _selfIdEvalNotifier.clearLevelEvalPrefs();
                    if (_isClearEvalPref)
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          elevation: 1.5,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: green,
                          duration: Duration(seconds: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          content: Text(
                            'Cleared user responses!',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                  }
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text('Clear All'),
          ),
        ),
        HeaderText(text: 'Level I'),
        Question(
          number: '1',
          text: 'Do you produce products or only trade them?',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            children: [
              RadioListTile(
                title: Text(
                  'I only trade FSC products',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                value: 0,
                dense: true,
                groupValue: _levelOneOneSelected,
                onChanged: (val) {
                  setState(() {
                    _levelOneOneSelected = val;
                  });
                },
              ),
              RadioListTile(
                title: Text(
                  'I produce FSC products',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                value: 1,
                dense: true,
                groupValue: _levelOneOneSelected,
                onChanged: (val) {
                  setState(() {
                    _levelOneOneSelected = val;
                  });
                },
              ),
            ],
          ),
        ),
        if (_levelOneOneSelected == 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Question(
                number: '2',
                text: 'Do you physically possess these products?',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text(
                        'Yes',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: 0,
                      dense: true,
                      groupValue: _levelOneOneSubSelected,
                      onChanged: (val) {
                        setState(() {
                          _levelOneOneSubSelected = val;
                        });
                        _selfIdEvalNotifier.setLevel1Eval('TDwPP');
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        'No',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: 1,
                      dense: true,
                      groupValue: _levelOneOneSubSelected,
                      onChanged: (val) {
                        setState(() {
                          _levelOneOneSubSelected = val;
                        });
                        _selfIdEvalNotifier.setLevel1Eval('TD/PP');
                      },
                    ),
                  ],
                ),
              ),
              if (_levelOneOneSubSelected == 0)
                TempEvaluation(
                  result: 'Traders with physical possession',
                ),
              if (_levelOneOneSubSelected == 1)
                TempEvaluation(
                  result: 'Traders without physical possession',
                ),
            ],
          ),
        if (_levelOneOneSelected == 1)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Question(
                number: '2',
                text:
                    'Are you a primary producer (meaning you use timber coming directly from the forest?)',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text(
                        'Yes',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: 0,
                      dense: true,
                      groupValue: _levelOneOneSubSelected,
                      onChanged: (val) {
                        setState(() {
                          _levelOneOneSubSelected = val;
                        });
                        _selfIdEvalNotifier.setLevel1Eval('PP');
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        'No',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: 1,
                      dense: true,
                      groupValue: _levelOneOneSubSelected,
                      onChanged: (val) {
                        setState(() {
                          _levelOneOneSubSelected = val;
                        });
                        _selfIdEvalNotifier.setLevel1Eval('SP');
                      },
                    ),
                  ],
                ),
              ),
              if (_levelOneOneSubSelected == 0)
                TempEvaluation(
                  result: 'Primary Producer',
                ),
              if (_levelOneOneSubSelected == 1)
                TempEvaluation(
                  result: 'Secondary Producer',
                ),
            ],
          ),

        //=======================================================
        //                      LEVEL II
        //=======================================================
        if (_selfIdEvalNotifier.getLevel1Eval != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(text: 'Level II'),
              Question(
                number: '1',
                text:
                    'Does/Would your entire production use FSC materials (as opposite to only part of the production set for FSC and other part not)?',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text(
                        'Yes, my entire production is/will focus on FSC material',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: 0,
                      dense: true,
                      groupValue: _levelTwoOneSelected,
                      onChanged: (val) {
                        setState(() {
                          _levelTwoOneSelected = val;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        'No, only part of my production will focus on FSC material',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: 1,
                      dense: true,
                      groupValue: _levelTwoOneSelected,
                      onChanged: (val) {
                        setState(() {
                          _levelTwoOneSelected = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              //====== 1st Page
              if (_levelTwoOneSelected == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Question(
                      number: '2',
                      text:
                          'Do you / would you only sell your products with one of the FSC claims that you have used as your input, or do you / would you calculate your output claims differently?',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text(
                              'I only sell (would sell) products with one of the FSC claims that I have used as your input',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 0,
                            dense: true,
                            groupValue: _levelTwoOneSubSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelTwoOneSubSelected = val;
                              });
                              _selfIdEvalNotifier.setLevel2Eval('TR/S');
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'I(would) either calculate a percentage claim that corresponds to the proportion of claim-contributing inputs, or chose a proportion of outputs to be sold with a credit claim corresponding to the quantity of claimcontributing inputs',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 1,
                            dense: true,
                            groupValue: _levelTwoOneSubSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelTwoOneSubSelected = val;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'I (would) apply all options',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 2,
                            dense: true,
                            groupValue: _levelTwoOneSubSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelTwoOneSubSelected = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    //======= Q2 Ans FollowUps
                    if (_levelTwoOneSubSelected == 0)
                      MidEvaluation(
                        result:
                            'Transfer system ( no physical/temporal segregation)',
                      ),
                    if (_levelTwoOneSubSelected == 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Question(
                            number: '3',
                            text:
                                'Is any of the following true for you? a. You sell (would sell) FSC 100% material? b. trade and processing of nontimber forest products (NTFPs), except for bamboo and NTFPs derived from trees (e.g. cork, resin, bark)',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    'Yes',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 0,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    'No',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 1,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          //======= Q3 (1) Ans FollowUps
                          if (_levelTwoOneSubSubSelected == 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'You cannot calculate a percentage claim nor apply proportion system - you can only sell your products with one of the FSC claims that you have used as your input. Do you want to do it?',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('TR/S');
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                            _shouldContinueEval = false;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('PCT');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= Q4 (Yes) Ans FollowUps
                                if (_levelTwoOneSubSubSubSelected == 0)
                                  MidEvaluation(
                                    result:
                                        'Transfer system ( no physical/temporal segregation)',
                                  ),
                                if (_levelTwoOneSubSubSubSelected == 1)
                                  MidEvaluation(
                                    result:
                                        'Sorry, no possibility for remote audit. Please contact certification body in your area.',
                                  ),
                              ],
                            ),
                          if (_levelTwoOneSubSubSelected == 1)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'Is any of the following true for you? d. print processes e. sale of products with FSC Small and Community Label and/or claim',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('PC');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= Q4 (No) Ans FollowUps
                                if (_levelTwoOneSubSubSubSelected == 0)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Question(
                                        number: '5',
                                        text:
                                            'You cannot apply proportion system - you can only calculate a percentage claim that corresponds to the proportion of claim -contributing inputs. Do you want to do it?',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            RadioListTile(
                                              title: Text(
                                                'Yes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 0,
                                              dense: true,
                                              groupValue:
                                                  _levelTwoOneSubSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelTwoOneSubSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel2Eval('TR/S');
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text(
                                                'No',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 1,
                                              dense: true,
                                              groupValue:
                                                  _levelTwoOneSubSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelTwoOneSubSubSubSubSelected =
                                                      val;
                                                  _shouldContinueEval = false;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel2Eval('PCT');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //======= Q5 Ans FollowUps
                                      if (_levelTwoOneSubSubSubSubSelected == 0)
                                        MidEvaluation(
                                          result:
                                              'Transfer system ( no physical/temporal segregation)',
                                        ),
                                      if (_levelTwoOneSubSubSubSubSelected == 1)
                                        MidEvaluation(
                                          result:
                                              'Sorry, No possibility for remote audit. Please contact certification body in your area.',
                                        ),
                                    ],
                                  ),
                                if (_levelTwoOneSubSubSubSelected == 1)
                                  MidEvaluation(
                                    result: 'Percentage/Credit system',
                                  ),
                              ],
                            ),
                        ],
                      ),
                    if (_levelTwoOneSubSelected == 2)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Question(
                            number: '3',
                            text:
                                'Is any of the following true for you? a. You sell (would sell) FSC 100% material? b. trade and processing of nontimber forest products (NTFPs), except for bamboo and NTFPs derived from trees (e.g. cork, resin, bark)',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    'Yes',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 0,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    'No',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 1,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          //======= Q3 Ans FollowUps
                          if (_levelTwoOneSubSubSelected == 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'You cannot calculate a percentage claim nor apply proportion system - you can only sell your products with one of the FSC claims that you have used as your input. Do you want to do it?',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('TR/S');
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                            _shouldContinueEval = false;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('PCT');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= Q4 Ans FollowUps
                                if (_levelTwoOneSubSubSubSelected == 0)
                                  MidEvaluation(
                                    result:
                                        'Transfer system ( no physical/temporal segregation)',
                                  ),
                                if (_levelTwoOneSubSubSubSelected == 1)
                                  MidEvaluation(
                                    result:
                                        'Sorry, no possibility for remote audit. Please contact certification body in your area.',
                                  ),
                              ],
                            ),
                          if (_levelTwoOneSubSubSelected == 1)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'Is any of the following true for you? d. print processes e. sale of products with FSC Small and Community Label and/or claim',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('TR/S');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= Q4 Ans FollowUps
                                if (_levelTwoOneSubSubSubSelected == 0)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Question(
                                        number: '5',
                                        text:
                                            'You cannot apply proportion system - you can only calculate a percentage claim that corresponds to the proportion of claim-contributing inputs. Do you want to do it?',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            RadioListTile(
                                              title: Text(
                                                'Yes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 0,
                                              dense: true,
                                              groupValue:
                                                  _levelTwoOneSubSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelTwoOneSubSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel2Eval('PC');
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text(
                                                'No',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 1,
                                              dense: true,
                                              groupValue:
                                                  _levelTwoOneSubSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelTwoOneSubSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel2Eval('TR/S');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //======= Q5 Ans FollowUps
                                      if (_levelTwoOneSubSubSubSubSelected == 0)
                                        MidEvaluation(
                                          result: 'Percentage/Credit system',
                                        ),
                                      if (_levelTwoOneSubSubSubSubSelected == 1)
                                        MidEvaluation(
                                          result:
                                              'Transfer system (no physical/temporal segregation)',
                                        ),
                                    ],
                                  ),
                                if (_levelTwoOneSubSubSubSelected == 1)
                                  MidEvaluation(
                                    result:
                                        'All three systems or a combination of them',
                                  ),
                              ],
                            ),
                        ],
                      ),
                  ],
                ),
              //====== 2nd Page
              if (_levelTwoOneSelected == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Question(
                      number: '2',
                      text:
                          'Do you / would you only sell your products with one of the FSC claims that you have used as your input, or do you / would you calculate your output claims differently?',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text(
                              'I only sell (would sell) products with one of the FSC claims that I have used as your input',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 0,
                            dense: true,
                            groupValue: _levelTwoOneSubSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelTwoOneSubSelected = val;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'I(would) either calculate a percentage claim that corresponds to the proportion of claim-contributing inputs, or chose a proportion of outputs to be sold with a credit claim corresponding to the quantity of claimcontributing inputs',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 1,
                            dense: true,
                            groupValue: _levelTwoOneSubSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelTwoOneSubSelected = val;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'I (would) apply all options',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 2,
                            dense: true,
                            groupValue: _levelTwoOneSubSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelTwoOneSubSelected = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    //======= Q2 Ans FollowUps
                    if (_levelTwoOneSubSelected == 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Question(
                            number: '3',
                            text:
                                'Do you physically separate FSC materials from non-FSC materials (temporarily or permanently)?',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    'Yes',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 0,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                    _selfIdEvalNotifier.setLevel2Eval('TRwS');
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    'No',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 1,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                    _selfIdEvalNotifier.setLevel2Eval('TR/S');
                                  },
                                ),
                              ],
                            ),
                          ),
                          //======= Q3 Ans FollowUps
                          if (_levelTwoOneSubSubSelected == 0)
                            MidEvaluation(
                              result: 'Transfer system (with segregation)',
                            ),
                          if (_levelTwoOneSubSubSelected == 1)
                            MidEvaluation(
                              result:
                                  'Transfer system (no physical/temporal segregation)',
                            ),
                        ],
                      ),
                    if (_levelTwoOneSubSelected == 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Question(
                            number: '3',
                            text:
                                'Is any of the following true for you? a. You sell (would sell) FSC 100% material? b. trade and processing of nontimber forest products (NTFPs), except for bamboo and NTFPs derived from trees (e.g. cork, resin, bark)',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    'Yes',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 0,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    'No',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 1,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          //======= Q3 (1) Ans FollowUps
                          if (_levelTwoOneSubSubSelected == 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'You cannot calculate a percentage claim nor apply proportion system - you can only sell your products with one of the FSC claims that you have used as your input. Do you want to do it?',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('TR/S');
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                            _shouldContinueEval = false;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('PCT');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= Q4 (Yes) Ans FollowUps
                                if (_levelTwoOneSubSubSubSelected == 0)
                                  MidEvaluation(
                                    result:
                                        'Transfer system ( no physical/temporal segregation)',
                                  ),
                                if (_levelTwoOneSubSubSubSelected == 1)
                                  MidEvaluation(
                                    result:
                                        'Sorry, no possibility for remote audit. Please contact certification body in your area.',
                                  ),
                              ],
                            ),
                          if (_levelTwoOneSubSubSelected == 1)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'Is any of the following true for you? d. print processes e. sale of products with FSC Small and Community Label and/or claim',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('PC');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= Q4 (No) Ans FollowUps
                                if (_levelTwoOneSubSubSubSelected == 0)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Question(
                                        number: '5',
                                        text:
                                            'You cannot apply proportion system - you can only calculate a percentage claim that corresponds to the proportion of claim -contributing inputs. Do you want to do it?',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            RadioListTile(
                                              title: Text(
                                                'Yes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 0,
                                              dense: true,
                                              groupValue:
                                                  _levelTwoOneSubSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelTwoOneSubSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel2Eval('PC');
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text(
                                                'No',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 1,
                                              dense: true,
                                              groupValue:
                                                  _levelTwoOneSubSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelTwoOneSubSubSubSubSelected =
                                                      val;
                                                  _shouldContinueEval = false;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel2Eval('PCT');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //======= Q5 Ans FollowUps
                                      if (_levelTwoOneSubSubSubSubSelected == 0)
                                        MidEvaluation(
                                          result: 'Percentage/Credit system',
                                        ),
                                      if (_levelTwoOneSubSubSubSubSelected == 1)
                                        MidEvaluation(
                                          result:
                                              'Sorry, no possibility for remote audit. Please contact certification body in your area.',
                                        ),
                                    ],
                                  ),
                                if (_levelTwoOneSubSubSubSelected == 1)
                                  MidEvaluation(
                                    result: 'Percentage/Credit system',
                                  ),
                              ],
                            ),
                        ],
                      ),
                    if (_levelTwoOneSubSelected == 2)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Question(
                            number: '3',
                            text:
                                'Is any of the following true for you? a. You sell (would sell) FSC 100% material? b. trade and processing of nontimber forest products (NTFPs), except for bamboo and NTFPs derived from trees (e.g. cork, resin, bark)',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    'Yes',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 0,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    'No',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 1,
                                  dense: true,
                                  groupValue: _levelTwoOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelTwoOneSubSubSelected = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          //======= Q3 Ans FollowUps
                          if (_levelTwoOneSubSubSelected == 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'You cannot calculate a percentage claim nor apply proportion system - you can only sell your products with one of the FSC claims that you have used as your input. Do you want to do it?',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('TR/S');
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                            _shouldContinueEval = false;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('PCT');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= Q4 Ans FollowUps
                                if (_levelTwoOneSubSubSubSelected == 0)
                                  MidEvaluation(
                                    result:
                                        'Transfer system ( no physical/temporal segregation)',
                                  ),
                                if (_levelTwoOneSubSubSubSelected == 1)
                                  MidEvaluation(
                                    result:
                                        'Sorry, no possibility for remote audit. Please contact certification body in your area.',
                                  ),
                              ],
                            ),
                          if (_levelTwoOneSubSubSelected == 1)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'Is any of the following true for you? d. print processes e. sale of products with FSC Small and Community Label and/or claim',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelTwoOneSubSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelTwoOneSubSubSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel2Eval('TR/S');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= Q4 Ans FollowUps
                                if (_levelTwoOneSubSubSubSelected == 0)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Question(
                                        number: '5',
                                        text:
                                            'You cannot apply proportion system - you can only calculate a percentage claim that corresponds to the proportion of claim-contributing inputs. Do you want to do it?',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            RadioListTile(
                                              title: Text(
                                                'Yes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 0,
                                              dense: true,
                                              groupValue:
                                                  _levelTwoOneSubSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelTwoOneSubSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel2Eval('PC');
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text(
                                                'No',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 1,
                                              dense: true,
                                              groupValue:
                                                  _levelTwoOneSubSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelTwoOneSubSubSubSubSelected =
                                                      val;
                                                  _shouldContinueEval = false;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel2Eval('PCT');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //======= Q5 Ans FollowUps
                                      if (_levelTwoOneSubSubSubSubSelected == 0)
                                        MidEvaluation(
                                          result: 'Percentage/Credit system',
                                        ),
                                      if (_levelTwoOneSubSubSubSubSelected == 1)
                                        MidEvaluation(
                                          result:
                                              'Sorry, no possibility for remote audit. Please contact certification body in your area.',
                                        ),
                                    ],
                                  ),
                                if (_levelTwoOneSubSubSubSelected == 1)
                                  MidEvaluation(
                                    result:
                                        'All three systems or a combination of them',
                                  ),
                              ],
                            ),
                        ],
                      ),
                  ],
                ),
            ],
          ),

        ///=======================================================
        ///                      LEVEL III
        ///=======================================================
        if (_selfIdEvalNotifier.getLevel1Eval != null &&
            _selfIdEvalNotifier.getLevel2Eval != null &&
            _selfIdEvalNotifier.getLevel2Eval != 'PCT')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(text: 'Level III'),
              Question(
                number: '1',
                text:
                    'Do you outsource any production activities related to your FSC materials?',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text(
                        'Yes',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: 0,
                      dense: true,
                      groupValue: _levelThreeOneSelected,
                      onChanged: (val) {
                        setState(() {
                          _levelThreeOneSelected = val;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        'No',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: 1,
                      dense: true,
                      groupValue: _levelThreeOneSelected,
                      onChanged: (val) {
                        setState(() {
                          _levelThreeOneSelected = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              //====== Q3 Ans FollowUps
              if (_levelThreeOneSelected == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Question(
                      number: '1a',
                      text:
                          'Is any of the below true for you and your contractors? \n\ta) you outsource all or most of the manufacturing processes of a product; or \n\tb) your contractor(s) mixes different input materials (e.g. FSC 100%, controlled material, FSC controlled wood); or \n\tc) your contractor(s) applies the FSC label to the product; or \n\td) your contractor(s) does not physically return the FSC certified product to you after outsourcing; or \n\te) activities are outsourced to a contractor in another country with a Transparency International \n\tCorruption Perception Index (CPI) lower than 50.',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text(
                              'Yes',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 0,
                            dense: true,
                            groupValue: _levelThreeOneSubSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelThreeOneSubSelected = val;
                              });
                              _selfIdEvalNotifier.setLevel3Eval('OUT');
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'No',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 1,
                            dense: true,
                            groupValue: _levelThreeOneSubSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelThreeOneSubSelected = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    //======= 1a Ans FollowUps
                    if (_levelThreeOneSubSelected == 0)
                      LastEvaluation(
                        result: 'Outsourcing',
                      ),
                    if (_levelThreeOneSubSelected == 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Question(
                            number: '1b',
                            text:
                                'Did you have any problems or nonconformities by your contractors regarding mixing different material groups or you otherwise think that there may be some problems?',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    'Yes',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 0,
                                  dense: true,
                                  groupValue: _levelThreeOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelThreeOneSubSubSelected = val;
                                    });
                                    _selfIdEvalNotifier.setLevel3Eval('OUT');
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    'No',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 1,
                                  dense: true,
                                  groupValue: _levelThreeOneSubSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelThreeOneSubSubSelected = val;
                                    });
                                    _selfIdEvalNotifier.setLevel3Eval('OUT');
                                  },
                                ),
                              ],
                            ),
                          ),
                          //======= Q3 (1) Ans FollowUps
                          if (_levelThreeOneSubSubSelected == 0)
                            LastEvaluation(
                              result: 'Outsourcing',
                            ),
                          if (_levelThreeOneSubSubSelected == 1)
                            LastEvaluation(
                              result: 'Outsourcing',
                            ),
                        ],
                      ),
                  ],
                ),
              if (_levelThreeOneSelected == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Question(
                      number: '2',
                      text: 'Do you use any recycled materials?',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text(
                              'Yes',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 0,
                            dense: true,
                            groupValue: _levelThreeTwoSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelThreeTwoSelected = val;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'No',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            value: 1,
                            dense: true,
                            groupValue: _levelThreeTwoSelected,
                            onChanged: (val) {
                              setState(() {
                                _levelThreeTwoSelected = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    //====== Q2 Ans FollowUps
                    if (_levelThreeTwoSelected == 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Question(
                            number: '2a',
                            text: 'Do you only use FSC recycled materials?',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    'Yes',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 0,
                                  dense: true,
                                  groupValue: _levelThreeTwoSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelThreeTwoSubSelected = val;
                                    });
                                    _selfIdEvalNotifier.setLevel3Eval('LAB');
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    'No',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 1,
                                  dense: true,
                                  groupValue: _levelThreeTwoSubSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelThreeTwoSubSelected = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          //======= 2a Ans FollowUps
                          if (_levelThreeTwoSubSelected == 0)
                            LastEvaluation(
                              result: 'All scenarios w/t traders',
                            ),
                          if (_levelThreeTwoSubSelected == 1)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '2b',
                                  text:
                                      'Do you/ would you audit your suppliers for the compliance with FSC requirements yourself (as opposite to e.g. using FSC accredited CB)?',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue:
                                            _levelThreeTwoSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelThreeTwoSubSubSelected = val;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue:
                                            _levelThreeTwoSubSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelThreeTwoSubSubSelected = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= 2b Ans FollowUps
                                if (_levelThreeTwoSubSubSelected == 0)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Question(
                                        number: '2c',
                                        text:
                                            'Can you present objective evidence for your classification of the material?',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            RadioListTile(
                                              title: Text(
                                                'Yes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 0,
                                              dense: true,
                                              groupValue:
                                                  _levelThreeTwoSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelThreeTwoSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel3Eval('REC');
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text(
                                                'No',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 1,
                                              dense: true,
                                              groupValue:
                                                  _levelThreeTwoSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelThreeTwoSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel3Eval('REC');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //======= 2c Ans FollowUps
                                      if (_levelThreeTwoSubSubSubSelected == 0)
                                        LastEvaluation(
                                          result: 'Sourcing recycling material',
                                        ),
                                      if (_levelThreeTwoSubSubSubSelected == 1)
                                        LastEvaluation(
                                          result: 'Sourcing recycling material',
                                        ),
                                    ],
                                  ),
                                if (_levelThreeTwoSubSubSelected == 1)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Question(
                                        number: '2c',
                                        text:
                                            'Do you use FSC accredited CB (but not the same one that is auditing you)?',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            RadioListTile(
                                              title: Text(
                                                'Yes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 0,
                                              dense: true,
                                              groupValue:
                                                  _levelThreeTwoSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelThreeTwoSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel3Eval('REC');
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text(
                                                'No',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 1,
                                              dense: true,
                                              groupValue:
                                                  _levelThreeTwoSubSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelThreeTwoSubSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel3Eval('REC');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //======= 2c Ans FollowUps
                                      if (_levelThreeTwoSubSubSubSelected == 0)
                                        LastEvaluation(
                                          result: 'Sourcing recycling material',
                                        ),
                                      if (_levelThreeTwoSubSubSubSelected == 1)
                                        LastEvaluation(
                                          result: 'Sourcing recycling material',
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                        ],
                      ),
                    if (_levelThreeTwoSelected == 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Question(
                            number: '3',
                            text:
                                'Do you / would you use any uncertified material that you would like to mix in with certified material (this can happen when you e.g. do not have enough FSC certified material and it means applying additional standards for Mix products FSC-STD40-005)?',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    'Yes',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 0,
                                  dense: true,
                                  groupValue: _levelThreeThreeSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelThreeThreeSelected = val;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    'No',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: 1,
                                  dense: true,
                                  groupValue: _levelThreeThreeSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      _levelThreeThreeSelected = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          //====== Q3 Ans FollowUps
                          if (_levelThreeThreeSelected == 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '3a',
                                  text:
                                      'Can ensure that you do not mix your uncertified material with non-FSC materials?',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue: _levelThreeThreeSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelThreeThreeSubSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel3Eval('CW');
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue: _levelThreeThreeSubSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelThreeThreeSubSelected = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //======= 3b Q/A
                                if (_levelThreeThreeSubSelected == 1)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Question(
                                        number: '3b',
                                        text:
                                            'Is your uncertified material coming from low risk regions as per FSC risk assessments?',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            RadioListTile(
                                              title: Text(
                                                'Yes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 0,
                                              dense: true,
                                              groupValue:
                                                  _levelThreeThreeSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelThreeThreeSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel3Eval('CW');
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text(
                                                'No',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 1,
                                              dense: true,
                                              groupValue:
                                                  _levelThreeThreeSubSubSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelThreeThreeSubSubSelected =
                                                      val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel3Eval('CW');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //======= 3b Ans FollowUps
                                      if (_levelThreeTwoSubSubSelected == 0)
                                        LastEvaluation(
                                          result:
                                              'Sourcing controlled wood / controlled material',
                                        ),
                                      if (_levelThreeTwoSubSubSelected == 1)
                                        LastEvaluation(
                                          result:
                                              'Sourcing controlled wood / controlled material',
                                        ),
                                    ],
                                  ),
                                if (_levelThreeThreeSubSelected == 0)
                                  LastEvaluation(
                                    result:
                                        'Sourcing controlled wood / controlled material',
                                  ),
                              ],
                            ),
                          if (_levelThreeThreeSelected == 1)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Question(
                                  number: '4',
                                  text:
                                      'Is all your operation located just in one physical location?',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Yes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 0,
                                        dense: true,
                                        groupValue: _levelThreeFourSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelThreeFourSelected = val;
                                          });
                                          _selfIdEvalNotifier
                                              .setLevel3Eval('MLT');
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        value: 1,
                                        dense: true,
                                        groupValue: _levelThreeFourSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            _levelThreeFourSelected = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //====== Q4 Ans FollowUps
                                if (_levelThreeFourSelected == 0)
                                  LastEvaluation(
                                    result: 'Group/multisite',
                                  ),
                                if (_levelThreeFourSelected == 1)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Question(
                                        number: '5',
                                        text:
                                            'Do you (would you) label your FSC products with FSC Label?',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            RadioListTile(
                                              title: Text(
                                                'Yes',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 0,
                                              dense: true,
                                              groupValue:
                                                  _levelThreeFiveSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelThreeFiveSelected = val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel3Eval('LAB');
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text(
                                                'No',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              value: 1,
                                              dense: true,
                                              groupValue:
                                                  _levelThreeFiveSelected,
                                              onChanged: (val) {
                                                setState(() {
                                                  _levelThreeFiveSelected = val;
                                                });
                                                _selfIdEvalNotifier
                                                    .setLevel3Eval('CONT');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //====== Q5 Ans FollowUps
                                      if (_levelThreeFiveSelected == 0)
                                        LastEvaluation(
                                          result: 'Labelling',
                                        ),
                                      if (_levelThreeFiveSelected == 1)
                                        Container(
                                            // GO TO NEXT QUESTION
                                            ),
                                    ],
                                  ),
                              ],
                            ),
                        ],
                      ),
                  ],
                ),
            ],
          ),
      ],
    );
  }

  void resetLevelSelectionVars() {
    setState(() {
      _levelOneOneSelected = -1;
      _levelOneOneSubSelected = -1;

      _levelTwoOneSelected = -1;
      _levelTwoOneSubSelected = -1;
      _levelTwoOneSubSubSelected = -1;
      _levelTwoOneSubSubSubSelected = -1;
      _levelTwoOneSubSubSubSubSelected = -1;

      _levelThreeOneSelected = -1;
      _levelThreeOneSubSelected = -1;
      _levelThreeOneSubSubSelected = -1;
      _levelThreeTwoSelected = -1;
      _levelThreeTwoSubSelected = -1;
      _levelThreeTwoSubSubSelected = -1;
      _levelThreeTwoSubSubSubSelected = -1;
      _levelThreeThreeSelected = -1;
      _levelThreeThreeSubSelected = -1;
      _levelThreeThreeSubSubSelected = -1;
      _levelThreeFourSelected = -1;
      _levelThreeFiveSelected = -1;
    });
  }
}

///============================================================================
///                           SUPPORTING WIDGETS
///============================================================================

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Chip(
        backgroundColor: green,
        label: Text(
          text,
          style: Theme.of(context)
              .primaryTextTheme
              .subtitle1
              .copyWith(color: white),
        ),
        avatar: CircleAvatar(
          radius: 8.5,
          backgroundColor: white,
        ),
      ),
    );
  }
}

class TempEvaluation extends StatelessWidget {
  final String result;
  const TempEvaluation({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: 'Based on your responses, you self-identified as ',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: result ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),
            TextSpan(text: ' Please continue for further evaluation.'),
          ],
        ),
      ),
    );
  }
}

class MidEvaluation extends StatelessWidget {
  final String result;
  const MidEvaluation({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: 'Based on your responses, your current status is ',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: result ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: result.contains('Sorry') ? red : green,
              ),
            ),
            if (!result.contains('Sorry'))
              TextSpan(text: ' Please continue for further evaluation.'),
          ],
        ),
      ),
    );
  }
}

class LastEvaluation extends StatelessWidget {
  final String result;
  const LastEvaluation({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: 'Based on your responses, you are ',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: result ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),
            TextSpan(
                text:
                    ' Please click NEXT to find out whether your company is egilible for remote auditing or not.'),
          ],
        ),
      ),
    );
  }
}
