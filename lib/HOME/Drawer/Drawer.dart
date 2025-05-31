import 'package:animate_do/animate_do.dart';
import 'package:bike/HOME/Drawer/customDrawer.dart';
import 'package:bike/login/logout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_flutter/icons_flutter.dart';

class Drawer_page extends StatefulWidget {
  const Drawer_page({super.key});

  @override
  State<Drawer_page> createState() => _Drawer_pageState();
}

class _Drawer_pageState extends State<Drawer_page> {
  bool isNotificationOn = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 26, 28, 41),
                  Colors.blueGrey.shade700,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.edit, color: Colors.indigo, size: 10),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Text(
                  'Sadman Sahwon',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 246, 246, 247),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'plate no:16-122-33',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Features",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 8),
          //!...............list title.....................................
          CustomDrawerTile(
            icon: FlutterIcons.edit_fea,
            title: "Edit Profile",
            onTap: () {
              // Do something
            },
            animationDelay: Duration(milliseconds: 000),
          ),
          SizedBox(height: 2),
          CustomDrawerTile(
            icon: FlutterIcons.qrcode_ant,
            title: "Generate QR Code",
            onTap: () {
              // Do something
            },
            animationDelay: Duration(milliseconds: 000),
          ),
          SizedBox(height: 2),
          CustomDrawerTile(
            icon: FlutterIcons.group_faw,
            title: "Community",
            onTap: () {
              Navigator.pushNamed(context, '/community');
            },
            animationDelay: Duration(milliseconds: 000),
          ),
          SizedBox(height: 2),
          CustomDrawerTile(
            icon: FlutterIcons.near_me_mco,
            title: "Nearby ",
            onTap: () {
              // Do something
            },
            animationDelay: Duration(milliseconds: 000),
          ),
          SizedBox(height: 2),
          CustomDrawerTile(
            icon: FlutterIcons.bike_mco,
            title: "Temporary rider",
            onTap: () {
              // Do something
            },
            animationDelay: Duration(milliseconds: 000),
          ),
          SizedBox(height: 2),
          CustomDrawerTile(
            icon: FlutterIcons.language_faw,
            title: "Select Language",
            onTap: () {
              // Do something
            },
            animationDelay: Duration(milliseconds: 000),
          ),
          SizedBox(height: 2),
          //!notification on of.....................
          BounceInLeft(
            duration: Duration(milliseconds: 1000),
            child: InkWell(
              onTap: () {
                setState(() {
                  isNotificationOn = !isNotificationOn;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Icon(
                      FlutterIcons.notifications_mdi,
                      color: Color(0xFF09DCAE),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Notifications',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Switch(
                      value: isNotificationOn,
                      activeColor: Color(0xFF09DCAE),
                      onChanged: (bool value) {
                        setState(() {
                          isNotificationOn = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 1200),
            child: Center(
              child: SizedBox(
                width: 100, // Makes the button expand horizontally
                height: 40, // Increases the button height
                child: ElevatedButton(
                  onPressed: () {
                    LogoutDialogBox.show(context, () {
                      // TODO: Add logout logic here (e.g., clear user session)
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    });
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xFFF44336),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  child: Text(
                    'Log Out',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14, // Slightly larger font
                      fontWeight: FontWeight.bold,
                    ),
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
