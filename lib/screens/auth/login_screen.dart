import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../database/auth_methods.dart';
import '../../utilities/custom_validators.dart';
import '../../widgets/custom_widgets/custom_elevated_button.dart';
import '../../widgets/custom_widgets/custom_textformfield.dart';
import '../../widgets/custom_widgets/password_textformfield.dart';
import '../../widgets/custom_widgets/show_loading.dart';
import '../dashboard/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  CustomTextFormField(
                    controller: _email,
                    hint: 'example@gmail.com',
                    autoFocus: true,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) => CustomValidator.email(value),
                  ),
                  PasswordTextFormField(controller: _pass),
                  const SizedBox(height: 10),
                  isLoading
                      ? const ShowLoading()
                      : SizedBox(
                          width: 280,
                          child: CustomElevatedButton(
                            title: 'Login',
                            onTap: () async {
                              if (_key.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                final User? user = await AuthMethods()
                                    .loginWithEmailAndPassword(
                                  _email.text.trim(),
                                  _pass.text.trim(),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                                if (user == null) return;
                                if (!mounted) return;
                                GoRouter.of(context).go(Dashboard.routeName);
                              }
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
