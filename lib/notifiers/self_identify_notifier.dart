import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelfIdentifyEvaluationNotifier extends ChangeNotifier {
  static const _kLevel1EvalPrefKey = 'LEVEL_1_EVAL';
  static const _kLevel2EvalPrefKey = 'LEVEL_2_EVAL';
  static const _kLevel3EvalPrefKey = 'LEVEL_3_EVAL';

  final SharedPreferences _pref;
  SelfIdentifyEvaluationNotifier(this._pref);

  /// ======================================================================
  ///                             GETTERS
  /// ======================================================================

  String get getLevel1Eval => _pref?.getString(_kLevel1EvalPrefKey) ?? null;
  String get getLevel2Eval => _pref?.getString(_kLevel2EvalPrefKey) ?? null;
  String get getLevel3Eval => _pref?.getString(_kLevel3EvalPrefKey) ?? null;

  /// ======================================================================
  ///                             SETTERS
  /// ======================================================================

  void setLevel1Eval(String val) {
    _pref?.setString(_kLevel1EvalPrefKey, val);
    notifyListeners();
  }

  void setLevel2Eval(String val) {
    _pref?.setString(_kLevel2EvalPrefKey, val);
    notifyListeners();
  }

  void setLevel3Eval(String val) {
    _pref?.setString(_kLevel3EvalPrefKey, val);
    notifyListeners();
  }

  /// ======================================================================
  ///                             CLEAR
  /// ======================================================================

  Future<bool> clearLevelEvalPrefs() {
    var response = _pref?.clear();
    notifyListeners();
    return response;
  }
}
