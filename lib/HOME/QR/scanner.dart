import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class qr_scanner extends StatefulWidget {
  const qr_scanner({super.key});

  @override
  State<qr_scanner> createState() => _qr_scannerState();
}

class _qr_scannerState extends State<qr_scanner> {
  String? qrCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'QR Scanner',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),

        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: MobileScanner(
              onDetect: (capture) {
                final code = capture.barcodes.firstOrNull?.rawValue;
                if (code != null && code != qrCode) {
                  setState(() => qrCode = code);
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                qrCode != null ? 'QR Code: $qrCode' : 'Scan a QR code',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
