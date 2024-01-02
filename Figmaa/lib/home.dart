import 'package:figmaa/test.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    // 'https://images.pexels.com/photos/6889088/pexels-photo-6889088.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/10643964/pexels-photo-10643964.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/7780128/pexels-photo-7780128.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/7573942/pexels-photo-7573942.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/3390587/pexels-photo-3390587.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'
  ];
  final List<Widget> _pages = [
    FirstPage(),
    SecondPage(),
    SecondPage(),

    ThirdPage(),
  ];


  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_sharp),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
          backgroundColor: Colors.blue, // Set the background color here
          selectedItemColor: Colors.brown, // Set the selected item color
          unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> _images = [
    // 'https://images.pexels.com/photos/6889088/pexels-photo-6889088.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/10643964/pexels-photo-10643964.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/7780128/pexels-photo-7780128.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/7573942/pexels-photo-7573942.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/3390587/pexels-photo-3390587.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'
  ];

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _images.length; i++) {
      indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
  @override
  Widget build(BuildContext context) {
    return
       // Column(
       //  children: [
       //    const Row(
       //      children: [
       //        Column(
       //          children: [
       //            Text('Hi, Neha ',style: TextStyle (fontSize: 16),),
       //            Text('Lets Get Started',style: TextStyle (fontSize: 12),)
       //          ],
       //        ),
       //        Center(
       //          child: CircleAvatar(
       //            radius: 20, // Adjust the radius as needed
       //            backgroundImage: AssetImage('https://images.pexels.com/photos/6889088/pexels-photo-6889088.jpeg?auto=compress&cs=tinysrgb&w=1600'), // Replace with your image asset
       //          ),
       //        ),
       //      ],
       //    ),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60,),
                  const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Hi, Neha ',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                          Text('Lets Get Started',style: TextStyle (fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: CircleAvatar(
                          radius: 20, // Adjust the radius as needed
                          backgroundImage: NetworkImage('https://images.pexels.com/photos/6889088/pexels-photo-6889088.jpeg?auto=compress&cs=tinysrgb&w=1600'), // Replace with your image asset
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 190,
            
                  width: double.infinity,
                  child: Stack(
                    // alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            _images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      const Positioned(
                        top: 160,
                        left: 20,
                        child: Text(
                          'Get Your Hip Pro+ Today.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
            
                ),
                SizedBox(height: 10),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _buildPageIndicator()
                  ),
                ),
                  SizedBox(height: 20,)
                ,
                Container(
                  color: Colors.grey[200],
                  width: 350,
                  padding: EdgeInsets.all(10),
                  child:  Column(

                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Todays Exercise ',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Arm Raises',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                              Text('5 mins',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Arm Raises ',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                              Text('5 mins',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Leg Raises ',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                              Text('10 mins',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('leg Raises',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                              Text('10 mins',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Squats ',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                              Text('5 mins ',style: TextStyle (fontSize: 24,fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FourthPage(),)
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Color.fromRGBO(15,136, 148, 1),
                            textStyle:  TextStyle(color: Colors.white),
                            fixedSize: Size(370.0, 55.0),

                            // padding: const EdgeInsets.fromLTRB(16.0, 44.92, 16.0, 44.92),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.49),
                            ),
                            side: BorderSide(width: 1.0, color: Colors.blue),
                            // elevation: 0.0,
                          ),
                          child: const Text('Get Started',
                            style: TextStyle(color: Colors.white,fontSize: 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                ,
                SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 350,
                    height: 200,
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 70,),
                            buildBar(month: 'Jan', value: 50),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 60,),
                            buildBar(month: 'Feb', value: 60),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 20,),
                            buildBar(month: 'Jan', value: 100),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 40,),
                            buildBar(month: 'Jan', value: 80),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 30,),
                            buildBar(month: 'Jan', value: 90),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 50,),
                            buildBar(month: 'Jan', value: 70),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 70,),
                            buildBar(month: 'Jan', value: 50),
                          ],
                        ),
                        // buildBar(month: 'Feb', value: 80),
                        // buildBar(month: 'Mar', value: 120),
                        // buildBar(month: 'Apr', value: 90),
                        // buildBar(month: 'May', value: 60),
                        // buildBar(month: 'Jun', value: 110),
                        // buildBar(month: 'Jul', value: 70),
                      ],
                    ),
                  ),
                )
            
            
            
              ],
            ),
          );
          




  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int selectedIndex = 30;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: const EdgeInsets.only(left: 38.0),
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Training",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/023/166/862/original/man-doing-double-arm-side-or-lateral-raises-to-overhead-extension-exercise-vector.jpg'),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        selectedIndex = (selectedIndex - 1).clamp(29, 31);
                      });
                    },
                  ),
                  buildDateCard(31, "Sep", 2023),
                  buildDateCard(30, "Sep", 2023),
                  buildDateCard(29, "Sep", 2023),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        selectedIndex = (selectedIndex + 1).clamp(29, 31);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,  // Set the width as needed
                    height: 140,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(

                        image: NetworkImage('https://static.vecteezy.com/system/resources/previews/023/166/862/original/man-doing-double-arm-side-or-lateral-raises-to-overhead-extension-exercise-vector.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    const Column(
                      children: [
                        Text('Arm Raises'

                        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                        Text('5 mins'

                          ,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.normal,fontSize: 16),
                        )
                      ],
                    ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,  // Set the width as needed
                    height: 140,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(

                        image: NetworkImage('https://static.vecteezy.com/system/resources/previews/023/166/862/original/man-doing-double-arm-side-or-lateral-raises-to-overhead-extension-exercise-vector.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text('Arm Raises'

                        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      Text('5 mins'

                        ,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.normal,fontSize: 16),
                      )
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,  // Set the width as needed
                    height: 140,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(

                        image: NetworkImage('https://static.vecteezy.com/system/resources/previews/023/166/862/original/man-doing-double-arm-side-or-lateral-raises-to-overhead-extension-exercise-vector.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text('Arm Raises'

                        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      Text('5 mins'

                        ,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.normal,fontSize: 16),
                      )
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,  // Set the width as needed
                    height: 140,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(

                        image: NetworkImage('https://static.vecteezy.com/system/resources/previews/023/166/862/original/man-doing-double-arm-side-or-lateral-raises-to-overhead-extension-exercise-vector.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text('Arm Raises'

                        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      Text('5 mins'

                        ,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.normal,fontSize: 16),
                      )
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,  // Set the width as needed
                    height: 140,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(

                        image: NetworkImage('https://images.pexels.com/photos/6889088/pexels-photo-6889088.jpeg?auto=compress&cs=tinysrgb&w=1600'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text('Arm Raises'

                        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      Text('5 mins'

                        ,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.normal,fontSize: 16),
                      )
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,  // Set the width as needed
                    height: 140,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(

                        image: NetworkImage('https://static.vecteezy.com/system/resources/previews/023/166/862/original/man-doing-double-arm-side-or-lateral-raises-to-overhead-extension-exercise-vector.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text('Arm Raises'

                        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      Text('5 mins'

                        ,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.normal,fontSize: 16),
                      )
                    ],
                  ),

                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildDateCard(int index, String month, int year) {
    var isSelected = index == selectedIndex;
    // Replace the following with your date card implementation
    return Container(
      padding: EdgeInsets.all(isSelected ? 16.0 : 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Text(
            ' $index',
            style: TextStyle(
              fontSize: isSelected ? 40.0 : 24.0,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            ' $month $year',
            style: TextStyle(
              fontSize: isSelected ? 18.0 : 16.0,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        
        children: [
        SizedBox(height: 40,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            padding: const EdgeInsets.only(left: 18.0),
            icon:const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 98.0,top: 30),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/6889088/pexels-photo-6889088.jpeg?auto=compress&cs=tinysrgb&w=1600'),
            ),
          ),
        ],
      ),
      
      SizedBox(height: 20,),
      const Text('Neha Merium Mathew' ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      const Text('+91 23123 32322' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      const Text('Edit Profile' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.underline,decorationColor: Colors.grey),),
         SizedBox(height: 30,),
      Container(
        child: Column(
          children: [
            buildRow(Icons.alarm, 'Reminder', Icons.chevron_right),
            SizedBox(height: 10,),
            buildRow(Icons.settings, ' Settings ', Icons.chevron_right),
            SizedBox(height: 10,),
            buildRow(Icons.support, ' Support ', Icons.chevron_right),
            SizedBox(height: 10,),
            buildRow(Icons.exit_to_app, 'Sign Out ', Icons.chevron_right),
            SizedBox(height: 10,),
          ],
        ),
      ),
      
        ],
      
      
      ),
    );
  }
}



Widget buildRow(IconData leftIcon, String text, IconData rightIcon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(leftIcon),
      Text(text,style: const TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
      Icon(rightIcon),
    ],
  );
}


class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
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
              padding: EdgeInsets.only(left: 38.0),
              child: Text(
                "5 mins",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 370, // Set the width as needed
                height: 350, // Set the height as needed

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Set the border radius as needed
                  child: const ChewieVideoPlayer(),
                )
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0,top: 20),
              child: Text(
                "Instructions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0,top: 10),
              child: Text(
                "1) Find a comfortable chair and sit with your back straight.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0,top: 10,bottom: 20),
              child: Text(
                "2) Hold your phone in one hand and raise your other arm, as shown in the above video",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestPage(),)
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
              child: const Text('Start',
                style: TextStyle(color: Colors.white,fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ChewieVideoPlayer extends StatefulWidget {
  const ChewieVideoPlayer({super.key});

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      ),
      autoPlay: true,
      looping: true,
      aspectRatio: 16 / 9,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }
}


Widget buildBar({required String month, required double value}) {
  return Column(
    children: [
      Container(
        height: value,
        width: 10,
        color: Colors.blue,
      ),
      Center(
        child: Text(
          month,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}





















//
//
//
//
//
//
// class ImageSliderApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  ImageSliderScreen();
//   }
// }
//
// class ImageSliderScreen extends StatefulWidget {
//   @override
//   _ImageSliderScreenState createState() => _ImageSliderScreenState();
// }
//
// class _ImageSliderScreenState extends State<ImageSliderScreen> {
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page!.round();
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Aesthetic Image Slider'),
//         centerTitle: true,
//       ),
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           PageView.builder(
//             controller: _pageController,
//             itemCount: _images.length,
//             itemBuilder: (context, index) {
//               return Image.network(
//                 _images[index],
//                 fit: BoxFit.cover,
//               );
//             },
//           ),
//           Positioned(
//             bottom: 20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: _buildPageIndicator(),
//             ),
//           ),
//         ],
//       ),
//     );

//   }



