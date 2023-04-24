import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
   String email = '', password = '', repassword = '', teacher = '';

  @override
  void initState() {
    super.initState();
    DataLoading();
    setState(() {});
  }

  DataLoading() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    password = sp.getString('password') ?? '';
    repassword = sp.getString('repassword') ?? '';
    teacher = sp.getString('userType') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Teacher Screen"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Text("Email:"),
                          const Spacer(),
                          Text(email.toString())
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Text("Password:"),
                          const Spacer(),
                          Text(password.toString())
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Text("Re-Password:"),
                          const Spacer(),
                          Text(textAlign: TextAlign.left, repassword.toString())
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Text("User:"),
                          const Spacer(),
                          Text(textAlign: TextAlign.left, teacher.toString())
                        ],
                      ),
                    )
                  ]),
                ),
                // Container(
                //   width: double.infinity,
                //   height: double.infinity,
                //   decoration: const BoxDecoration(),
                //   child: const Image(
                //       fit: BoxFit.cover, image: AssetImage('images/bg.jpg')),
                // ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    // print("tap");
                    sp.clear();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LogIn()));
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Text("Logout")),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}