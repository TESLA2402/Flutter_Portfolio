// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void preventRightClick() {
  html.document.body!
      .addEventListener('contextmenu', (event) => event.preventDefault());
}
