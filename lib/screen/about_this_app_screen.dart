import 'package:collection/collection.dart';
import 'package:eat_go/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutThisAppScreen extends StatefulWidget {
  const AboutThisAppScreen({super.key});

  @override
  State<AboutThisAppScreen> createState() => _AboutThisAppScreenState();
}

class _AboutThisAppScreenState extends State<AboutThisAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ABOUT THIS APP',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            30,
            30,
            30,
            30,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: EatGoPalette.lineColor,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.favorite, color: pointColor),
                  ],
                ),
                ...buildSupporterLine(),
                const Divider(
                  thickness: 1,
                  height: 50,
                ),
                const Text(
                  'License:\n'
                  'Pizza Icons made by lapiyee from Flaticon.\n'
                  'Restaurant Icons made by Freepik from Flaticon.\n'
                  'Pin Icons made by Templarian, icons8 from iconduck.\n'
                  'Pretendard font made by orioncactus.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Row> buildSupporterLine() {
    final supporters = [
      '꿍까',
      'Jinny',
    ];
    final List<Row> supporterLine = [];
    supporters.forEachIndexed((index, supporter) {
      supporterLine.add(
        Row(
          children: [
            Text('${index + 1}. '),
            Expanded(
              child: Text(supporter),
            ),
          ],
        ),
      );
    });

    return supporterLine;
  }
}
