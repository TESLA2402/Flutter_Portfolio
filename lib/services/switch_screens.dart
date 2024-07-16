import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/project_model.dart';

class NavigationViewModel extends ChangeNotifier {
  int _index = 0;
  String _page = "Home";
  List<Project> _githubProjectList = projectList;
  set screenIndex(int val) {
    _index = val;
    notifyListeners();
  }

  set screenName(String name) {
    _page = name;
    notifyListeners();
  }

  set screenGithubProjectList(List<Project> githubList) {
    _githubProjectList = githubList;
    notifyListeners();
  }

  int get screenIndex => _index;
  String get screenName => _page;
  List<Project> get screenGithubProjectList => _githubProjectList;
}
