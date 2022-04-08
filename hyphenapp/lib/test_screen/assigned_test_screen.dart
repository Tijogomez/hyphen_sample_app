import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hyphenapp/test%20data/AssignedTasksDataModel.dart';

class AssignedTestScreen extends StatefulWidget {
  const AssignedTestScreen({Key key}) : super(key: key);

  @override
  State<AssignedTestScreen> createState() => _AssignedTestScreenState();
}

class _AssignedTestScreenState extends State<AssignedTestScreen> {
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
  static List<String> schedstart = [
    '10 / 15 / 21',
    '10 / 24 / 21',
    '11 / 1 / 21',
    '11 / 10 / 21',
    '11 / 16 / 21',
    '12 / 12 / 21'
  ];
  static List<String> schedend = [
    '10 / 31 / 21',
    '11 / 2 / 21',
    '11 / 15 / 21',
    '11 / 10 / 21',
    '11 / 30 / 21',
    '5 / 5 / 21'
  ];
  static List<String> actstart = [
    '10 / 3 / 21',
    '10 / 24 / 21',
    '',
    '',
    '',
    ''
  ];
  static List<String> actend = [];
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
          description[index],
          jobnumber[index],
          taskicon[index]));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        shape: RoundedRectangleBorder(
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
                        padding: const EdgeInsets.only(
                            top: 0, right: 12, left: 12, bottom: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Assignedtasks[index].icon,
                                            color: Colors.black54),
                                        // SizedBox(width: 100.0),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          Assignedtasks[index].jobHeading,
                                          style: TextStyle(
                                              fontFamily:
                                                  'assets/fonts/Nunito-Regular.ttf',
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
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
                                          Assignedtasks[index].jobDescription,
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                // SizedBox(width: 150.0),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Container(
                                      width: 65,
                                      child: Text(
                                        Assignedtasks[index].status,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 15.0,
                                          fontFamily:
                                              'assets/fonts/Nunito-Regular.ttf',
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFFF47621),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            Assignedtasks[index].schedStart,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Sched End:' +
                                            " " +
                                            Assignedtasks[index].schedEnd,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w600),
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
                                            Assignedtasks[index].actStart,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Act End:",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
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
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
