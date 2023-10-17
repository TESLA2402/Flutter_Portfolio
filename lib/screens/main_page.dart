import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';
import 'package:flutter_portfolio/models/profile_model.dart';
import 'package:flutter_portfolio/screens/contact/contact_page.dart';
import 'package:flutter_portfolio/screens/home/home_page.dart';
import 'package:flutter_portfolio/screens/project/project_screen.dart';
import 'package:flutter_portfolio/screens/resume/resume_page.dart';
import 'package:flutter_portfolio/services/launcher_services.dart';
import 'package:flutter_portfolio/utils/side_info_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String page = "Home";
  String nameText = "ラクシャイ・アラワット";
  @override
  Widget build(BuildContext context) {
    Launcher launcher = Launcher();
    return Scaffold(
        // appBar: AppBar(
        //   title: Align(
        //     alignment: Alignment.centerLeft,
        //     child: MouseRegion(
        //       onEnter: (event) {
        //         setState(() {
        //           nameText = "Lakshay Ahlawat";
        //         });
        //       },
        //       onExit: (event) {
        //         setState(() {
        //           nameText = "ラクシャイ・アラワット";
        //         });
        //       },
        //       child: Text(
        //         nameText,
        //         style: const TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.w800,
        //             fontSize: 24),
        //       ),
        //     ),
        //   ),
        //   backgroundColor: Colors.black,
        // ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: ResponsiveBreakpoints.of(context).isMobile
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.all(60.0),
          child: ResponsiveBreakpoints.of(context).isMobile
              ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        const SideInfoCard(),
                        const SizedBox(
                          height: 8,
                        ),
                        const HomePage(),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                            padding: const EdgeInsets.all(12),
                            height: MediaQuery.of(context).size.width * 1.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white.withOpacity(0.2)),
                            child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Resume",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ResumePage(),
                                ])),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                            padding: const EdgeInsets.all(12),
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white.withOpacity(0.2)),
                            child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Projects",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ProjectScreen(),
                                ])),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                            padding: const EdgeInsets.all(12),
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white.withOpacity(0.2)),
                            child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ContactPage(),
                                ])),
                      ],
                    );
                  })
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SideInfoCard(),
                    const SizedBox(
                      width: 8,
                    ),
                    if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
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
                                page == "Resume"
                                    ? GestureDetector(
                                        onTap: () {
                                          launcher.openSocials(
                                              personalInfo.resumeLink);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 4,
                                              bottom: 4),
                                          decoration: BoxDecoration(
                                              color: Colors.lightBlue
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            children: [
                                              Text(
                                                page,
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 24),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              const Icon(
                                                Icons.download,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Text(
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
                                                    AppColors.gradient
                                                        .createShader(
                                                  Rect.fromLTWH(
                                                      0,
                                                      0,
                                                      bounds.width,
                                                      bounds.height),
                                                ),
                                                child: const Text(
                                                  "Home",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w200,
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
                                                    AppColors.gradient
                                                        .createShader(
                                                  Rect.fromLTWH(
                                                      0,
                                                      0,
                                                      bounds.width,
                                                      bounds.height),
                                                ),
                                                child: const Text(
                                                  "Resume",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w200,
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
                                                    AppColors.gradient
                                                        .createShader(
                                                  Rect.fromLTWH(
                                                      0,
                                                      0,
                                                      bounds.width,
                                                      bounds.height),
                                                ),
                                                child: const Text(
                                                  "Projects",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w200,
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
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     setState(() {
                                      //       page = "Experiences";
                                      //     });
                                      //   },
                                      //   child: page == "Experiences"
                                      //       ? ShaderMask(
                                      //           blendMode: BlendMode.srcIn,
                                      //           shaderCallback: (bounds) =>
                                      //               AppColors.gradient
                                      //                   .createShader(
                                      //             Rect.fromLTWH(
                                      //                 0,
                                      //                 0,
                                      //                 bounds.width,
                                      //                 bounds.height),
                                      //           ),
                                      //           child: const Text(
                                      //             "Experiences",
                                      //             style: TextStyle(
                                      //                 color: Colors.white,
                                      //                 fontWeight:
                                      //                     FontWeight.w200,
                                      //                 fontSize: 16),
                                      //           ),
                                      //         )
                                      //       : const Text(
                                      //           "Experiences",
                                      //           style: TextStyle(
                                      //               color: Colors.white,
                                      //               fontWeight: FontWeight.w200,
                                      //               fontSize: 16),
                                      //         ),
                                      // ),
                                      // const SizedBox(
                                      //   width: 48,
                                      // ),
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
                                                    AppColors.gradient
                                                        .createShader(
                                                  Rect.fromLTWH(
                                                      0,
                                                      0,
                                                      bounds.width,
                                                      bounds.height),
                                                ),
                                                child: const Text(
                                                  "Contact",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w200,
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
                            page == "Projects"
                                ? const ProjectScreen()
                                : Container(),
                            page == "Home" ? const HomePage() : Container(),
                            page == "Resume" ? const ResumePage() : Container(),
                            page == "Contact"
                                ? const ContactPage()
                                : Container(),
                            // page == "Experiences"
                            //     ? const ExperienceScreen()
                            //     : Container(),
                          ]),
                        ),
                      ),
                  ],
                ),
        ));
  }
}
