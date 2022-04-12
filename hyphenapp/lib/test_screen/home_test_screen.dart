import 'package:flutter/material.dart';
import 'package:hyphenapp/test%20data/ActiveJobsDataModel.dart';
import 'package:hyphenapp/test%20data/AssignedTasksHomeDataModel.dart';

class HomeTestScreen extends StatefulWidget {
  const HomeTestScreen({Key key}) : super(key: key);

  @override
  State<HomeTestScreen> createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends State<HomeTestScreen> {
  static List<int> jobNo = [1, 2, 3, 45656552, 5, 6, 8];
  static List<String> description = [
    'Error Residence-Structural',
    'Error Residence-Content Replica ',
    'PLA Building',
    'Blaise Cabin',
    'Brockwell Residence',
    'Winslow Garage',
    'Boriston Exterior',
  ];

  final List<ActiveJobs> Activejobs = List.generate(
      jobNo.length, (index) => ActiveJobs(jobNo[index], description[index]));

  static List<int> assignedJobNo = [5421, 8463, 2675, 5423];
  static List<String> assignedDescription = [
    'Call customer re:nail pops',
    'Site Prep',
    'Schedule Customer Visit',
    'Site Prep',
  ];
  static List<IconData> assignedTaskIcons = [
    Icons.construction,
    Icons.show_chart,
    Icons.alarm,
    Icons.show_chart,
  ];
  final List<AssignedTasksInHome> Assignedtaskshome = List.generate(
      assignedJobNo.length,
      (index) => AssignedTasksInHome(assignedJobNo[index],
          assignedDescription[index], assignedTaskIcons[index]));
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Active Jobs",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15.0,
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
                    Expanded(
                      child: Text(
                        "Job #",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito',
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    Activejobs[index].jobNumber.toString(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    Activejobs[index].jobDescription,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w600),
                                  ),
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
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15),
              ),
            ),
            elevation: 0,
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
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Assigned Tasks",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15.0,
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
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito',
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  children: [
                                    Text(
                                      Assignedtaskshome[index]
                                              .jobNumber
                                              .toString() +
                                          "                   ",
                                      style: const TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(Assignedtaskshome[index].icon,
                                        color: Colors.black54),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      Assignedtaskshome[index].jobDescription,
                                      style: const TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w600),
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
    );
  }
}
