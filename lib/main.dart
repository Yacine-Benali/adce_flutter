import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('yyyyyyyyyyyyyyy'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .doc('testCollection/testDocument')
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            int data = snapshot.data['counter'];
            print(data);
            return Center(
                child: Text(
              '$data',
              style: TextStyle(fontSize: 30),
            ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          counter++;

          final documentReference =
              FirebaseFirestore.instance.doc('testCollection/testDocument');
          await documentReference.set(
            {'counter': counter},
          );

          print('value of counter = $counter');
          setState(() {});
        },
        child: Icon(
          Icons.ac_unit_sharp,
          size: 50,
        ),
      ),
    );
  }
}
