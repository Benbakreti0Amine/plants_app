import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plants_project/constants.dart';
import 'package:plants_project/root_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/signin.png"),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "Signin",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 14,),
            TextFieldWidget(
              controller: emailController,
              icon: Icons.alternate_email,
              text: 'Enter your email',
              obscure: false,
            ),
            TextFieldWidget(
              controller: passwordController,
              icon: Icons.lock,
              text: 'Enter your password',
              obscure: true,
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child: RootPage(), type: PageTransitionType.fade));
              },
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Constants.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String text;
  final bool obscure;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.icon,
    required this.text,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Constants.blackColor.withOpacity(.7),
      ),
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Constants.blackColor.withOpacity(.3),
        ),
        hintText: text,
        border: InputBorder.none,
      ),
      cursorColor: Constants.primaryColor.withOpacity(.3),
    );
  }
}
