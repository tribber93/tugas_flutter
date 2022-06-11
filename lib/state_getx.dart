import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      title: 'Tugas Pertemuan 8',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Klik: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Counter App menggunakan State Management Getx'),
              const SizedBox(height: 20),
              ElevatedButton(
                  child: const Text("-> Kedua"),
                  onPressed: () => Get.to(Kedua())),
              const SizedBox(height: 20),
              ElevatedButton(
                  child: const Text("-> Ketiga"),
                  onPressed: () => Get.to(Ketiga())),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Kedua extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: Text("Halaman Kedua")),
        body: Center(
            child: Text(
          "${c.count}",
          style: const TextStyle(fontSize: 50, color: Colors.amber),
        )));
  }
}

class Ketiga extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: Text("Halaman Ketiga")),
        body: Center(
            child: Text(
          "${c.count}",
          style: const TextStyle(fontSize: 50, color: Colors.green),
        )));
  }
}
