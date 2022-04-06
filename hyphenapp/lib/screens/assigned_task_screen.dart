import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hyphenapp/test%20data/AssignedTasksDataModel.dart';

class AssignedTasks extends StatefulWidget {
  @override
  State<AssignedTasks> createState() => _AssignedTasksState();
}

class _AssignedTasksState extends State<AssignedTasks> {
  static List<String> heading = [
    'SitePrep',
    'Foundation',
    'Framing',
    'Schedule Customer Visit',
    'Roof',
    'Bid Remainder'
  ];
  static List<String> status = [
    'Complete',
    'Complete',
    'Start',
    'Start',
    'Start',
    'Start'
  ];
  static List<String> description = [
    'Mardee Exterior',
    'Bravington Remodel',
    'Silver Rock Development',
    'Blaise Cabin',
    'McCalister Residence',
    'Cambridge Addition'
  ];
  static List<double> schedstart = [
    10 / 15 / 21,
    10 / 24 / 21,
    11 / 1 / 21,
    11 / 10 / 21,
    11 / 16 / 21,
    12 / 12 / 21
  ];
  static List<double> schedend = [
    10 / 31 / 21,
    11 / 2 / 21,
    11 / 15 / 21,
    11 / 10 / 21,
    11 / 30 / 21,
    5 / 5 / 21
  ];
  static List<double> actstart = [10 / 3 / 21, 10 / 24 / 21, 0, 0, 0, 0];
  static List<double> actend = [0, 0, 0, 0, 0, 0];
  static List<int> jobnumber = [22, 10, 13, 4, 18, 9];

  final List<AssignedTasksGet> Assignedtasks = List.generate(
      heading.length,
      (index) => AssignedTasksGet(
          heading[index],
          status[index],
          schedstart[index],
          schedend[index],
          actstart[index],
          actend[index],
          description[index],
          jobnumber[index]));
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
          children: const [
            Text(
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
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  fontFamily: 'assets/fonts/Nunito-Regular.ttf',
                ),
              ),
              radius: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15),
              ),
            ),
            elevation: 3,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF47621),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  height: 40,
                  width: double.infinity,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.assignment_turned_in,
                        color: Colors.white,
                      ),
                      Text(
                        "Assigned Tasks",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: Assignedtasks.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 40),
                            child: Text(
                              Assignedtasks[index].jobHeading +
                                  "   " +
                                  Assignedtasks[index].status,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.all(25),
        behaviour: SnakeBarBehaviour.pinned,
        height: 50,
        elevation: 5,
        snakeViewColor: Color(0xFFF47621),
        selectedItemColor:
            SnakeShape.circle == SnakeShape.indicator ? Colors.black : null,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on_sharp,
                size: 30,
              ),
              label: 'Location'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_turned_in,
                size: 30,
              ),
              label: 'Assigned'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AssignedTasks(),
                      ));
                },
              ),
              label: 'Schedule'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(
              backgroundColor: index == 2 ? Color(0xFFF47621) : Colors.white,
              elevation: 5,
              child: Icon(Icons.home,
                  size: 40, color: index == 2 ? Colors.white : Colors.grey),
              onPressed: () {}),
        ),
      ),
    );
  }
}
