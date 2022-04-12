import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hyphenapp/test%20data/ActiveJobsDataModel.dart';
import 'package:hyphenapp/test%20data/AssignedTasksHomeDataModel.dart';
import 'package:hyphenapp/test_screen/assigned_test_screen.dart';

import '../test_screen/home_test_screen.dart';
import 'package:hyphenapp/test_screen/home_test_screen.dart';

import '../test_screen/job_test_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _widgetOptions = <Widget>[
    JobTestScreen(),
    AssignedTestScreen(),
    HomeTestScreen(),
  ];

  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/app_icon.png'),
        ),
        title: Column(
          children: [
            const Text(
              "Andree Douglass",
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            Text("Sticks and Bricks Construction",
                style: TextStyle(color: Colors.black38, fontSize: 15.0))
          ],
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFFF47621),
              foregroundColor: Colors.white,
              child: Text(
                "AD",
                style: TextStyle(
                  color: Color.fromRGBO(255, 252, 251, 15),
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  fontFamily: 'Nunito',
                ),
              ),
              radius: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Card(
          elevation: 3,
          child: SingleChildScrollView(
            child: _widgetOptions.elementAt(index),
          ),
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeShape: index == 2 ? SnakeShape.circle : SnakeShape.rectangle,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(25),
        height: 50,
        elevation: 5,
        snakeViewColor: const Color(0xFFF47621),
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(
                Icons.location_pin,
                size: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(
                Icons.assignment_turned_in,
                size: 30,
              ),
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  index = this.index;
                });
              },
            ),
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  index = this.index;
                });
              },
              child: Icon(
                Icons.menu,
                size: 30,
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor:
                index == 2 ? const Color(0xFFF47621) : Colors.white,
            elevation: 5,
            child: Icon(Icons.home,
                size: 40, color: index == 2 ? Colors.white : Colors.grey),
            onPressed: () {
              setState(() {
                this.index = 2;
              });
            },
          ),
        ),
      ),
    );
  }
}
