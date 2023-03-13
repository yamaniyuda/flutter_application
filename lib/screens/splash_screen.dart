import 'package:flutter/material.dart';
import 'package:flutter_application/global.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Quran App",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Learn Quran and \n Recite once everyday",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: text,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 450,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF672CBC),
                          ),
                          child: SvgPicture.asset("assets/svgs/splash.svg"),
                        ),
                        Positioned(
                          left: 0,
                          bottom: -23,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                            },
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 40),
                                decoration: BoxDecoration(
                                    color: orange,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text("Get Started",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    )),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
