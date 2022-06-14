import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HalamanSatu(),
    HalamanDua(),
    HalamanTiga(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar:
          AppBar(title: Text("Counter App menggunakan State Management Getx")),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.first_page),
            label: 'Halaman Satu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: 'Halaman Dua',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.last_page),
            label: 'Halaman Tiga',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment)
          : null,
    );
    ;
  }
}

class HalamanSatu extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Center(
        child: Obx(() => Text(
              "${c.count}",
              style: TextStyle(fontSize: 50, color: Colors.red),
            )));
  }
}

class HalamanDua extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Center(
        child: Text(
      "${c.count}",
      style: TextStyle(fontSize: 50, color: Colors.amberAccent),
    ));
  }
}

class HalamanTiga extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Center(
        child: Text(
      "${c.count}",
      style: TextStyle(fontSize: 50, color: Colors.green),
    ));
  }
}
