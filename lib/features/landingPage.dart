import 'package:flutter/material.dart';
import 'package:musicmodel/constants/assets.dart';
import 'package:musicmodel/constants/route_strings.dart';
import 'package:musicmodel/constants/shared_pref.dart';
import 'package:musicmodel/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _username = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Image(
              image: AssetImage(Assets.stack),
              fit: BoxFit.cover,
            ),
            const Positioned(
                top: 100,
                left: 30,
                child: Text(
                  "Hi!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
                height: 360,
                width: 350,
                top: 200,
                left: 20,
                child: Card(
                  color: Color.fromARGB(255, 248, 247, 247).withOpacity(0.4),
                  elevation: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 14),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: _username,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Name'),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Username is required";
                              }
                            }),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Email is required";
                            }
                          },
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 117, 30, 171)),
                              onPressed: () async {
                                SharedPreferences _pref =
                                    await SharedPreferences.getInstance();
                                var getUsername = _username.text;
                                var getEmail = _email.text;

                                _pref.setString(
                                    SharedPref.getUsername, getUsername);
                                _pref.setString(SharedPref.getEmail, getEmail);

                                var data = await _pref.getString("getusername");
                                print(data);

                                Navigator.pushNamed(
                                    context, RouteStrings.dashboardPage);
                              },
                              child: const Text(
                                String.continuebutton,
                                style: TextStyle(fontSize: 20),
                              )),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
