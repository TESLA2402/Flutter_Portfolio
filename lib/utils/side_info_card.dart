import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/profile_model.dart';
import 'package:flutter_portfolio/utils/info_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SideInfoCard extends StatelessWidget {
  const SideInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: ResponsiveBreakpoints.of(context).isMobile
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width * 0.3,
                maxHeight: ResponsiveBreakpoints.of(context).isMobile
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.height * 0.25,
              ),
              child: Image.asset(
                kReleaseMode
                    ? "assets/gif/programmer.gif"
                    : "/gif/programmer.gif",
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            personalInfo.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 24),
          ),
          SizedBox(
            width: ResponsiveBreakpoints.of(context).isMobile
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 6,
            child: Divider(
              color: Colors.white.withOpacity(0.25),
              thickness: 2,
              height: 48,
            ),
          ),
          InfoCard(
              title: "EMAIL",
              subtitle: personalInfo.email,
              icon: Icons.email_outlined),
          const SizedBox(
            height: 24,
          ),
          InfoCard(
              title: "PHONE",
              subtitle: "+91 ${personalInfo.mobile}",
              icon: Icons.phone_android_outlined),
          const SizedBox(
            height: 24,
          ),
          InfoCard(
              title: "LOCATION",
              subtitle: personalInfo.location,
              icon: Icons.location_city),
          const SizedBox(
            height: 24,
          ),
          InfoCard(
              title: "GITHUB",
              subtitle: personalInfo.githubUsername,
              icon: Icons.info_outline),
          const SizedBox(
            height: 24,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
