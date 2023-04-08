import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            focusField.unfocus();
            FocusScope.of(context).requestFocus(FocusNode());
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: const Body()),
    );
  }
}
