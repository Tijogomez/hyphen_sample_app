import 'package:flutter/material.dart';
import 'package:hyphenapp/test%20data/JobsDataModel.dart';

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

  final List<Jobs> JobsSection = List.generate(jobnmbr.length,
      (index) => Jobs(jobnmbr[index], jobDesc[index], jobStatus[index]));
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
                                  JobsSection[index].jobNumber.toString() +
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
    );
  }
}
