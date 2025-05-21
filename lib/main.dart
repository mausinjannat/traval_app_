import 'dart:async';
import 'package:flutter/material.dart';
import 'logIn.dart'; // Make sure this file exists
import 'Registration.dart'; // Unused in this file
import 'Home.dart'; // Not used yet

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

// ------------------ Splash Screen ------------------
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            "assets/images/logo.png", // Add your logo here
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

// ------------------ Onboarding Screen ------------------
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/main1.jpg",
      "title": "Life is short and the world is ",
      "highlight": "wide",
      "desc":
      "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
    },
    {
      "image": "assets/images/main2.jpg",
      "title": "It’s a big world out there go ",
      "highlight": "explore",
      "desc":
      "To get the best of your adventure you just need to leave and go where you like. We are waiting for you",
    },
    {
      "image": "assets/images/main4.jpg",
      "title": "People don’t take trips, trips take ",
      "highlight": "people",
      "desc":
      "To get the best of your adventure you just need to leave and go where you like. We are waiting for you",
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < onboardingData.length - 1) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      } else {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => logIn()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (_, index) {
          final item = onboardingData[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                item["image"]!,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: item["title"],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: item["highlight"],
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item["desc"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onboardingData.length, (i) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == i ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == i
                                ? Colors.white
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        _timer?.cancel(); // Cancel timer if button is pressed
                        if (_currentPage == onboardingData.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => logIn()),
                          );
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        _currentPage == onboardingData.length - 1
                            ? "Get Started"
                            : "Next",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
