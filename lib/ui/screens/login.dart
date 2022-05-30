import 'package:clone_netflix/ui/screens/home_page.dart';
import 'package:clone_netflix/ui/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/constants.dart';
import '../widgets/bg.dart';
import '../widgets/button.dart';
import '../widgets/or.dart';
import '../widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Bg(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              SizedBox(height: 30),
              Image.asset(
                "assets/icons/logo.png",
                width: 250,
              ),
              SizedBox(height: 25),
              Text(
                "Login",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 25),
              NTextField(
                label: "Email",
                hint: "Email address",
              ),
              SizedBox(height: 17),
              NTextField(
                label: "Password",
                hint: "Password",
                isPassword: true,
              ),
              SizedBox(height: 17),
              Row(
                children: [
                  Expanded(
                    child: Row(children: [
                      CupertinoSwitch(
                        thumbColor: Colors.white,
                        trackColor: ksiGreyColorColor,
                        value: rememberMe,
                        onChanged: (value) {
                          rememberMe = value;
                          setState(() {});
                        },
                        activeColor: ksiPrimaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Remember me",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(.46),
                          fontSize: 13,
                        ),
                      )
                    ]),
                  ),
                  Text(
                    "forgot password?",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(.46),
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              SizedBox(height: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NButton(
                    title: "Login",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Or(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/icons/g.png",
                  ),
                  Image.asset(
                    "assets/icons/a.png",
                  ),
                  Image.asset(
                    "assets/icons/f.png",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don’t have an account?",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      "sign up",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: ksiPrimaryColor,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
