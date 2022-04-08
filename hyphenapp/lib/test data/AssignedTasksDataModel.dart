import 'package:flutter/cupertino.dart';

class AssignedTasksGet {
  final String jobHeading, status, jobDescription;
  final String schedStart, schedEnd, actStart;
  final int jobNumber;
  final IconData icon;

  AssignedTasksGet(this.jobHeading, this.status, this.schedStart, this.schedEnd,
      this.actStart, this.jobDescription, this.jobNumber, this.icon);
}
