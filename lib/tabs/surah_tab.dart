import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/global.dart';
import 'package:flutter_application/models/surah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Welcome>> _getSurahList() async {
    String data = await rootBundle.loadString("assets/data/surah.json");
    return welcomeFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Welcome>>(
        future: _getSurahList(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: ((context, index) =>
                  _surahItem(surah: snapshot.data!.elementAt(index))),
              separatorBuilder: ((context, index) => Container()),
              itemCount: snapshot.data!.length);
        }));
  }

  Widget _surahItem({required Welcome surah}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Row(
      children: [
        Stack(
          children: [
            SvgPicture.asset("assets/svgs/number.svg"),
            SizedBox(
              height: 36,
              width: 36,
              child: Center(
                child: Text(
                  "${surah.nomor}",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${surah.namaLatin}",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),
              ),
              Row(
                children: [
                  Text(
                    "${surah.tempatTurun.name}",
                    style: GoogleFonts.poppins(
                      color: text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: text
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${surah.jumlahAyat}",
                    style: GoogleFonts.poppins(
                      color: text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Text(
          "${surah.nama}",
          style: GoogleFonts.poppins(
            color: primary,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    ),
  );
}
