import 'package:flutter/material.dart';
import 'package:fsc_cert/defaults.dart';
import 'package:fsc_cert/pages/pre_assess_page.dart';
import 'package:fsc_cert/style.dart';
import 'package:fsc_cert/utils.dart';
import 'package:fsc_cert/widgets/fsc_app_bar.dart';

class WebLayout extends StatefulWidget {
  @override
  _WebLayoutState createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue_grey,
      body: Row(
        children: <Widget>[
          NavigationRail(
            extended: true,
            backgroundColor: deep_green,
            minExtendedWidth: getScreenWidth(context) / 7,
            selectedIndex: _selectedIndex,
            selectedLabelTextStyle:
                Theme.of(context).textTheme.subtitle2.copyWith(color: white),
            unselectedLabelTextStyle: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: Colors.white38),
            selectedIconTheme: IconThemeData(color: white, size: 25.0),
            unselectedIconTheme:
                IconThemeData(color: Colors.white38, size: 20.0),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            leading: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: Image.asset(
                kAppIconWhite,
                width: 15.0,
              ),
            ),
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.assessment),
                label: Text('Company\nPre-Assessment'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.verified_user),
                label: Text('Remote Audit\nQualification'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.find_in_page),
                label: Text('Remote Auditing\n & Certification'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              children: [
                FscAppBar(),
                PreAssessmentPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
