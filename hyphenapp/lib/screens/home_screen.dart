import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hyphenapp/screens/assigned_task_screen.dart';
import 'package:hyphenapp/test%20data/ActiveJobsDataModel.dart';
import 'package:hyphenapp/test%20data/AssignedTasksHomeDataModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static List<int> jobNo = [1, 2, 3, 4, 5, 6, 7];
  static List<String> description = [
    'Structural Residence',
    'Content Residence',
    'PLA Building',
    'Blaise Cabin',
    'Brockwell Residence',
    'Winslow Garage',
    'Boriston Exterior',
    'Boriston Residence'
  ];
  // int _selectedIndex = 0;

  final List<ActiveJobs> Activejobs = List.generate(
      jobNo.length, (index) => ActiveJobs(jobNo[index], description[index]));

  static List<int> assignedJobNo = [5421, 8463, 2675, 5423];
  static List<String> assignedDescription = [
    'Call customer re:nail pops',
    'Site Prep',
    'Schedule Customer Visit',
    'Site Prep',
  ];
  static List<IconData> assignedTastIcons = [
    Icons.construction,
    Icons.show_chart,
    Icons.alarm,
    Icons.show_chart,
  ];
  final List<AssignedTasksInHome> Assignedtaskshome = List.generate(
      assignedJobNo.length,
      (index) => AssignedTasksInHome(assignedJobNo[index],
          assignedDescription[index], assignedTastIcons[index]));

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
                              Icons.location_on_sharp,
                              color: Colors.white,
                            ),
                            Text(
                              "Active Jobs",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 35.0),
                            child: Text(
                              "Job #" + "                  " + "Description",
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
                        itemCount: Activejobs.length,
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
                                  child: Text(
                                    Activejobs[index].jobNumber.toString() +
                                        "                         " +
                                        Activejobs[index].jobDescription,
                                    style: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold),
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
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Job #" + "                     " + "Description",
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
                        itemCount: Assignedtaskshome.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const Divider(
                                thickness: 2,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      color: Colors.red,
                                      height: 40,
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      child: Row(
                                        children: [
                                          Text(
                                            Assignedtaskshome[index]
                                                    .jobNumber
                                                    .toString() +
                                                "                   ",
                                            style: const TextStyle(
                                                color: Colors.black38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(Assignedtaskshome[index].icon,
                                              color: Colors.black54),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            Assignedtaskshome[index]
                                                .jobDescription,
                                            style: const TextStyle(
                                                color: Colors.black38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
        snakeShape: SnakeShape.circle,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(25),
        behaviour: SnakeBarBehaviour.pinned,
        height: 50,
        elevation: 5,
        snakeViewColor: const Color(0xFFF47621),
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
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
            ),
          ),
          const BottomNavigationBarItem(
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
              backgroundColor:
                  index == 2 ? const Color(0xFFF47621) : Colors.white,
              elevation: 5,
              child: Icon(Icons.home,
                  size: 40, color: index == 2 ? Colors.white : Colors.grey),
              onPressed: () {}),
        ),
      ),
    );
  }
}
