import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';
import 'package:flutter_portfolio/screens/contact/contact_page.dart';
import 'package:flutter_portfolio/screens/home/home_page.dart';
import 'package:flutter_portfolio/screens/project/project_screen.dart';
import 'package:flutter_portfolio/screens/resume/resume_page.dart';
import 'package:flutter_portfolio/utils/side_info_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String page = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SideInfoCard(),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.2)),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          page,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 24),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 48, right: 48),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              color: Colors.white.withOpacity(0.25)),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    page = "Home";
                                  });
                                },
                                child: page == "Home"
                                    ? ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) =>
                                            AppColors.gradient.createShader(
                                          Rect.fromLTWH(0, 0, bounds.width,
                                              bounds.height),
                                        ),
                                        child: const Text(
                                          "Home",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16),
                                        ),
                                      )
                                    : const Text(
                                        "Home",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 16),
                                      ),
                              ),
                              const SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    page = "Resume";
                                  });
                                },
                                child: page == "Resume"
                                    ? ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) =>
                                            AppColors.gradient.createShader(
                                          Rect.fromLTWH(0, 0, bounds.width,
                                              bounds.height),
                                        ),
                                        child: const Text(
                                          "Resume",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16),
                                        ),
                                      )
                                    : const Text(
                                        "Resume",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 16),
                                      ),
                              ),
                              const SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    page = "Projects";
                                  });
                                },
                                child: page == "Projects"
                                    ? ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) =>
                                            AppColors.gradient.createShader(
                                          Rect.fromLTWH(0, 0, bounds.width,
                                              bounds.height),
                                        ),
                                        child: const Text(
                                          "Projects",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16),
                                        ),
                                      )
                                    : const Text(
                                        "Projects",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 16),
                                      ),
                              ),
                              const SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    page = "Contact";
                                  });
                                },
                                child: page == "Contact"
                                    ? ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) =>
                                            AppColors.gradient.createShader(
                                          Rect.fromLTWH(0, 0, bounds.width,
                                              bounds.height),
                                        ),
                                        child: const Text(
                                          "Contact",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 16),
                                        ),
                                      )
                                    : const Text(
                                        "Contact",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 16),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    page == "Projects" ? const ProjectScreen() : Container(),
                    page == "Home" ? const HomePage() : Container(),
                    page == "Resume" ? const ResumePage() : Container(),
                    page == "Contact" ? const ContactPage() : Container(),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
