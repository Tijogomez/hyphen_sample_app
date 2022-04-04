import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/app_icon.png'),
        ),
        title: const Text(
          "Username",
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.0,
          ),
        ),

        //  Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: CircleAvatar(
        //     backgroundColor: Colors.orange,
        //     foregroundColor: Colors.white,
        //     child: Text("U"),
        //     radius: 20,
        //   ),
        // ),
      ),
    );
  }
}
