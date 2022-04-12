import 'package:first_app/controller/auth_controller.dart';
import 'package:first_app/screens/home_page.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/utills/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/text_field.dart';
import '../controller/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _nameController.dispose();
  }

  void signUpUser() async {
    String res = await auth_Controller().signupUser(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      phone: _phoneNumberController.text,
    );

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                const SizedBox(height: 44),
                // field input for uplooad profile picture from gallery
                Stack(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage("https://picsum.photos/200/300"),
                    ),
                    Positioned(
                        bottom: -10,
                        left: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_a_photo),
                        ))
                  ],
                ),
                const SizedBox(height: 30),

                TextFieldInput(
                  hintText: "Enter your name",
                  textInputType: TextInputType.text,
                  textEditingController: _nameController,
                ),
                const SizedBox(height: 30),
                TextFieldInput(
                  hintText: "Enter your Email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                ),
                const SizedBox(height: 30),
                TextFieldInput(
                  hintText: "Enter your Number",
                  textInputType: TextInputType.number,
                  textEditingController: _phoneNumberController,
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
                    child: const Text("Signup"),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onTap: signUpUser,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Already have an account?"),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: Container(
                        child: const Text(
                          "Login",
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
      ),
    );
    ;
  }
}
