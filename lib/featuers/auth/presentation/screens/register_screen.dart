// ignore_for_file: unused_field

import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/utils/validator.dart';
import 'package:e_commerce/core/widgets/default_eleveted_button.dart';
import 'package:e_commerce/core/widgets/default_text_form_field.dart';
import 'package:e_commerce/featuers/auth/Data/models/register_request.dart';
import 'package:e_commerce/featuers/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/featuers/auth/presentation/cubit/auth_state.dart';
import 'package:e_commerce/featuers/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName = '/register';

  final _userNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  final _authCubit = serviceLocator.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 91, bottom: 87, left: 97, right: 97),
                  child: Image.asset("assets/images/logo.png"),
                ),
                Text(
                  "User Name",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 24,
                ),
                DefaultTextFormField(
                  hintText: "Enter your Name",
                  controller: _userNameController,
                  validator: (value) {
                    if (!Validator.hasMinLength(value)) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Mobile No",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 24,
                ),
                DefaultTextFormField(
                  hintText: "Enter your Mobile Number",
                  controller: _mobileNumberController,
                  validator: (value) {
                    if (!Validator.isEGPhoneNumber(value)) {
                      return "Please enter valid egyptian number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  hintText: "Enter your Email",
                  controller: _emailController,
                  validator: (value) {
                    if (!Validator.isEmail(value)) {
                      return "please enter valid email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
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
                  hintText: "Enter your Password",
                  controller: _passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (!Validator.isPassword(value)) {
                      return "please enter valid password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 55,
                ),
                BlocListener<AuthCubit, AuthState>(
                  bloc: _authCubit,
                  listener: (_, state) {
                    if (state is RegisterLoding) {
                      // show loading
                      UiUtils.showLoading(context);
                    } else if (state is RegisterSuccess) {
                      // navigate to home
                      UiUtils.hideLoading(context);
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    } else if (state is RegisterError) {
                      // show error
                      UiUtils.hideLoading(context);
                      UiUtils.showMessage(state.message);
                    }
                  },
                  child: DefaultElevetedButton(
                      onPressed: register, label: "Sign up"),
                ),
                const SizedBox(
                  height: 55,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (_formkey.currentState?.validate() == true) {
      _authCubit.register(RegisterRequest(
          email: _emailController.text,
          password: _passwordController.text,
          name: _userNameController.text,
          phone: _mobileNumberController.text));
    }
  }
}
