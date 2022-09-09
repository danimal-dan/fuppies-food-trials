import 'package:flutter/material.dart';
import '/http/api_auth_provider.dart';
import '/http/auth_controller.dart';

class ApiAuthTokenDialog extends StatefulWidget {
  const ApiAuthTokenDialog({Key? key}) : super(key: key);

  @override
  State<ApiAuthTokenDialog> createState() => _ApiAuthTokenDialogState();
}

class _ApiAuthTokenDialogState extends State<ApiAuthTokenDialog> {
  String apiKeyValue = "";
  bool? tokenIsValid;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Enter API password'),
      children: <Widget>[
        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an API key';
                    }

                    if (tokenIsValid == false) {
                      return 'Token is not valid';
                    }

                    return null;
                  },
                  onChanged: (String? value) {
                    setState(() {
                      apiKeyValue = value ?? "";
                    });

                    _formKey.currentState?.validate();
                  },
                ))),
        SimpleDialogOption(
          onPressed: () async {
            await ApiAuthProvider.setToken(apiKeyValue);
            final valid = await AuthController().validateAuthToken();

            if (!valid) {
              await ApiAuthProvider.reset();
            }

            setState(() {
              tokenIsValid = valid;
            });
            _formKey.currentState?.validate();

            if (!mounted || !valid) {
              return;
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.green.shade800,
                  content: const Text('Token is valid!')),
            );

            Navigator.pop(context);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
