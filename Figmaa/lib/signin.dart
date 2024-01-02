import 'package:figmaa/Signup.dart';
import 'package:figmaa/home.dart';
import 'package:figmaa/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        centerTitle: true,
        title: Text(

          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
            ,
            // color: Colors.black, // Change the color as needed
          ),
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 38.0),
          icon:const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 90.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: const Text(
                'Email',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0),
              child:  const TextField(
                decoration: InputDecoration(
                  hintText: '',
                  border: OutlineInputBorder(),
                  // borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.only(left: 8.0),
              child: const Text(
                'Password',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '',
                  border: OutlineInputBorder(),
                  // borderRadius/: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.only(top: 30.0, left: 17.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomeApp(),)
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromRGBO(15,136, 148, 1),
                  textStyle: const TextStyle(color: Colors.white),
                  fixedSize: Size(370.0, 55.0),
                  // padding: const EdgeInsets.fromLTRB(16.0, 44.92, 16.0, 44.92),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.49),
                  ),
                  side: BorderSide(width: 1.0, color: Colors.blue),
                  // elevation: 0.0,
                ),
                child: const Text('Sign in',
                  style: TextStyle(color: Colors.white,fontSize: 22),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.only(left: 190.0),
              child: const Text(

                'OR',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 370,
                    child: ElevatedButton(

                      onPressed: () {
                        // Implement Sign In with Email logic
                      },

                      child: const Text('Sign In with Email'
                          , style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)
                      ),

                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 50,
                    width: 370,
                    child: ElevatedButton(

                      onPressed: () {
                        // Implement Sign In with Email logic
                      },

                      child: const Text('Continue with Google'
                          , style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)
                      ),

                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 50,
                    width: 370,
                    child: ElevatedButton(

                      onPressed: () {
                        // Implement Sign In with Email logic
                      },

                      child: const Text('Continue with Apple'
                          , style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)
                      ),

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),

          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}