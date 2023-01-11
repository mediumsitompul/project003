import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login_success.dart';
import 'login_failed.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';


main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: const Center(child: Text('PROJECT002\n(Encryption)')),),
      //body: Text('Data'),
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
  bool _isObscure = true; //default value = not visible icon, obscure
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  Future<void> _login() async{
    var url = Uri.parse("http://192.168.100.100:8087/flutter_/login_.php");
    var response = await http.post(url, body: {
      "username":usernameController.text, 
      //"password":passwordController.text,
      //"password":generateMD5(passwordController.text),
      "password":encode64(passwordController.text),

      });
    
    
    var datauser = jsonDecode(response.body);

    print(datauser);
    //print(generateMD5(passwordController.text));
    print(encode64(passwordController.text));




    if(datauser !=""){
      print("Login Success");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp1()));
    }else{
      print("Login Failed");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp2()));
    }

  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Image(
            height: 100,
            width: 100,
            image: AssetImage("assets/images/medium.jpg"),),


          const Text('Sign-In'),

          Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: usernameController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username'
              ),
            ),
          ),


                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            icon: Icon(
                                //!_isObscure  //initial condition = not visible
                                _isObscure == false // initial condition = not visible
                                ? Icons.visibility
                                : Icons.visibility_off), //default visible
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }
                            ),
                            ),
                    ),
                  ),

          ElevatedButton(onPressed: (){
            _login();
          }, child: const Text('LOGIN'))

        ],
      ),
    );
  }
}

generateMD5(String data){
  var content = Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}


encode64(String data){
  var content = Utf8Encoder().convert(data);
  var digest_ = hex.encode(content);
  var encode64 = base64.encode(utf8.encode(digest_));
  return encode64;
}
