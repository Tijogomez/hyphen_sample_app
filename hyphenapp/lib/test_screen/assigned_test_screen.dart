import 'package:flutter/material.dart';
import 'package:hyphenapp/screens/task_detail_screen.dart';
import 'package:hyphenapp/test%20data/AssignedTasksDataModel.dart';
import 'package:animate_icons/animate_icons.dart';

class AssignedTestScreen extends StatefulWidget {
  const AssignedTestScreen({Key key}) : super(key: key);

  @override
  State<AssignedTestScreen> createState() => _AssignedTestScreenState();
}

class _AssignedTestScreenState extends State<AssignedTestScreen> {
  Key _expansionTileKey;
  bool isExpanded = false;
  AnimateIconController _iconAnimation;

  @override
  void initState() {
    _iconAnimation = AnimateIconController();
    super.initState();
  }

  expandTile() {
    setState(() {
      _expansionTileKey = UniqueKey();
      isExpanded = true;
      _iconAnimation.animateToEnd();
    });
  }

  shrinkTile() {
    setState(() {
      _expansionTileKey = UniqueKey();
      isExpanded = false;
      _iconAnimation.animateToStart();
    });
  }

  toggleExpanded() {
    setState(() {
      isExpanded
          ? {
              isExpanded = false,
              _iconAnimation.animateToStart(),
            }
          : {
              isExpanded = true,
              _iconAnimation.animateToEnd(),
            };
    });
  }

  static List<String> heading = [
    'P7 Paint Exterior',
  ];
  static List<String> status = [
    'Complete',
  ];
  static List<String> description = [
    'Paradise Nest',
  ];
  static List<String> schedstart = [
    '12/23/2023',
  ];
  static List<String> schedend = [
    '12/23/2023',
  ];
  static List<String> actstart = [
    '04/21/2022',
  ];
  static List<String> actend = [];
  static List<int> jobnumber = [25];
  static List<IconData> taskicon = [
    Icons.done_all,
  ];

  final List<AssignedTasksGet> Assignedtasks = List.generate(
    heading.length,
    (index) => AssignedTasksGet(
        heading[index],
        status[index],
        schedstart[index],
        schedend[index],
        actstart[index],
        description[index],
        jobnumber[index],
        taskicon[index]),
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15),
          ),
        ),
        elevation: 0,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
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
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Assigned Tasks",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        isExpanded ? shrinkTile() : expandTile();
                      },
                      child: Text(
                        isExpanded ? "Collapse All" : "Expand All",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
                AnimateIcons(
                  startIcon: Icons.keyboard_arrow_down,
                  endIcon: Icons.keyboard_arrow_up,
                  startIconColor: Colors.grey,
                  endIconColor: Colors.grey,
                  duration: Duration(milliseconds: 200),
                  controller: _iconAnimation,
                  onStartIconPress: () {
                    toggleExpanded();
                  },
                  onEndIconPress: () {
                    toggleExpanded();
                  },
                )
              ],
            ),
            ExpansionTile(
                key: _expansionTileKey,
                initiallyExpanded: isExpanded,
                onExpansionChanged: (bool _placeholder) {
                  toggleExpanded();
                },
                title: Text(
                  "Phase 07 Exterior Finishes",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.grey,
                collapsedBackgroundColor: Colors.grey,
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: Assignedtasks.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TaskDetail(
                                      name: Assignedtasks[index].jobHeading,
                                      description:
                                          Assignedtasks[index].jobDescription,
                                      number: Assignedtasks[index].jobNumber,
                                      schedstart:
                                          Assignedtasks[index].schedStart,
                                      actstart: Assignedtasks[index].actStart,
                                    ),
                                  ));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, right: 12, left: 12, bottom: 12),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                      Assignedtasks[index].icon,
                                                      color: Colors.black54),
                                                  // SizedBox(width: 100.0),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    Assignedtasks[index]
                                                        .jobHeading,
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Job' +
                                                    ' ' +
                                                    Assignedtasks[index]
                                                        .jobNumber
                                                        .toString() +
                                                    ' ' '-' +
                                                    ' ' +
                                                    Assignedtasks[index]
                                                        .jobDescription,
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          // SizedBox(width: 150.0),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Container(
                                                width: 70,
                                                child: Text(
                                                  Assignedtasks[index].status,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    fontFamily: 'Nunito',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xFFF47621),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Sched Start:' +
                                                      Assignedtasks[index]
                                                          .schedStart,
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  'Sched End:' +
                                                      " " +
                                                      Assignedtasks[index]
                                                          .schedEnd,
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Act Start:' +
                                                      Assignedtasks[index]
                                                          .actStart,
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "Act End:",
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 4.0),
                                            child: Container(
                                              width: 10,
                                              child: Icon(
                                                Icons.chevron_right,
                                                size: 35,
                                                color: Color(0xFFF47621),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Divider(
                                //   thickness: 2,
                                // ),
                              ],
                            ),
                          );
                        }),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
