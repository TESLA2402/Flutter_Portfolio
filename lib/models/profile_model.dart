class PersonalInfo {
  final String name;
  final String email;
  final String urlGithub;
  final String urlLinkedIn;
  final String urlTwitter;
  final String mobile;
  final String location;
  final String githubUsername;
  PersonalInfo(
      {required this.name,
      required this.email,
      required this.urlGithub,
      required this.urlLinkedIn,
      required this.urlTwitter,
      required this.mobile,
      required this.githubUsername,
      required this.location});
}

PersonalInfo personalInfo = PersonalInfo(
    name: "Lakshay Ahlawat",
    email: "lakshay6447@gmail.com",
    urlGithub: "https://github.com/TESLA2402",
    urlLinkedIn: "https://www.linkedin.com/in/lakshay6447/",
    urlTwitter: "link",
    githubUsername: 'TESLA2402',
    location: "IIT Guwahati",
    mobile: '8685818767');
