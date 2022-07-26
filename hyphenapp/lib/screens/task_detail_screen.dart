import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  final String name;
  final String description;
  final int number;
  final String schedstart;
  final String actstart;

  const TaskDetail({
    Key key,
    this.name,
    this.description,
    this.number,
    this.schedstart,
    this.actstart,
  }) : super(key: key);

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 80.0),
          child: Icon(
            Icons.location_pin,
            color: Colors.black54,
          ),
        ),
        title: Text(
          'Job ${widget.number} ${widget.description}',
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100.0,
                    ),
                    const Text(
                      "Task Details",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 110.0),
                      child: Icon(
                        Icons.save,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.done_all,
                        size: 35.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Job ${widget.number} ${widget.description}',
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Notes :',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextFormField(
                                maxLines: 4,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Phase :',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: SizedBox(
                                height: 35,
                                child: DropdownButtonFormField(
                                  hint: Text(
                                    '07 Exterior Finishes',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  iconDisabledColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 55),
                        child: Row(
                          children: [
                            const Text(
                              'Proj Start:',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SizedBox(
                                height: 35,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: widget.schedstart,
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: Icon(Icons.date_range),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 60),
                        child: Row(
                          children: [
                            const Text(
                              'Act Start:',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SizedBox(
                                height: 35,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: widget.actstart,
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: const Icon(Icons.date_range),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: Row(
                          children: [
                            const Text(
                              'Proj Complete:',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SizedBox(
                                height: 35,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: widget.schedstart,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      suffixIcon: const Icon(Icons.date_range),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(0))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Row(
                          children: [
                            const Text(
                              'Act Complete:',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SizedBox(
                                height: 35,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: const Icon(Icons.date_range),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Category:',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: SizedBox(
                                height: 35,
                                child: DropdownButtonFormField(
                                  hint: const Text(
                                    '33-Paint & Wall Covering ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  iconDisabledColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'SubCategory:',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: SizedBox(
                                height: 35,
                                child: DropdownButtonFormField(
                                  hint: const Text(
                                    '33-10 Painting - Exterior ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  iconDisabledColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: () {},
                        child: const Text(
                          'Update Template',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
