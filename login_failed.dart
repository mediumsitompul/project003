import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp2());
}


class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Center(child: Text('LOGIN FAILED')),),
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
      body: Center(child: Text('FAILED')),
    );
  }
}
