import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hyphenapp/main.dart';
import 'package:hyphenapp/test_screen/assigned_test_screen.dart';
import 'package:hyphenapp/utils/filter.dart';
import '../test_screen/home_test_screen.dart';
import 'package:hyphenapp/test_screen/home_test_screen.dart';
import '../test_screen/job_test_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
    HomeTestScreen(),
    HomeTestScreen(),
  ];

  int index = 2;
  @override
  Widget build(BuildContext scaffoldContext) {
    bool _close = false;
    bool _open = false;
    bool _est = statusFilter.contains('E');
    bool _contract = statusFilter.contains('X');
    bool _active = statusFilter.contains('A');
    bool _cancel = statusFilter.contains('C');
    bool _other = statusFilter.contains('O');
    bool _finished = statusFilter.contains('F');
    bool _hold = statusFilter.contains('H');

    print(_est);

    return Scaffold(
      key: scaffoldKey,
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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: PopupMenuButton(
              onSelected: (value) {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new MyApp(),
                  ),
                );
              },
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
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.assignment_turned_in,
                        color: Colors.black45,
                      ),
                      Row(
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Card(
          elevation: 0,
          child: SingleChildScrollView(
            child: _widgetOptions.elementAt(index),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter Jobs",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text("Open"),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text("Closed"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Status"),
                    TextButton(
                      onPressed: () {},
                      child: Text("Select All"),
                    ),
                  ],
                ),
                GridView.count(
                  childAspectRatio: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _est ? Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red;
                          }
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Estimate",
                        style: TextStyle(
                            color: _est ? Colors.white : Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _est
                              ? statusFilter.remove('E')
                              : statusFilter.add('E');
                          print(statusFilter);
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _contract ? Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Contract",
                        style: TextStyle(
                            color:
                                _contract ? Colors.white : Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _contract
                              ? statusFilter.remove('X')
                              : statusFilter.add('X');
                          print(statusFilter);
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _active ? Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Active",
                        style: TextStyle(
                            color: _active ? Colors.white : Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _active
                              ? statusFilter.remove('A')
                              : statusFilter.add('A');
                          print(statusFilter);
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _cancel ? Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Cancelled",
                        style: TextStyle(
                            color: _cancel ? Colors.white : Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _cancel
                              ? statusFilter.remove('C')
                              : statusFilter.add('C');
                          print(statusFilter);
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _other ? Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Other  ",
                        style: TextStyle(
                            color: _other ? Colors.white : Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _other
                              ? statusFilter.remove('O')
                              : statusFilter.add('O');
                          print(statusFilter);
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _finished ? Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Finished",
                        style: TextStyle(
                            color:
                                _finished ? Colors.white : Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _finished
                              ? statusFilter.remove('F')
                              : statusFilter.add('F');
                          print(statusFilter);
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _hold ? Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "On Hold",
                        style: TextStyle(
                            color: _hold ? Colors.white : Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _hold
                              ? statusFilter.remove('H')
                              : statusFilter.add('H');
                          print(statusFilter);
                        });
                      },
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF47621),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          listKey.currentState.build(context);
                        },
                        child: Text('Apply'),
                      )),
                )
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
              child: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'jobs') {
                      setState(() {
                        this.index = 0;
                      });
                    } else if (value == 'tasks') {
                      setState(() {
                        this.index = 1;
                      });
                    }
                  },
                  child: Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              Text(
                                'v1.2.1 dev',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'Jobs',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              )
                            ],
                          ),
                          value: "jobs",
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(Icons.assignment_turned_in),
                              Text(
                                'Tasks',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          value: 'tasks',
                        )
                      ]),
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
