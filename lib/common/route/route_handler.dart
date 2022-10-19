import 'package:flutter/material.dart';
import 'package:musicmodel/common/route/route_arguments.dart';
import 'package:musicmodel/constants/route_strings.dart';
import 'package:musicmodel/features/dashboardPage.dart';
import 'package:musicmodel/features/homePage.dart';
import 'package:musicmodel/features/landingPage.dart';
import 'package:musicmodel/features/music/models/music_model.dart';
import 'package:musicmodel/features/selectedMusicPage.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case RouteStrings.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteStrings.startupPage:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case RouteStrings.selectedMusic:
        var typedArgs = args as MusicArguments;
        return MaterialPageRoute(builder: (_) => SelectedMusic(model: typedArgs.musicModel,));
      default:
        return MaterialPageRoute(builder: (_) => DashboardPage());
    }
  }
}
