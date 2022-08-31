import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menggunakan Change Notifier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //1 Instantiate the object
  final Dog dog = Dog(name: 'Kevin', age: 25, breed: 'anjing');
  @override
  void initState() {
    //2 Adding listener to the object
    dog.addListener(dogListener);
    super.initState();
  }

  @override
  void dispose() {

    //3 remove the listener when not in use
    dog.removeListener(dogListener);
    super.dispose();
  }

  void dogListener() {
    print('from listener, age => ${dog.age}');
    //4 Call set state
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menggunakan Change notifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${dog.name}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            BreedAndAge(
              dog: dog,
            ),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key, required this.dog}) : super(key: key);
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${dog.breed}',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 10.0),
        Age(
          dog: dog,
        ),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key, required this.dog}) : super(key: key);
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${dog.age}',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () => dog.grow(),
          child: Text(
            'Grow',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
