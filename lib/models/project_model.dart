class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
      "ChatGPT-Tauri",
      "ChatGPTxTauri is a desktop application that allows users to interact with a large language model based on GPT-3.5 architecture. Available on macOS, Linux, and Windows operating systems, the app provides users with a chat interface where they can input text and receive responses generated by the AI model.",
      "image",
      "https://github.com/TESLA2402/ChatGPT-Tauri"),
  Project(
      "Supabase_Flutter",
      "An application that displays news articles, sorts them on the basis of their categories, and can save your favourite articles.",
      "image",
      "https://github.com/TESLA2402/Supabase_Flutter"),
  Project(
      "Meeting-Platform",
      "The platform will provide features such as audio and video conferencing, screen sharing, chat, and file sharing. The platform is designed to be user-friendly and accessible, allowing individuals and teams to easily connect and collaborate from anywhere in the world.",
      "image",
      "https://github.com/TESLA2402/Meeting-Platform"),
  Project(
      "ChatBox",
      "a real-time chat application using Flutter and Firebase in which two users can chat in realtime. App also includes a chatbot which which will generate smart replies to the user’s message.",
      "image",
      "https://github.com/TESLA2402/chatapp")
];