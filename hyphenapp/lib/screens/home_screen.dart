import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hyphenapp/test%20data/ActiveJobsDataModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  int _selectedIndex = 0;

  final List<ActiveJobs> Activejobs = List.generate(
      jobNo.length, (index) => ActiveJobs(jobNo[index], description[index]));

  int index = 2;
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.location_on_sharp, size: 30),
      Icon(Icons.assignment_turned_in, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.menu, size: 30),
    ];
    return Scaffold(
      appBar: AppBar(
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
        title: const Text(
          "Username",
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.0,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              child: Text("U"),
              radius: 20,
            ),
          ),
        ],
      ),
      body: Card(
        elevation: 5,
        child: ListView.builder(
            itemCount: Activejobs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(Activejobs[index].JobNumber.toString() +
                    "               " +
                    Activejobs[index].JobDescription),
                onTap: () {},
              );
            }),
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
        snakeViewColor: Colors.orange,
        selectedItemColor:
            SnakeShape.circle == SnakeShape.indicator ? Colors.black : null,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
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
          child: FloatingActionButton(onPressed: () {}),
        ),
      ),
    );
  }
}
