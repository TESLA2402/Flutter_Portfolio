import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';
import 'package:flutter_portfolio/constants/typography.dart';
import 'package:flutter_portfolio/models/profile_model.dart';
import 'package:flutter_portfolio/services/launcher_services.dart';
import 'package:flutter_portfolio/utils/info_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  Launcher launch = Launcher();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Welcome Back',
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              "Get In Touch!",
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Canterbury',
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(
                icon: FontAwesomeIcons.github, url: personalInfo.urlGithub),
            const SizedBox(
              width: 8,
            ),
            IconWidget(
              icon: FontAwesomeIcons.linkedin,
              url: personalInfo.urlLinkedIn,
            ),
            const SizedBox(
              width: 8,
            ),
            IconWidget(
              icon: FontAwesomeIcons.twitter,
              url: personalInfo.urlTwitter,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 36, right: 48, left: 48),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.8),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white,
                    spreadRadius: 0,
                    blurRadius: 5,
                    blurStyle: BlurStyle.solid)
              ],
            ),
            child: Column(
              crossAxisAlignment: ResponsiveBreakpoints.of(context).isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Contact Form",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        SizedBox(
                          width: ResponsiveBreakpoints.of(context).isMobile
                              ? MediaQuery.of(context).size.width * 0.5
                              : MediaQuery.of(context).size.width * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16),
                              ),
                              TextFormField(
                                controller: _nameController,
                                validator: (String? value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Please Enter Name';
                                  }

                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) =>
                                        AppColors.gradient.createShader(
                                      Rect.fromLTWH(
                                          0, 0, bounds.width, bounds.height),
                                    ),
                                    child: const Icon(FontAwesomeIcons.user),
                                  ),
                                  hintText: 'Luffy San',
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  disabledBorder: null,
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppColors.error[500]!)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppColors.error[500]!)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: AppColors.gray[200]!)),
                                  fillColor: AppColors.gray[100],
                                  hintStyle: AppTypography.textMd.copyWith(
                                      color: AppColors.gray[500], fontSize: 16),
                                  helperStyle: AppTypography.textSm
                                      .copyWith(color: AppColors.gray[400]),
                                  errorStyle: AppTypography.textSm
                                      .copyWith(color: AppColors.error[400]),
                                  iconColor: AppColors.gray[400],
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelStyle: AppTypography.textSm.copyWith(
                                      color: AppColors.gray[600],
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                "Your Email",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16),
                              ),
                              TextFormField(
                                controller: _emailController,
                                validator: (String? value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Please Enter Email';
                                  } else if (!RegExp(
                                          r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                                      .hasMatch(value)) {
                                    return 'Please enter valid email';
                                  }

                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) =>
                                        AppColors.gradient.createShader(
                                      Rect.fromLTWH(
                                          0, 0, bounds.width, bounds.height),
                                    ),
                                    child: const Icon(Icons.mail_outline),
                                  ),
                                  hintText: 'youremail@gmail.com',
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  disabledBorder: null,
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppColors.error[500]!)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppColors.error[500]!)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: AppColors.gray[200]!)),
                                  fillColor: AppColors.gray[100],
                                  hintStyle: AppTypography.textMd.copyWith(
                                      color: AppColors.gray[500], fontSize: 16),
                                  helperStyle: AppTypography.textSm
                                      .copyWith(color: AppColors.gray[400]),
                                  errorStyle: AppTypography.textSm
                                      .copyWith(color: AppColors.error[400]),
                                  iconColor: AppColors.gray[400],
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelStyle: AppTypography.textSm.copyWith(
                                      color: AppColors.gray[600],
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                "Subject",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16),
                              ),
                              TextFormField(
                                controller: _subjectController,
                                validator: (String? value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Please Enter Subject';
                                  }

                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  prefixIcon: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) =>
                                        AppColors.gradient.createShader(
                                      Rect.fromLTWH(
                                          0, 0, bounds.width, bounds.height),
                                    ),
                                    child: const Icon(Icons.edit_outlined),
                                  ),
                                  hintText: 'Hiring for...',
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  disabledBorder: null,
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppColors.error[500]!)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppColors.error[500]!)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: AppColors.gray[200]!)),
                                  fillColor: AppColors.gray[100],
                                  hintStyle: AppTypography.textMd.copyWith(
                                      color: AppColors.gray[500], fontSize: 16),
                                  helperStyle: AppTypography.textSm
                                      .copyWith(color: AppColors.gray[400]),
                                  errorStyle: AppTypography.textSm
                                      .copyWith(color: AppColors.error[400]),
                                  iconColor: AppColors.gray[400],
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelStyle: AppTypography.textSm.copyWith(
                                      color: AppColors.gray[600],
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!ResponsiveBreakpoints.of(context).isMobile)
                          const SizedBox(
                            width: 16,
                          ),
                        if (!ResponsiveBreakpoints.of(context).isMobile)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Message",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16),
                                ),
                                TextFormField(
                                  controller: _messageController,
                                  validator: (String? value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Please Enter Message';
                                    }

                                    return null;
                                  },
                                  maxLines: 9,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    hintText: 'Your Messsage..',
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    disabledBorder: null,
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: AppColors.error[500]!)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: AppColors.error[500]!)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1.5,
                                            color: AppColors.gray[200]!)),
                                    fillColor: AppColors.gray[100],
                                    hintStyle: AppTypography.textMd.copyWith(
                                        color: AppColors.gray[500],
                                        fontSize: 16),
                                    helperStyle: AppTypography.textSm
                                        .copyWith(color: AppColors.gray[400]),
                                    errorStyle: AppTypography.textSm
                                        .copyWith(color: AppColors.error[400]),
                                    iconColor: AppColors.gray[400],
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    labelStyle: AppTypography.textSm.copyWith(
                                        color: AppColors.gray[600],
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    )),
                const SizedBox(
                  height: 24,
                ),
                Center(
                    child: Container(
                  height: 48,
                  width: ResponsiveBreakpoints.of(context).isMobile
                      ? MediaQuery.of(context).size.width * 0.5
                      : MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      gradient: AppColors.gradient,
                      borderRadius: BorderRadius.circular(12)),
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: TextButton(
                          onPressed: () {
                            launch.sendMail(
                                _nameController.text,
                                _subjectController.text,
                                _messageController.text);
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 20)),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size.fromHeight(56))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text("Send Message",
                                    style: AppTypography.textMd.copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
