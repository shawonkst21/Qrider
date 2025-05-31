import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Lottie.asset('assets/icon.json', height: 250),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 9, 220, 174),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Welcome Back!',
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 30),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      //controller: _emailController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 0,
                        ),
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 9, 220, 174),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        bool obscureText = true;
                        return TextField(
                          //controller: _emailController,
                          obscureText: obscureText,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 0,
                            ),
                            border: InputBorder.none,
                            hintText: "password",
                            prefixIcon: const Icon(
                              FlutterIcons.lock1_ant,
                              color: Color.fromARGB(255, 9, 220, 174),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    // ignore: dead_code
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1400),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              //const SizedBox(height: 5),
              FadeInUp(
                duration: const Duration(milliseconds: 1600),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 9, 220, 174),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FadeInUp(
                duration: const Duration(milliseconds: 1800),
                child: Center(
                  child: Text(
                    '- OR Continue with -',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 2000),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FlutterIcons.google_ant),
                        color: Colors.red,
                        iconSize: 28,
                        splashRadius: 24,
                      ),
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 2100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FlutterIcons.apple_faw),
                        color: Colors.black,
                        iconSize: 28,
                        splashRadius: 24,
                      ),
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 2200),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FlutterIcons.facebook_faw),
                        color: Colors.blue,
                        iconSize: 28,
                        splashRadius: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              FadeInUp(
                duration: const Duration(milliseconds: 2200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create an Account',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Register',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 9, 220, 174),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
