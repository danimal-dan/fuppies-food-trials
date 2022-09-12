import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '/http/auth_controller.dart';
import '/http/auth_credential_provider.dart';
import '../util/snack_bar_util.dart';
import '/widget/default_elevated_button.dart';
import '/widget/default_page_container.dart';
import '/widget/ui_constants.dart' as constants;
import 'home.dart';

class LoginPage extends StatefulWidget {
  static final navKey = GlobalKey<NavigatorState>();

  const LoginPage({Key? navKey}) : super(key: navKey);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = '';

  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: LoaderOverlay(
          child: DefaultPageContainer(
              child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          onChanged: (value) => setState(() {
                            _username = value;
                          }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Username',
                            contentPadding: EdgeInsets.all(0.0),
                          ),
                        ),
                        constants.defaultVerticalSpacer,
                        TextFormField(
                          obscureText: true,
                          onChanged: (value) => setState(() {
                            _password = value;
                          }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password',
                            contentPadding: EdgeInsets.all(0.0),
                          ),
                        ),
                        constants.defaultVerticalSpacer,
                        DefaultElevatedButton(
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            context.loaderOverlay.show();

                            await AuthCredentialProvider.setCredentials(
                                _username, _password);

                            bool valid = false;
                            try {
                              valid =
                                  await AuthController().validateAuthToken();
                            } catch (e) {
                              debugPrintStack(
                                  label:
                                      'An error occurred while validating auth credentials $e');

                              if (mounted) {
                                SnackBarUtil.showError(context,
                                    'An error occurred during authentication, please try again.');
                              }

                              return;
                            } finally {
                              if (!valid) {
                                await AuthCredentialProvider.reset();
                              }

                              context.loaderOverlay.hide();
                            }

                            if (mounted) {
                              if (!valid) {
                                SnackBarUtil.showError(context,
                                    'Username and password are not correct, please try again.');
                              } else {
                                SnackBarUtil.showSuccess(context, 'Success!');

                                _goToHome(context);
                              }
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  )))),
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FuppiesHome()),
    );
  }
}
