import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/quote_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String quoteURL = "https://api.quotable.io/random?maxLength=50";
  String quote = 'life is about timing';
  String author = 'carl lewis';
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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const Spacer(),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.3,
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                  ),
                  child: Image.asset(
                    kReleaseMode
                        ? "assets/gif/profile.gif"
                        : "/gif/profile.gif",
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const QuoteWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
