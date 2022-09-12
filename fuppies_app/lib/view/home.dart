import 'package:flutter/material.dart';
import 'package:fuppies_app/util/snack_bar_util.dart';
import 'package:fuppies_app/widget/default_elevated_button.dart';
import 'package:fuppies_app/widget/ui_constants.dart' as constants;
import 'login.dart';
import 'log_food_page.dart';
import '../http/auth_credential_provider.dart';

class FuppiesHome extends StatefulWidget {
  static final navKey = GlobalKey<NavigatorState>();

  const FuppiesHome({Key? navKey}) : super(key: navKey);

  @override
  State<FuppiesHome> createState() => _FuppiesHomeState();
}

class _FuppiesHomeState extends State<FuppiesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FPIES Food Trials'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DefaultElevatedButton(
              child: const Text('Log Food'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogFoodPage()),
                );
              },
            ),
            constants.defaultVerticalSpacer,
            DefaultElevatedButton(
              child: const Text('Log Symptom'),
              onPressed: () {
                SnackBarUtil.showInfo(
                    context, 'Log Symptom has not yet been implemented');
              },
            ),
            constants.defaultVerticalSpacer,
            DefaultElevatedButton(
              child: const Text('Add Safe Food'),
              onPressed: () {
                SnackBarUtil.showInfo(
                    context, 'Add Safe Food has not yet been implemented');
              },
            ),
            constants.defaultVerticalSpacer,
            DefaultElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    AuthCredentialProvider.reset();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
    SnackBarUtil.showSuccess(context, "You have been logged out.");
  }
}
