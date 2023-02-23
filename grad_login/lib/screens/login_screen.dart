// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/input_field.dart';
import '../providers/authService.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var isActive = false;
  var visible = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  bool isButtonActive() {
    isActive =
        nameController.text.isNotEmpty && passwordController.text.isNotEmpty
            ? true
            : false;
    setState(() {
      isActive;
    });
    return isActive;
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var mainTopPadding =
        AppBar().preferredSize.height + mediaQuery.size.height * 0.07;
    var errorMessage = Provider.of<AuthService>(context, listen: false).error;
    var appLocales = AppLocalizations.of(context)!;

    return !Provider.of<AuthService>(context).isRegister
        ? SafeArea(
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Padding(
                  padding: EdgeInsets.only(
                    top: mainTopPadding,
                    left: mediaQuery.size.width * 0.05,
                    right: mediaQuery.size.width * 0.05,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            appLocales.totalcare,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            appLocales.signin,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        InputField(
                          nameController: nameController,
                          labelText: appLocales.username,
                          isPassword: false,
                          prefixIcon: Icons.person,
                        ),
                        InputField(
                          nameController: passwordController,
                          labelText: appLocales.password,
                          isPassword: true,
                          prefixIcon: Icons.lock,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  appLocales.forgetpassword,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.9),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            fixedSize: Size(
                              mediaQuery.size.width * 0.85,
                              mediaQuery.size.height * 0.06,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              try {
                                Provider.of<AuthService>(context, listen: false)
                                    .login(nameController.text,
                                        passwordController.text, context);
                                print(errorMessage);
                              } catch (_) {
                                // if (errorMessage!.isNotEmpty) {
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(SnackBar(
                                //     content: Text(errorMessage),
                                //   ));
                                // }
                              }
                            }
                          },
                          // isButtonActive()
                          //     ?
                          //     : null,
                          child: Text(
                            appLocales.login,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 36,
                                    ),
                                  ),
                                ),
                                Text(
                                  appLocales.or,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 36,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                print('tap');
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                minimumSize: Size(
                                  mediaQuery.size.width * 0.85,
                                  mediaQuery.size.height * 0.06,
                                ),
                                side: BorderSide(
                                  width: 0.8,
                                  color: Colors.grey,
                                ),
                              ),
                              child: SizedBox(
                                width: mediaQuery.size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      appLocales.signinwithgoogle,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${appLocales.donthaveanaccount} ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Provider.of<AuthService>(context,
                                                listen: false)
                                            .isRegister = true;
                                      });
                                    },
                                    child: Text(
                                      appLocales.signup,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.9),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : RegisterFormScreen();
  }
}
