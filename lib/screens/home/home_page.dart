import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';
import 'package:flutter_portfolio/models/profile_model.dart';
import 'package:flutter_portfolio/utils/quote_widget.dart';
import 'package:flutter_portfolio/utils/tag_card.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String quoteURL = "https://api.quotable.io/random?maxLength=50";
  String quote = 'life is about timing';
  String author = 'carl lewis';
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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi, I'm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  personalInfo.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "a ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) =>
                          AppColors.gradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'open sourcer',
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Canterbury',
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            "developer",
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Canterbury',
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            "student",
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Canterbury',
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        totalRepeatCount: 12,
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(0.8),
                      boxShadow: [
                        ResponsiveBreakpoints.of(context).isMobile
                            ? const BoxShadow()
                            : const BoxShadow(
                                color: Colors.white,
                                spreadRadius: 0,
                                blurRadius: 5,
                                blurStyle: BlurStyle.solid)
                      ],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Skills",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Canterbury',
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: ResponsiveBreakpoints.of(context).isMobile
                                ? MediaQuery.of(context).size.width * 0.65
                                : MediaQuery.of(context).size.width * 0.3,
                            child: Wrap(direction: Axis.horizontal, children: [
                              for (int i = 0;
                                  i < personalInfo.skills.length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ProjectTagCard(
                                      tagName:
                                          personalInfo.skills[i].toLowerCase()),
                                )
                            ]),
                          )
                        ]))
              ],
            ),
          ),
          const Spacer(),
          if (!ResponsiveBreakpoints.of(context).isMobile)
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(8),
                //   child: Container(
                //     constraints: BoxConstraints(
                //       maxWidth: MediaQuery.of(context).size.width * 0.3,
                //       maxHeight: MediaQuery.of(context).size.height * 0.4,
                //     ),
                //     child: Image.asset(
                //       kReleaseMode
                //           ? "assets/gif/profile.gif"
                //           : "/gif/profile.gif",
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.width * 0.02,
                // ),
                Align(alignment: Alignment.center, child: QuoteWidget()),
              ],
            ),
        ],
      ),
    );
  }
}
