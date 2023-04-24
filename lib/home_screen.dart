import 'package:flutter/material.dart';
import 'package:share_preference/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String email = '', password = '', repassword = '';
  @override
  void initState() {
    super.initState();
    loadData();
    setState(() {});
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? '';
    password = sp.getString("password") ?? '';
    repassword = sp.getString("repassword") ?? '';
    print(email);
    print(password);
    print(repassword);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
