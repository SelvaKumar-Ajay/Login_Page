import 'dart:js';
import 'package:flutter/material.dart';
import 'package:sk_restaurant/textfields.dart';
import 'package:sk_restaurant/variables.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'fieldvalue.dart';
import 'samplehomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: restaurantName,
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: FocusScope.of(context).focusedChild?.unfocus,
        child: DesignPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class DesignPage extends StatelessWidget {
  DesignPage({super.key});
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // String returnValue = "";
  void signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailReturn, password: passReturn)
        // ignore: body_might_complete_normally_catch_error
        .catchError((error) {})
        .then((authUser) {
      if (authUser.user != null) {
        Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: ((context) => const HomePage())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Image.asset(restaurantImgName,
                    height: height * 0.35,
                    width: double.infinity,
                    fit: BoxFit.cover),
                Container(
                  height: height * 0.37,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.5, 0.9],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.white])),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    restaurantName,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    quotes,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue.withOpacity(0.3),
                      Colors.transparent
                    ]),
                    border: const Border(
                        left: BorderSide(width: 5, color: Colors.blue))),
                child: Text(
                  login,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            textFields(
              field: "email",
              iconName: Icons.mail,
              name: email,
            ),
            textFields(
                field: "password",
                iconName: Icons.lock,
                name: password,
                obscureValue: true),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    forgotPassword,
                    style: const TextStyle(color: Colors.blue),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: height * 0.08,
                width: width - 30,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      // signIn();
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: Text(
                    login,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(donthave),
                TextButton(onPressed: () {}, child: Text(createAccount))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
