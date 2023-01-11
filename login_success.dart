import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp1());
}


class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: const Center(child: Text('LOGIN SUCCESS')),),
      body: const MyProject001(),
      ),
    );
  }
}



class MyProject001 extends StatefulWidget {
  const MyProject001({Key? key}) : super(key: key);

  @override
  State<MyProject001> createState() => _MyProject001State();
}

class _MyProject001State extends State<MyProject001> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SUCCESS')),
    );
  }
}
