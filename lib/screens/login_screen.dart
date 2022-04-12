import 'package:first_app/screens/signup_screen.dart';
import 'package:first_app/utills/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Widget build(BuildContext context) {
    //when we used const , then we cannot use Container , before using container , always remove the const from return
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          //giving the full with of the screen , mobile view and as well as desktop view using double.infinity function
          width: double.infinity,
          child: Column(
            //to center the crossAxisAlignment
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //login scrren logo
              const SizedBox(height: 30),
              SvgPicture.asset(
                "assests/insta.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              TextFieldInput(
                hintText: "Enter your Email",
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 30),
              TextFieldInput(
                hintText: "Enter your Password",
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 30),
              InkWell(
                child: Container(
                  child: const Text("Login"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  )
                ],
              )

              //text field for email
              //password filed for password
              //then login button
              //forgot password/signup link
            ],
          ),
        ),
      ),
    );
  }
}
