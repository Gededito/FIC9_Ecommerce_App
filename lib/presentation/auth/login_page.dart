import 'package:fic9_ecommerce_app/common/components/space.dart';
import 'package:fic9_ecommerce_app/common/constants/colors.dart';
import 'package:fic9_ecommerce_app/common/constants/images.dart';
import 'package:fic9_ecommerce_app/data/datasource/auth_local_datasource.dart';
import 'package:fic9_ecommerce_app/data/model/requests/login_request_model.dart';
import 'package:fic9_ecommerce_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:fic9_ecommerce_app/presentation/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/button.dart';
import '../../common/components/custom_text_field.dart';
import '../dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(80.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130.0),
            child: Image.asset(
              Images.logo,
              width: 100,
              height: 100,
            ),
          ),
          const SpaceHeight(24.0),
          const Center(
            child: Text(
              'E-Commerce Code With Gde Dito',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorName.dark,
              ),
            ),
          ),
          const SpaceHeight(8.0),
          const Center(
            child: Text(
              'Masuk untuk melanjutkan',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorName.grey,
              ),
            ),
          ),
          const SpaceHeight(40.0),
          CustomTextField(
            controller: emailController,
            label: 'Email',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data) async {
                  // Menyimpan data di Local
                  AuthLocalDatasource().saveAuthData(data);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Berhasil Login"),
                      backgroundColor: Colors.green));
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return Button.filled(
                color: ColorName.blue,
                onPressed: () {
                  final data = LoginRequestModel(
                      identifier: emailController.text,
                      password: passwordController.text);
                  context.read<LoginBloc>().add(LoginEvent.login(data));
                },
                label: 'Masuk',
              );
            },
          ),
          const SpaceHeight(122.0),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: "Belum punya akun? ",
                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(color: ColorName.primary),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorName.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
