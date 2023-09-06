import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/project_model.dart';
import 'package:flutter_portfolio/utils/info_card.dart';
import 'package:flutter_portfolio/utils/project_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.4)),
                      child: Image.asset(
                        "/gif/profile.gif",
                        height: 125.0,
                        width: 125.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Lakshay Ahlawat",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                    ),
                    const Divider(),
                    const InfoCard(
                        title: "EMAIL",
                        subtitle: "lakshay6447@gmail.com",
                        icon: Icons.email_outlined),
                    const SizedBox(
                      height: 24,
                    ),
                    const InfoCard(
                        title: "PHONE",
                        subtitle: "+91 8685818767",
                        icon: Icons.phone_android_outlined),
                    const SizedBox(
                      height: 24,
                    ),
                    const InfoCard(
                        title: "LOCATION",
                        subtitle: "IIT Guwahati",
                        icon: Icons.location_city),
                    const SizedBox(
                      height: 24,
                    ),
                    const InfoCard(
                        title: "GITHUB",
                        subtitle: "TESLA2402",
                        icon: Icons.info_outline),
                    const SizedBox(
                      height: 24,
                    ),
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
                                child: const Text(
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
                                child: const Text(
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
                                child: const Text(
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
                                child: const Text(
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
                        ? Expanded(
                            child: GridView.builder(
                              itemCount: projectList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, childAspectRatio: 1.3),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ProjectCard(
                                      title: projectList[index].name,
                                      description:
                                          projectList[index].description,
                                      url: projectList[index].link),
                                );
                              },
                            ),
                          )
                        : Container(),
                    page == "Resume"
                        ? Expanded(
                            child: PdfViewer.openAsset('/pdf/resume.pdf'))
                        : Container()
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
