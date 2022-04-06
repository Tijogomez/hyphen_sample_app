class AssignedTasksGet {
  final String jobHeading, status, jobDescription;
  final double schedStart, schedEnd, actStart, actEnd;
  final int jobNumber;

  AssignedTasksGet(this.jobHeading, this.status, this.schedStart, this.schedEnd,
      this.actStart, this.actEnd, this.jobDescription, this.jobNumber);
}
