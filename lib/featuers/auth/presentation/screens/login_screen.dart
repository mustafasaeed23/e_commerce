// ignore_for_file: unused_field

import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/utils/validator.dart';
import 'package:e_commerce/core/widgets/default_eleveted_button.dart';
import 'package:e_commerce/core/widgets/default_text_form_field.dart';
import 'package:e_commerce/featuers/auth/Data/models/login_request.dart';
import 'package:e_commerce/featuers/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/featuers/auth/presentation/cubit/auth_state.dart';
import 'package:e_commerce/featuers/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce/featuers/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  final _authCubit = serviceLocator.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 91, bottom: 87, left: 97, right: 97),
                child: Image.asset("assets/images/logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Welcome Back To Route",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 24),
                    ),
                    Text(
                      "Please sign in with your email",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Email",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            DefaultTextFormField(
                              hintText: 'Enter Your Email',
                              controller: _emailController,
                              validator: (value) {
                                if (!Validator.isEmail(value)) {
                                  return 'please enter valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Password",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            DefaultTextFormField(
                              hintText: 'Enter Your Password',
                              controller: _passwordController,
                              validator: (value) {
                                if (!Validator.isPassword(value)) {
                                  return 'please enter a vaild password';
                                }
                                return null;
                              },
                              isPassword: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 220),
                              child: Text(
                                "Forget Password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            BlocListener<AuthCubit, AuthState>(
                              bloc: _authCubit,
                              listener: (_, state) {
                                if (state is LoginLoding) {
                                  // show loading
                                  UiUtils.showLoading(context);
                                } else if (state is LoginSuccess) {
                                  UiUtils.hideLoading(context);
                                  Navigator.of(context)
                                      .pushNamed(HomeScreen.routeName);
                                } else if (state is LoginError) {
                                  // show error
                                  UiUtils.hideLoading(context);
                                  Navigator.of(context)
                                      .pushNamed(HomeScreen.routeName);
                                }
                              },
                              child: DefaultElevetedButton(
                                  onPressed: login, label: "Login"),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an Account? ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(RegisterScreen.routeName);
                                  },
                                  child: Text(
                                    "Create Account",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (_formkey.currentState?.validate() == true) {
      _authCubit.login(LoginRequest(
          email: _emailController.text, password: _passwordController.text));
    }
  }
}
