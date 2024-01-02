import 'package:figmaa/home.dart';
import 'package:flutter/material.dart';
const kPrimaryColor = Color(0xfff1bb274);
const kPrimaryLightColor = Color(0xfffeeeee4);
class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({ Key? key,this.child }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal:20,vertical:5),
      width: size.width *0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}



class MySignUpPage extends StatelessWidget {
  const MySignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
"Sign up",
          // widget.title,
          style: TextStyle(
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

            const Text(
              'Email',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
                // borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 10.0),
            // const RoundedInputField(
            //     hintText: "Email", icon: Icons.email),
            // switchListTile(),
            const Text(
              'Password',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            const RoundedPasswordField(),
            const RoundedPasswordField2(),
            const Row(
              children: [
                // Container(
                //   margin: EdgeInsets.only(left: 8.0),
                //   child: const Column(
                //     children: [
                //       Icon(Icons.lock),
                //       SizedBox(height: 4.0), // Adjust the spacing as needed
                //     ],
                //   ),
                // ),
                // const Expanded(
                //   child: TextField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       hintText: 'Enter your password',
                //       border: OutlineInputBorder(),
                //       // borderRadius: BorderRadius.circular(8.0),
                //     ),
                //   ),
                // ),
                // IconButton(
                //   icon: Icon(Icons.visibility),
                //   onPressed: () {
                //     // Implement toggle visibility logic for password
                //   },
                // ),
              ],
            ),



            SizedBox(height: 10.0),
            const Text(
              'By creating the account, you agree to our terms & conditions and privacy policy',
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 17.0),
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
                child: const Text('Sign Up',
                  style: TextStyle(color: Colors.white,fontSize: 22),
                ),
              ),
            ),
            SizedBox(height: 10.0),

            SizedBox(height: 10.0),
            Center(
              child: Column(
                children: [
                  Text(
                    'or',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
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
                    height: 30,
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
          ],
        ),
      ),
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: TextField(
        // obscureText: passwordVisible,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Password",
          labelText: "Password",
          // helperText:"Password must contain special character",
          helperStyle:TextStyle(color:Colors.green),
          suffixIcon: IconButton(
            icon: const Icon(
                // passwordVisible
              true
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () {

              }

          ),
          alignLabelWithHint: false,
          filled: true,
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),

    );
  }
}




class RoundedPasswordField2 extends StatelessWidget {
  const RoundedPasswordField2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      // color: Colors.white,
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(2.0),
        color: Colors.white,

      ),
      child: TextField(
        // obscureText: passwordVisible,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Confirm Password",
          labelText: "Confirm Password",
          // helperText:"Password must contain special character",
          helperStyle:TextStyle(color:Colors.green),
          suffixIcon: IconButton(
              icon: const Icon(
                // passwordVisible
                  true
                      ? Icons.visibility
                      : Icons.visibility_off),
              onPressed: () {

              }

          ),
          alignLabelWithHint: false,
          filled: true,
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),

    );
  }
}




switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      // activeColor: kPrimaryColor,
      onChanged: (val) {},
    ),
  );
}