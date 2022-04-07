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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text('Job' +
                                ' ' +
                                Assignedtasks[index].jobNumber.toString() +
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
    );
  }
}
