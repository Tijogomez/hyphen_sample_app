import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hyphenapp/screens/home_screen.dart';
import 'package:hyphenapp/screens/jobs_screen.dart';
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
  static List<IconData> taskicon = [
    Icons.show_chart,
    Icons.show_chart,
    Icons.show_chart,
    Icons.alarm,
    Icons.show_chart,
    Icons.construction,
  ];

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
          jobnumber[index],
          taskicon[index]));
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
        child: SingleChildScrollView(
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
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Assignedtasks.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Assignedtasks[index].icon,
                                          color: Colors.black54),
                                      // SizedBox(width: 100.0),
                                      Text(
                                        Assignedtasks[index].jobHeading,
                                        style: TextStyle(
                                            fontFamily:
                                                'assets/fonts/Nunito-Regular.ttf',
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(width: 150.0),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          Assignedtasks[index].status,
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15.0,
                                            fontFamily:
                                                'assets/fonts/Nunito-Regular.ttf',
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFF47621),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text('Job' +
                                      ' ' +
                                      Assignedtasks[index]
                                          .jobNumber
                                          .toString() +
                                      ' ' '-' +
                                      ' ' +
                                      Assignedtasks[index].jobDescription)
                                ],
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
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.all(25),
        height: 50,
        elevation: 5,
        snakeViewColor: Color(0xFFF47621),
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobsScreen(),
                    ));
              },
              child: Icon(
                Icons.location_pin,
                size: 30,
              ),
            ),
          ),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              }),
        ),
      ),
    );
  }
}
