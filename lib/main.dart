//import 'package:db003_b_try/sqldb.dart';
import 'package:mad_lesson1_2425/DatabaseHelper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

//TextEditingController delcon=TextEditingController();
//TextEditingController newnote=TextEditingController();
//TextEditingController readcon=TextEditingController();


  SqlDb sqlDb=SqlDb();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
               // controller: newnote,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                                    labelText: 'Enter a note',
                  hintText: 'Enter your Note overe here',
                ),      ), ),*/
            Center(
              child: MaterialButton(
                color: Colors.amber,
                onPressed:() async{
                  int response = await sqlDb.insertData("INSERT INTO 'notes' ('note') VALUES ('my note is ..... some text over here ')");
                  print(response);
                },
                child:Text("Insert data"),
              ),
            ),
            /*Center(
              child: TextField(
              //  controller: readcon,
              ),
            ),*/
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed:() async{
                  List<Map> response=  await sqlDb.readData("SELECT * FROM 'notes' where id=1");
                  print(response);

                },
                child:Text("Read data"),
              ),
            ),
            /*Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              //controller: delcon,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'note No to delet',
                         hintText: 'Enter a Note No. to be deleted',
                ),      ), ),*/
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed:() async{
                  int response=  await sqlDb.deleteData("DELETE FROM 'notes' WHERE id=1");
                  print(response);

                },
                child:Text("Delete data"),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed:() async{
                  int response=  await sqlDb.updateData("UPDATE 'notes' SET note = 'not two' WHERE id = 2");
                  print(response);

                },
                child:Text("update data"),
              ),
            )
          ],
        ),
      ),       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}