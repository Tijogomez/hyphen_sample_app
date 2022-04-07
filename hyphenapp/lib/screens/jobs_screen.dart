import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hyphenapp/screens/assigned_task_screen.dart';
import 'package:hyphenapp/screens/home_screen.dart';
import 'package:hyphenapp/test%20data/JobsDataModel.dart';

class JobsScreen extends StatefulWidget {
  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  static List<int> jobnmbr = [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 18, 19];
  static List<String> jobDesc = [
    'Error Residence-Structural',
    'Error Residence-Content ',
    'PLA Building',
    'Blaise Cabin',
    'Brockwell Residence',
    'Winslow Garage',
    'Boriston Exterior',
    'Cambridge Addition',
    'Bravington Model',
    'Mardee Exterior',
    'Silver Rock Development-Unit A',
    'Silver Rock Development-Unit B',
    'McCalister Residence',
    'Hefforman Fire'
  ];
  static List<String> jobStatus = [
    'A',
    'A',
    'A',
    'H',
    'A',
    'E',
    'F',
    'A',
    'E',
    'A',
    'C',
    'C',
    'E',
    'O'
  ];

  final List<Jobs> JobsSection = List.generate(jobnmbr.length,
      (index) => Jobs(jobnmbr[index], jobDesc[index], jobStatus[index]));

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
            child: Column(
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  elevation: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
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
                            children: const [
                              Icon(
                                Icons.location_pin,
                                color: Colors.white,
                              ),
                              Text(
                                " Jobs",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.sort,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 35.0),
                            child: Text(
                              "Job #" +
                                  "                  " +
                                  "Description" +
                                  "                                 " +
                                  "Status",
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'assets/fonts/Nunito-Regular.ttf',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: JobsSection.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        JobsSection[index]
                                                .jobNumber
                                                .toString() +
                                            "                         " +
                                            JobsSection[index].jobDescription +
                                            "         " +
                                            JobsSection[index].status,
                                        style: const TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
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
            icon: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AssignedTasks(),
                    ));
              },
              child: Icon(
                Icons.assignment_turned_in,
                size: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {},
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
