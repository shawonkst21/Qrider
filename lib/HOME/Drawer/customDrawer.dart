import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class CustomDrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Duration animationDelay;

  const CustomDrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = const Color(0xFF09DCAE),
    this.animationDelay = const Duration(milliseconds: 0),
  });

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
      duration: Duration(milliseconds: 900),
      delay: animationDelay,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }
}
