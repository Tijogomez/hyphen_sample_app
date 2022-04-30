import 'package:flutter/material.dart';
import 'package:hyphenapp/screens/home_screen.dart';
import 'package:hyphenapp/test%20data/JobsDataModel.dart';
import 'package:hyphenapp/utils/filter.dart';

class JobTestScreen extends StatefulWidget {
  const JobTestScreen({Key key}) : super(key: key);

  @override
  State<JobTestScreen> createState() => _JobTestScreenState();
}

class _JobTestScreenState extends State<JobTestScreen> {
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

  static final List<Jobs> JobsInfoList = List.generate(jobnmbr.length,
      (index) => Jobs(jobnmbr[index], jobDesc[index], jobStatus[index]));
  List<Jobs> JobSection = filterData(JobsInfoList);

  @override
  Widget build(BuildContext context) {
    print(JobSection[0].jobDescription.toString());
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Jobs",
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            ),
                            onTap: () {
                              scaffoldKey.currentState.openEndDrawer();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 5, 4),
                  child: Row(
                    children: const [
                      Text(
                        "Job #",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                          child: Text(
                            "Description",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Status",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: JobSection.length,
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
                            padding: const EdgeInsets.fromLTRB(40, 4, 5, 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  JobSection[index].jobNumber.toString(),
                                  style: const TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(50, 0, 20, 0),
                                    child: Text(
                                      JobSection[index].jobDescription,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Text(
                                  JobSection[index].status,
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
    );
  }
}
