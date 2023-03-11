import 'package:flutter/cupertino.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fiplus'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<bool> IsSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  void _incrementCounter() {
    setState(() {
      IsSelected[_counter] = true;
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      IsSelected[_counter - 1] = false;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15),
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CupertinoColors.systemGrey6),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/Tacos Food.jpg'),
                ),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
            itemBuilder: (context, index) {
              return Card(
                  elevation: 15,
                  color: CupertinoColors.systemGrey6,
                  child: GridTile(
                    child: Visibility(
                        visible: IsSelected[index],
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 50,
                        )),
                  ));
            },
            itemCount: IsSelected.length,
          ),
        ],
      ),
      persistentFooterButtons: [
        Visibility(
          visible: _counter == 0 ? false : true,
          child: FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ),
        Visibility(
          visible: _counter == 12 ? false : true,
          child: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
