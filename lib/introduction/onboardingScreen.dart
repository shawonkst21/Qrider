import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Register Your Bike",
      "description":
          "Easily register your bike and create a progile linked to your number plate",
      "image": "assets/BIKE.json",
    },
    {
      "title": "QR Code Sticker",
      "description":
          "Generate a QR code for your bike so anyone can scan and contact your family if something goes worng",
      "image": "assets/QR.json",
    },
    {
      "title": "Emergency Alerts",
      "description":
          "In case of an accident, the app can notify nearby hospitals,ambulances and police stations",
      "image": "assets/emergency.json",
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  image: _onboardingData[index]["image"]!,
                  title: _onboardingData[index]["title"]!,
                  description: _onboardingData[index]["description"]!,
                  index: index,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(_onboardingData.length - 1);
                  },
                  child: Text(
                    "Skip",
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    _onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8.0,
                      width: _currentPage == index ? 20.0 : 8.0,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index
                                ? const Color.fromARGB(255, 9, 220, 174)
                                : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 220, 174),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    elevation: 3,
                  ),
                  onPressed: () {
                    if (_currentPage < _onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Navigate to the next screen (e.g., login or home)
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                  child: Text(
                    _currentPage == _onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int index;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    double imageSize = (index == 1) ? 380 : 330;
    double temp = (index == 1) ? 0 : 15;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image.endsWith('.json')
              ? Lottie.asset(image, height: imageSize, fit: BoxFit.contain)
              : Image.asset(image, height: imageSize - 80, fit: BoxFit.contain),
          SizedBox(height: temp),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 70, // Adjust height as needed
            child: DefaultTextStyle(
              textAlign: TextAlign.center, // Ensures text alignment
              style: GoogleFonts.poppins(
                fontSize: 16.0,
                color: Colors.grey.shade700,
              ),
              child: Center(
                // Centers the AnimatedTextKit widget
                child: AnimatedTextKit(
                  repeatForever: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      description,
                      textAlign: TextAlign.center, // Center the text
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
