import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';
import 'package:anet/universal/dev_scaffold.dart';
import 'package:anet/authentication_bloc/authentication.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    // BorderRadiusGeometry radius = BorderRadius.only(
    //   topLeft: Radius.circular(24.0),
    //   topRight: Radius.circular(24.0),
    // );

    var homeBloc = BlocProvider.of<HomeBloc>(context);
    //var auth = BlocProvider.of<AuthenticationBloc>(context);

    return DevScaffold(
      body: HomeScreen(homeBloc: homeBloc),
      // body: SlidingUpPanel(
      //   parallaxEnabled: true,
      //   backdropEnabled: true,
      //   backdropTapClosesPanel: true,
      //   maxHeight: MediaQuery.of(context).size.height * 0.6,
      //   color: Theme.of(context).primaryColor,
      //   panel: HomeSlidingPanel(),
      //   collapsed: AnimatedContainer(
      //     duration: Duration(milliseconds: 500),
      //     decoration: BoxDecoration(
      //       color: Theme.of(context).primaryColor,
      //     ),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       mainAxisSize: MainAxisSize.max,
      //       children: <Widget>[
      //         AnimatedContainer(
      //           duration: Duration(milliseconds: 500),
      //           height: 5.0,
      //           width: MediaQuery.of(context).size.width * 0.08,
      //           decoration: BoxDecoration(
      //             color:
      //                 ConfigBloc().darkModeOn ? Colors.white : Colors.grey[300],
      //             borderRadius: BorderRadius.circular(5.0),
      //           ),
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: <Widget>[
      //             CircleAvatar(
      //               radius: 15,
      //               backgroundImage: CachedNetworkImageProvider(
      //                   "https://pbs.twimg.com/media/D22N_huX4AEbb1y.jpg"),
      //             ),
      //             SizedBox(
      //               width: 15,
      //             ),
      //             Text(
      //               "Locate Us",
      //               textAlign: TextAlign.center,
      //               style: Theme.of(context).textTheme.title,
      //             ),
      //             SizedBox(
      //               width: 0,
      //             ),
      //             IconButton(
      //               onPressed: () => Share.share(
      //                   "Download the new DevFest App and share with your tech friends.\nPlayStore -  http://bit.ly/2GDr18N"),
      //               icon: Icon(
      //                 Icons.share,
      //                 size: 20,
      //               ),
      //             ),
      //           ],
      //         ),
      //         Offstage()
      //       ],
      //     ),
      //   ),
      //   body: HomeScreen(homeBloc: _homeBloc),
      // ),
      title: "Home",
    );
  }
}
