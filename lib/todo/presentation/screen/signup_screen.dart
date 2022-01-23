import 'package:block_sample/todo/logic/cubic/auth_cubit.dart';
import 'package:block_sample/todo/presentation/screen/todo_screen.dart';
import 'package:block_sample/todo/presentation/widget/custom_textfield.dart';
import 'package:block_sample/todo/presentation/widget/customer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050406),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailed) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
              if (state is LoginSuccess) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (builder) => TodoScreen()));
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Let\'s create account.',
                    style: GoogleFonts.anaheim(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                Text('Welcome back.',
                    style:
                        GoogleFonts.anaheim(fontSize: 25, color: Colors.white)),
                Text('you\'ve been missed.',
                    style:
                        GoogleFonts.anaheim(fontSize: 25, color: Colors.white)),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                    child: Column(
                  children: [
                    CustomTextField(
                      hint: 'Name',
                      controller: nameController,
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      hint: 'Email',
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      hint: 'Age',
                      controller: ageController,
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      hint: 'Password',
                      isObscure: true,
                    ),
                  ],
                )),
                Text('Already have an account? SingIn',
                    style:
                        GoogleFonts.poppins(fontSize: 17, color: Colors.white)),
                const SizedBox(
                  height: 20,
                ),
                _loginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _loginButton() {
    return Builder(builder: (context) {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
                child:  CircularProgressIndicator(
              color: Colors.white,
            ));
          }
          return CustomButton(
            backgroundColor: Colors.white,
            title: "Sign Up",
            onPress: () {
              if (nameController.text.isEmpty) {
              } else if (emailController.text.isEmpty) {
              } else if (ageController.text.isEmpty) {
              } else if (passwordController.text.isEmpty) {
              } else {
                context.read<AuthCubit>().registerUser(
                    emailController.text.toString(),
                    passwordController.text.toString(),
                    nameController.text.toString(),
                    int.parse(ageController.text.toString()));
              }
            },
          );
        },
      );
    });
  }
}
