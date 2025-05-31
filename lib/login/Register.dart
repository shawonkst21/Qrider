import 'package:animate_do/animate_do.dart';
import 'package:bike/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? selectedBloodGroup;
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const SizedBox(height: 50),
              Lottie.asset('assets/icon.json', height: 150),

              //! Title
              Text(
                "HELLO THERE!",
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                  color: const Color.fromARGB(255, 9, 220, 174),
                ),
              ),

              //! Register Text
              Text(
                "Secure Your Ride In Minutes!",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromARGB(185, 43, 42, 42),
                ),
              ),

              const SizedBox(height: 50),
              //!personal information...........................................
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Icon(
                      FlutterIcons.person_outline_mdi,
                      color: const Color.fromARGB(255, 5, 0, 0),
                      size: 30,
                    ),
                    SizedBox(width: 5),

                    Text(
                      "personal Information:",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 98, 98, 98),
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              //! Animated name Field
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Full Name",
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              FadeInUp(
                duration: Duration(milliseconds: 900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: _buildDropdown(
                    hint: 'Select Blood Group',
                    value: selectedBloodGroup,
                    items: bloodGroups,
                    onChanged: (val) {
                      setState(() {
                        selectedBloodGroup = val;
                        //  _checkFormValidity();
                      });
                    },
                  ),
                ),
              ),
              //!............................................................................
              SizedBox(height: 20),
              //! bike information
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Icon(
                      FlutterIcons.motorbike_mco,
                      color: const Color.fromARGB(255, 5, 0, 0),
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Bike details:",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 98, 98, 98),
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              //! bike number plate
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Number Plate*",
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Bike Model (Optional)",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //!....................................................................................
              //! Guardian information
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Icon(
                      FlutterIcons.shield_account_mco,
                      color: const Color.fromARGB(255, 5, 0, 0),
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Guardian Information:",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 98, 98, 98),
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              //!guardina name
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "guardian Name",
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Emeergency Contact Number*",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Aditional number(1)",
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Aditional number(2)",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //!........................................................................
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Icon(
                      FlutterIcons.textbox_password_mco,
                      color: const Color.fromARGB(255, 5, 0, 0),
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Set password:",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 98, 98, 98),
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              //!guardina name
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "password",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 220, 174),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        //controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm password",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Animated Sign-up Button
                FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 9, 220, 174),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                      ),
                    ),
                    ),
                  ),
                  ),
                ),
                ),

              const SizedBox(height: 20),

              // Animated Login Text
              FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a member? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login Now",
                        style: TextStyle(
                          color: Color.fromARGB(255, 9, 220, 174),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FadeInUp(
                duration: const Duration(milliseconds: 2000),
                child: const Center(
                  child: Text(
                    '- OR SignUp with -',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              //! 3 icons for optional login
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
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDropdown({
  required String hint,
  required String? value,
  required List<String> items,
  required void Function(String?)? onChanged,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(color: const Color.fromARGB(255, 9, 220, 174)),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(hint),
        value: value,
        icon: Icon(Icons.arrow_drop_down, color: Colors.redAccent),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black87, fontSize: 16),
        onChanged: onChanged,
        items:
            items.map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(value: val, child: Text(val));
            }).toList(),
      ),
    ),
  );
}
