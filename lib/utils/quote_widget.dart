import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({super.key});

  @override
  State<QuoteWidget> createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  final String quoteURL = "https://api.quotable.io/random?maxLength=50";
  String quote = 'life is about timing';
  String author = 'carl lewis';
  bool changeColor = true;
  @override
  void initState() {
    super.initState();
    generateQuote();
  }

  generateQuote() async {
    var res = await http.get(Uri.parse(quoteURL));
    var result = jsonDecode(res.body);
    setState(() {
      quote = result["content"];
      author = result["author"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\u275D ' "QUOTE : [",
            style: GoogleFonts.ptSansNarrow(color: Colors.white, fontSize: 16),
          ),
          // ${quote.toUpperCase()}]
          Text(
            quote.toUpperCase(),
            style: GoogleFonts.ptSansNarrow(color: Colors.white, fontSize: 16),
          ),
          Text(
            "    ~ ${author.toUpperCase()}",
            style: GoogleFonts.ptSansNarrow(color: Colors.white, fontSize: 16),
          ),
          Text(
            "],",
            style: GoogleFonts.ptSansNarrow(color: Colors.white, fontSize: 16),
          ),

          Row(
            children: [
              Text(
                "RELOAD : [",
                style:
                    GoogleFonts.ptSansNarrow(color: Colors.white, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  generateQuote();
                },
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      changeColor = !changeColor;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      changeColor = !changeColor;
                    });
                  },
                  child: Text(
                    "YES",
                    style: GoogleFonts.ptSansNarrow(
                        color: changeColor ? Colors.white : Colors.green,
                        fontSize: 16),
                  ),
                ),
              ),
              Text(
                " , NO ]" ' \u275E',
                style:
                    GoogleFonts.ptSansNarrow(color: Colors.white, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
