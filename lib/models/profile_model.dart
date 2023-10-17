class PersonalInfo {
  final String name;
  final String email;
  final String urlGithub;
  final String urlLinkedIn;
  final String urlTwitter;
  final String mobile;
  final String location;
  final String githubUsername;
  final String resumeLink;
  final List<String> skills;
  PersonalInfo(
      {required this.name,
      required this.resumeLink,
      required this.email,
      required this.urlGithub,
      required this.urlLinkedIn,
      required this.urlTwitter,
      required this.mobile,
      required this.githubUsername,
      required this.location,
      required this.skills});
}

PersonalInfo personalInfo = PersonalInfo(
    name: "Lakshay Ahlawat",
    email: "lakshay6447@gmail.com",
    urlGithub: "https://github.com/TESLA2402",
    urlLinkedIn: "https://www.linkedin.com/in/lakshay6447/",
    urlTwitter: "link",
    resumeLink:
        "https://drive.google.com/file/d/1Z4CBCxlHlYesy7nknOpaPMLmDFs9CVQ4/view?usp=share_link",
    githubUsername: 'TESLA2402',
    location: "IIT Guwahati",
    mobile: '8685818767',
    skills: [
      "C",
      "C++",
      "Dart",
      "Golang",
      "Rust",
      "Python",
      "HTML",
      "CSS",
      "Flutter",
      "TypeScript",
      "JavaScript",
      "NodeJS",
      "ExpressJS",
      "NextJs",
      "Tauri",
      "Google Firebase",
      "Supabase",
      "SQLite",
      "MySQL",
      "Git",
    ]);
