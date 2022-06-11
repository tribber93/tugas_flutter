import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tugas Pertemuan 8",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/pertama',
      routes: {
        '/pertama': (context) => const MyHomePage(title: 'Halaman Pertama'),
        '/kedua': (context) => const SecondPage(),
        '/ketiga': (context) => const ThirdPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Counter App menggunakan State Management Default Flutter',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                child: const Text('Ke Halaman 2'),
                onPressed: () {
                  Navigator.pushNamed(context, '/kedua',
                      arguments: Data('$_counter', 'Halaman Kedua'));
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Ke Halaman 3'),
                onPressed: () {
                  Navigator.pushNamed(context, '/ketiga',
                      arguments: Data('$_counter', 'Halaman Ketiga'));
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count,
                style: const TextStyle(fontSize: 50, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count,
                style: const TextStyle(fontSize: 50, color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}

class Data {
  final String title;
  final String count;

  Data(this.count, this.title);
}
