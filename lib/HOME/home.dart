import 'package:animate_do/animate_do.dart';
import 'package:bike/HOME/Drawer/Drawer.dart';
import 'package:bike/HOME/Drawer/firstraw.dart';
import 'package:bike/thread/dummy_thread.dart';
import 'package:bike/thread/thread_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer_page(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlidebarNoti(),
              SizedBox(height: 30),
              //!.......search bar.........................
              ZoomIn(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter vehicle number',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ZoomIn(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),

                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeInDown(
                          child: Text(
                            "Scan QR Code",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Quickly access rider info and notify their family in case of an emergency.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Lottie.asset('assets/homeicon.json', height: 350),
              //  SizedBox(height: 30),
              FadeInUp(
                duration: const Duration(milliseconds: 1600),
                child: SizedBox(
                  width: 150, // Makes the button expand horizontally
                  height: 50, // Increases the button height
                  child: ElevatedButton(
                    onPressed: () {
                      final newThread = ThreadModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        riderName: 'Tanvir Rahman',
                        numberPlate: 'DHAKA METRO-L 22-4567',
                        location: 'Dhanmondi 32',
                        post: '', // Provide an appropriate value for 'post'
                      );
                      threadList.add(newThread);
                      Navigator.pushNamed(context, '/scanner');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: const Color.fromARGB(255, 9, 220, 174),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Quick Scan',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16, // Slightly larger font
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Add other widgets below
            ],
          ),
        ),
      ),
    );
  }
}
