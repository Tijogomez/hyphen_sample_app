import 'package:hyphenapp/test%20data/JobsDataModel.dart';

List statusFilter = [];

List<Jobs> filterData(List<Jobs> data) {
  if (statusFilter.isNotEmpty) {
    return data
        .where((i) => statusFilter.any((filter) => filter == i.status))
        .toList();
  } else {
    return data;
  }
}
