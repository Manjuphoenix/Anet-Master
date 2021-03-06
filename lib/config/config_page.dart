import 'package:anet/attendanceNav/attendancepagescreen.dart';
import 'package:anet/comingsoon.dart';
import 'package:anet/newsNav/newsPageScreen.dart';
import 'package:anet/projectsNav/projectsPage.dart';
import 'package:anet/rank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anet/home/home_page.dart';
import 'index.dart';

import 'package:anet/eventsnav/eventsPage.dart';

/*
import 'package:flutter_devfest/faq/faq_page.dart';
import 'package:flutter_devfest/find_devfest/find_devfest_page.dart';
import 'package:flutter_devfest/home/home_page.dart';
import 'package:flutter_devfest/map/map_page.dart';
import 'package:flutter_devfest/speakers/speaker_page.dart';
import 'package:flutter_devfest/sponsors/sponsor_page.dart';
import 'package:flutter_devfest/team/team_page.dart';*/
import 'package:anet/utils/devfest.dart';

class ConfigPage extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc.darkModeOn =
        Devfest.prefs.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //* Custom Google Font
              fontFamily: Devfest.josefin_sans_family,
              primarySwatch: Colors.red,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[40],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: HomePage(),
            routes: {
              //HomePage.routeName: (context) => HomePage(),
              // SpeakerPage.routeName: (context) => SpeakerPage(),
              EventsPage.routeName: (context) => EventsPage(),
              ComingSoonPage.routeName: (context) => ComingSoonPage(),
              RankPage.routeName: (context) => RankPage(),
              NewsPageScreen.routeName: (context) => NewsPageScreen(),

              AttendancePageScreen.routeName: (context) =>
                  AttendancePageScreen(),
              ProjectsPage.routeName: (context) => ProjectsPage(),

              /*
              SponsorPage.routeName: (context) => SponsorPage(),
              TeamPage.routeName: (context) => TeamPage(),
              FaqPage.routeName: (context) => FaqPage(),
              FindDevFestPage.routeName: (context) => FindDevFestPage(),
              MapPage.routeName: (context) => MapPage(),*/
            },
          );
        },
      ),
    );
  }
}
