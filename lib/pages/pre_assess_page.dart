import 'package:flutter/material.dart';
import 'package:fsc_cert/notifiers/self_identify_notifier.dart';
import 'package:fsc_cert/pages/steps/additional_questions_step.dart';
import 'package:fsc_cert/pages/steps/digital_checklist.dart';
import 'package:fsc_cert/pages/steps/pre_assess_eligibility_step.dart';
import 'package:fsc_cert/pages/steps/self_identify_step.dart';
import 'package:fsc_cert/pages/steps/sign_agreement_step.dart';
import 'package:fsc_cert/pages/steps/upload_documents_step.dart';
import 'package:fsc_cert/widgets/custom_stepper.dart';
import 'package:provider/provider.dart';

import '../style.dart';
import '../utils.dart';

class PreAssessmentPage extends StatefulWidget {
  @override
  _PreAssessmentPageState createState() => _PreAssessmentPageState();
}

class _PreAssessmentPageState extends State<PreAssessmentPage> {
  var _currentStep = 0;
  var _colors = <Color>[
    Colors.pink.shade100,
    Colors.purple.shade100,
    Colors.blueAccent.shade100,
    Colors.blueGrey.shade100,
    Colors.orange.shade100,
    Colors.brown.shade100
  ];

  Widget _buildStepper(BuildContext context) {
    var _selfIdEvalNotifier =
        Provider.of<SelfIdentifyEvaluationNotifier>(context);

    return CustomStepper(
      type: CustomStepperType.horizontal,
      headerBackgroundColor: white,
      completeCircleBackgroundColor: green,
      editingCircleBackgroundColor: deep_green,
      editingIconColor: white,
      completeIconColor: white,
      currentStep: _currentStep,
      onStepTapped: (var step) => setState(() => _currentStep = step),
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        return ButtonBar(
          buttonHeight: 45.0,
          buttonMinWidth: 100.0,
          children: <Widget>[
            FlatButton(
              onPressed: _currentStep > 0
                  ? () => setState(() => _currentStep -= 1)
                  : null,
              color: grey,
              disabledTextColor: grey_light,
              hoverColor: Colors.grey.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text('BACK'),
            ),
            RaisedButton(
              onPressed: _currentStep < 5 &&
                      (_selfIdEvalNotifier.getLevel2Eval == 'PCT' ||
                          _selfIdEvalNotifier.getLevel3Eval != null)
                  ? () => setState(() => _currentStep += 1)
                  : null,
              hoverColor: deep_green,
              color: _currentStep != 5 ? deep_green_2 : Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(_currentStep != 5 ? 'NEXT' : 'SUBMIT'),
            ),
          ],
        );
      },
      steps: <CustomStep>[
        CustomStep(
          isActive: _currentStep >= 0,
          state: _currentStep == 0
              ? CustomStepState.editing
              : _currentStep > 0
                  ? CustomStepState.complete
                  : CustomStepState.disabled,
          title: Text('Self-Identify'),
          content: StepperBodyContainer(
            child: SelfIdentifyStep(),
          ),
        ),
        CustomStep(
          isActive: _currentStep >= 1,
          state: _currentStep == 1
              ? CustomStepState.editing
              : _currentStep > 1
                  ? CustomStepState.complete
                  : CustomStepState.disabled,
          title: Text('Pre-Assess\nEligibility'),
          content: StepperBodyContainer(
            child: PreAssessEligibilityStep(
              evalMatrix: _selfIdEvalNotifier.getLevel1Eval,
              level2Eval: _selfIdEvalNotifier.getLevel2Eval,
              level3Eval: _selfIdEvalNotifier.getLevel3Eval,
            ),
          ),
        ),
        CustomStep(
          isActive: _currentStep >= 2,
          state: _currentStep == 2
              ? CustomStepState.editing
              : _currentStep > 2
                  ? CustomStepState.complete
                  : CustomStepState.disabled,
          title: Text('Digital\nChecklist'),
          content: StepperBodyContainer(
            child: DigitalChecklistStep(),
          ),
        ),
        CustomStep(
          isActive: _currentStep >= 3,
          state: _currentStep == 3
              ? CustomStepState.editing
              : _currentStep > 3
                  ? CustomStepState.complete
                  : CustomStepState.disabled,
          title: Text('Additional\nQuestions'),
          content: StepperBodyContainer(
            child: AdditionalQuestionsStep(),
          ),
        ),
        CustomStep(
          isActive: _currentStep >= 4,
          state: _currentStep == 4
              ? CustomStepState.editing
              : _currentStep > 4
                  ? CustomStepState.complete
                  : CustomStepState.disabled,
          title: Text('Upload\nDocuments'),
          content: StepperBodyContainer(
            child: UploadDocumentsStep(),
          ),
        ),
        CustomStep(
          isActive: _currentStep >= 5,
          state: _currentStep == 5
              ? CustomStepState.editing
              : _currentStep > 5
                  ? CustomStepState.complete
                  : CustomStepState.disabled,
          title: Text('Sign\nAgreement'),
          content: StepperBodyContainer(
            child: SignAgreementStep(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        width: getScreenWidth(context) / 1.2,
        padding: const EdgeInsets.all(15.0),
        child: _buildStepper(context),
      ),
    );
  }
}

///==========================================================================
///                           SUPPORTING WIDGETS
///==========================================================================

class StepperBodyContainer extends StatelessWidget {
  final Widget child;

  const StepperBodyContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
