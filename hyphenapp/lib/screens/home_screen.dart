import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hyphenapp/test_screen/assigned_test_screen.dart';
import 'package:hyphenapp/utils/filter.dart';
import '../test_screen/home_test_screen.dart';
import 'package:hyphenapp/test_screen/home_test_screen.dart';
import '../test_screen/job_test_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

bool _close = false;
bool _open = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _widgetOptions = <Widget>[
    const JobTestScreen(),
    const AssignedTestScreen(),
    const HomeTestScreen(),
    const HomeTestScreen(),
    const HomeTestScreen(),
  ];

  int index = 2;
  @override
  Widget build(BuildContext scaffoldContext) {
    bool _est = statusFilter.contains('E');
    bool _contract = statusFilter.contains('X');
    bool _active = statusFilter.contains('A');
    bool _cancel = statusFilter.contains('C');
    bool _other = statusFilter.contains('O');
    bool _finished = statusFilter.contains('F');
    bool _hold = statusFilter.contains('H');

    var _allFilterElements = ['E', 'X', 'A', 'C', 'O', 'F', 'H'];
    bool _all = statusFilter.toSet().containsAll(_allFilterElements.toSet());

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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              // onSelected: (value) {
              //   Navigator.of(context, rootNavigator: true).pushReplacement(
              //     new MaterialPageRoute(
              //       builder: (BuildContext context) => new MyApp(),
              //     ),
              //   );
              // },
              child: const CircleAvatar(
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
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.assignment_turned_in,
                          color: Colors.black45,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Logout',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(index),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Filter Jobs",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _open ? false : true;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _open ? const Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text("Open",
                          style: TextStyle(
                              color: _open
                                  ? Colors.white
                                  : const Color(0xFFF47621))),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _close ? false : true;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _close ? const Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text("Closed",
                          style: TextStyle(
                              color: _close
                                  ? Colors.white
                                  : const Color(0xFFF47621))),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Status"),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _all
                              ? statusFilter.clear()
                              : statusFilter
                                  .addAll(['A', 'E', 'X', 'C', 'O', 'F', 'H']);
                        });
                      },
                      child: Text(
                        _all ? "Deselect All" : "Select All",
                        style: const TextStyle(
                            color: Color(0xFFF47621),
                            decoration: TextDecoration.underline),
                      ),
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                      ),
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
                            _est ? const Color(0xFFF47621) : Colors.white),
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            return Colors.transparent;
                          },
                        ),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Estimate",
                        style: TextStyle(
                            color:
                                _est ? Colors.white : const Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _est
                              ? statusFilter.remove('E')
                              : statusFilter.add('E');
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _contract ? const Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Contract",
                        style: TextStyle(
                            color: _contract
                                ? Colors.white
                                : const Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _contract
                              ? statusFilter.remove('X')
                              : statusFilter.add('X');
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _active ? const Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Active",
                        style: TextStyle(
                            color: _active
                                ? Colors.white
                                : const Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _active
                              ? statusFilter.remove('A')
                              : statusFilter.add('A');
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _cancel ? const Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Cancelled",
                        style: TextStyle(
                            color: _cancel
                                ? Colors.white
                                : const Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _cancel
                              ? statusFilter.remove('C')
                              : statusFilter.add('C');
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _other ? const Color(0xFFF47621) : Colors.white),
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            return Colors.transparent;
                          },
                        ),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Other  ",
                        style: TextStyle(
                          color:
                              _other ? Colors.white : const Color(0xFFF47621),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _other
                              ? statusFilter.remove('O')
                              : statusFilter.add('O');
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _finished ? const Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "Finished",
                        style: TextStyle(
                            color: _finished
                                ? Colors.white
                                : const Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _finished
                              ? statusFilter.remove('F')
                              : statusFilter.add('F');
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _hold ? const Color(0xFFF47621) : Colors.white),
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xFFF47621))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0))),
                      ),
                      child: Text(
                        "On Hold",
                        style: TextStyle(
                            color:
                                _hold ? Colors.white : const Color(0xFFF47621)),
                      ),
                      onPressed: () {
                        setState(() {
                          _hold
                              ? statusFilter.remove('H')
                              : statusFilter.add('H');
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
                        primary: const Color(0xFFF47621),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        listRefreshKey.currentState.show();
                      },
                      child: const Text('Apply'),
                    ),
                  ),
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
          const BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(
                Icons.location_pin,
                size: 30,
              ),
            ),
          ),
          const BottomNavigationBarItem(
            icon: const InkWell(
              child: const Icon(
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
                  child: const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              const Text(
                                'v1.2.1 dev',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: const [
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
                              const SizedBox(
                                height: 15.0,
                              )
                            ],
                          ),
                          value: "jobs",
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: const [
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
