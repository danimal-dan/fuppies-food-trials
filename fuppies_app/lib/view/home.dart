import 'package:flutter/material.dart';
import 'log_food_page.dart';
import '../http/auth_credential_provider.dart';
import '/widget/api_auth_token_dialog.dart';

class FuppiesHome extends StatefulWidget {
  static final navKey = GlobalKey<NavigatorState>();

  const FuppiesHome({Key? navKey, required this.title}) : super(key: navKey);

  final String title;

  @override
  State<FuppiesHome> createState() => _FuppiesHomeState();
}

class _FuppiesHomeState extends State<FuppiesHome> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await _promptForApiTokenIfNotPresent(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogFoodPage()),
                );
              },
              child: const Text('Log Food'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                debugPrint('pressed Log Symptom');
              },
              child: const Text('Log Symptom'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                debugPrint('pressed Add Safe Food');
              },
              child: const Text('Add Safe Food'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                AuthCredentialProvider.reset();
                _promptForApiTokenIfNotPresent(context, force: true);
              },
              child: const Text('Reset API Token'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _promptForApiTokenIfNotPresent(BuildContext context,
      {bool force = false}) async {
    if (!force && await AuthCredentialProvider.hasToken()) {
      debugPrint("does have token");
      return;
    }

    return await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const ApiAuthTokenDialog();
        });
  }
}
