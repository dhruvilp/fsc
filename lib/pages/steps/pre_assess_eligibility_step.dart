import 'package:flutter/material.dart';
import 'package:fsc_cert/notifiers/self_identify_notifier.dart';
import 'package:provider/provider.dart';

import '../../defaults.dart';

class PreAssessEligibilityStep extends StatefulWidget {
  final String evalMatrix;
  final String level2Eval;
  final String level3Eval;
  const PreAssessEligibilityStep(
      {Key key, this.evalMatrix, this.level2Eval, this.level3Eval})
      : super(key: key);

  @override
  _PreAssessEligibilityStepState createState() =>
      _PreAssessEligibilityStepState();
}

class _PreAssessEligibilityStepState extends State<PreAssessEligibilityStep> {
  var _matrix;
  var _isEligible;

  @override
  void initState() {
    super.initState();
    _matrix = kMatrixAlloc[widget.evalMatrix];
    _isEligible = isEligibleForRemoteAudit();
  }

  bool isEligibleForRemoteAudit() {
    return _matrix[kLevel2EvalMapping[widget.level2Eval]]
        [kLevel3EvalMapping[widget.level3Eval]];
  }

  @override
  Widget build(BuildContext context) {
    var _selfIdEvalNotifier =
        Provider.of<SelfIdentifyEvaluationNotifier>(context);

    return Column(
      children: [
        SizedBox(height: 20.0),
        Center(
          child: Image.asset(
            _isEligible ? kCongrats : kSorry,
            width: 250.0,
          ),
        ),
        _isEligible
            ? Text('You are eligible for remote auditing!')
            : Text('You are NOT eligible for remote auditing!'),
        ListTile(
          leading: Text('Level I:'),
          title: Text(_selfIdEvalNotifier.getLevel1Eval ?? ''),
          subtitle: Text(widget.evalMatrix ?? ''),
        ),
        ListTile(
          leading: Text('Level II:'),
          title: Text(_selfIdEvalNotifier.getLevel2Eval ?? ''),
          subtitle: Text(widget.level2Eval ?? ''),
        ),
        ListTile(
          leading: Text('Level III:'),
          title: Text(_selfIdEvalNotifier.getLevel3Eval ?? ''),
          subtitle: Text(widget.level3Eval ?? ''),
        ),
        ListTile(
          leading: Text('Is eligible'),
          title: Text('$_isEligible' ?? ''),
        ),
      ],
    );
  }
}
