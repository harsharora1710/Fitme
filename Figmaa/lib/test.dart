import 'dart:async';

import 'package:flutter/material.dart';



class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
         SingleChildScrollView(
           child: Column(
            children: [
              const SizedBox(height: 40,),
              Row(
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(left: 38.0),
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 68.0),
                    child: Text(
                      "Arm Raises",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 38.0,bottom: 20),
                child: Text(
                  "5 mins",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CountdownContainer(),
                  ImageContainer(),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 5,
                width: 350,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text(
                  "What color is the text?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text(
                  "Yellow",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 280,
                decoration: BoxDecoration(
           
                  border:  Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
           
                child: const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    "Green",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
           
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: 280,
                decoration: BoxDecoration(
           
                  border:  Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    "Red",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
           
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: 280,
                decoration: BoxDecoration(
           
                  border:  Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    "Yellow",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
           
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: 280,
                decoration: BoxDecoration(
           
                  border:  Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    "Blue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
           
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  // Implement Sign In button logic
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.red,
                  textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 30),
                  fixedSize: Size(370.0, 55.0),
                  // padding: const EdgeInsets.fromLTRB(16.0, 44.92, 16.0, 44.92),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.49),
                  ),
                  side: BorderSide(width: 1.0, color: Colors.blue),
                  // elevation: 0.0,
                ),
                child: const Text('Hold To Stop',
                  style: TextStyle(color: Colors.white,fontSize: 22),
                ),
              ),
              SizedBox(height: 20,)
            ],
                   ),
         )








    );
  }
}

class CountdownContainer extends StatefulWidget {
  const CountdownContainer({super.key});

  @override
  CountdownContainerState createState() => CountdownContainerState();
}

class CountdownContainerState extends State<CountdownContainer> {
  late Timer _timer;
  int _countdown = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  Color getColor() {
    if (_countdown > 30) {
      return Colors.green;
    } else if (_countdown > 10) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.black,width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: getColor(), width: 6),
        ),
        child: Center(
          child: Text(
            '$_countdown',
            style: TextStyle(
              fontSize: 24,
              color: getColor(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        'https://placekitten.com/200/200', // Replace with your image URL
        width: 100,
        height: 100,
      ),
    );
  }
}
