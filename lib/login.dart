// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:share_preference/home_screen.dart';
import 'package:share_preference/student_screen.dart';
import 'package:share_preference/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // final formdata = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  // static List<String> list = <String>['one', 'two', 'three', 'four'];
  // String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person_2_sharp,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Login Form",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40)),
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40)),
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: repassword,
                  decoration: InputDecoration(
                      hintText: "Re-Password",
                      prefixIcon: const Icon(Icons.lock_clock_outlined),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40)),
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: 60,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       border: Border.all(color: Colors.grey),
                //       borderRadius: BorderRadius.circular(40)),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: DropdownButton<String>(
                //       // alignment: AlignmentDirectional.topEnd,
                //       dropdownColor: Colors.grey[200],
                //       value: dropdownValue,
                //       icon: const Padding(
                //         padding: EdgeInsets.only(left: 200),
                //         child: Icon(
                //           Icons.arrow_drop_down,
                //           size: 30,
                //         ),
                //       ),
                //       elevation: 16,
                //       style: const TextStyle(color: Colors.black, fontSize: 20),
                //       onChanged: (String? value) {
                //         // This is called when the user selects an item.
                //         setState(() {
                //           dropdownValue = value!;
                //         });
                //       },
                //       items: list.map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        sp.setString("email", email.text.toString());
                        sp.setString("password", password.text.toString());
                        sp.setString("repassword", repassword.text.toString());
                        // sp.setString("userType", 'student');
                        sp.setBool("loggedin", true);
                        print(sp.get("email"));
                        print(sp.get("password"));
                        print(sp.get("repassword"));
                        print(sp.get("loggedin"));
                        // if (sp.getString('password') == 'repassword') {
                        if (sp.getString('userType') == 'teacher') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TeacherScreen()));
                        } else if (sp.getString('userType') == 'student') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StudentScreen()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Homescreen()));
                        }
                        // } else {
                        //   print('Password');
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const LogIn()));
                        // }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(colors: [
                              Colors.pink,
                              Colors.purple,
                              Colors.blue
                            ])),
                        width: double.infinity,
                        child: const Center(child: Text("Login")),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> add() async {
  //   await Future.delayed(const Duration(seconds: 10));
  //   int x = 10, y = 20;
  //   print(x + y);
  // }
}
