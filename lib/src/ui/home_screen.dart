import 'package:flutter/material.dart';
import 'package:linked_redesign/src/bloc/state_bloc.dart';
import 'package:linked_redesign/src/styles/app_colors.dart';
import 'package:linked_redesign/src/ui/messages_screen.dart';
import 'package:linked_redesign/src/ui/news_feed_screen.dart';
import 'package:linked_redesign/src/ui/profile_screen.dart';

import 'jobs_screen.dart';
import 'notifications_screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BaseStateBloc<int> baseStateBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baseStateBloc = BaseStateBloc(0);
  }

  @override
  Widget build(BuildContext context) {
    return baseStateBloc.blocWidget(widget: (value) {
      print(value);
      return Scaffold(
        body: IndexedStack(
          children: <Widget>[
            NewsFeedScreen(),
            JobsScreen(),
            MessagesScreen(),
            NotificationsScreen(),
            ProfileScreen(),
          ],
          index: baseStateBloc.value,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.linkedinBlue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: AppColors.linkedinBlue,
                icon: Icon(
                  Icons.home,
                  //    color: AppColors.linkedinBlue,
                ),
                title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.work,
                  // color: AppColors.w,
                ),
                title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  //  color: AppColors.linkedinBlue,
                ),
                title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  //  color: AppColors.linkedinBlue,
                ),
                title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  //   color: AppColors.linkedinBlue,
                ),
                title: Text("Home")),
          ],
          currentIndex: value,
          onTap: (index) {
            baseStateBloc.changeStateWithoutValueProvided(index);

            baseStateBloc.changeState(state: (value) {
              //do somthing with value

              return value;
            });
          },
        ),
      );
    });
  }
}
