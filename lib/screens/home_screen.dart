import 'package:flutter/material.dart';
import 'package:flutter_application/global.dart';
import 'package:flutter_application/tabs/hijb_tab.dart';
import 'package:flutter_application/tabs/page_tab.dart';
import 'package:flutter_application/tabs/para_tab.dart';
import 'package:flutter_application/tabs/surah_tab.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24
          ),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _greeting(),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: background,
                automaticallyImplyLeading: false,
                shape: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: const Color(0xFFAAAAAA).withOpacity(.1)
                  )
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: _tabBar(),
                ),
              )
            ],
            body: const TabBarView(
              children: [
                SurahTab(),
                ParaTab(),
                PageTab(),
                HijbTab()
              ],
            )
          ),
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
    backgroundColor: background,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(
          onPressed: (() => {}), 
          icon: SvgPicture.asset("assets/svgs/hamber.svg")
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          "Quran App",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: (() => {}), 
          icon: SvgPicture.asset("assets/svgs/search.svg")
        ),
      ],
    ),
  );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: gray,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/svgs/quran.svg"), label: ""),
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/svgs/lamp.svg"), label: ""),
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/svgs/human.svg"), label: ""),
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/svgs/pray.svg"), label: ""),
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/svgs/save.svg"), label: ""),
    ],
  );

  TabBar _tabBar() {
    return TabBar(
      unselectedLabelColor: text,
      labelColor: Colors.white,
      indicatorColor: primary,
      indicatorWeight: 3,
      tabs: [
        _tab(label: "Surah"), 
        _tab(label: "Para"),
        _tab(label: "Page"),
        _tab(label: "Hijb")
      ]
    );
  }

  Tab _tab({required String label}) => 
    Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 16
        ),
      )
    );

  Column _greeting() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assalamualaikum",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: text
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Ahd. Yuda Zaki Yamani",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
             const SizedBox(
              height: 24,
            ),
            Stack(
              children: [
                Container(
                  height: 131,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), 
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0, .6, 1],
                      colors: [
                        Color(0xFFDF98FA),
                        Color(0xFFB070FD),
                        Color(0xFF9055FF)
                      ]
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 0,
                  child: SvgPicture.asset("assets/svgs/quran-lg.svg")
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svgs/mini-quran.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Last Read",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Al Fatihah",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Ayah No: 1",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        );
  }
}