import 'package:flutter/material.dart';
import 'package:musicmodel/constants/assets.dart';
import 'package:musicmodel/constants/route_strings.dart';
import 'package:musicmodel/constants/shared_pref.dart';
import 'package:musicmodel/constants/size.dart';
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
            Positioned(
                top: size(context).height * 0.1,
                left: 30,
                child: Text(
                  "Hi!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
                height: size(context).height / 2,
                width: size(context).width * 0.9,
                top: size(context).height * 0.2,
                left: 20,
                child: Card(
                  color: Color.fromARGB(255, 248, 247, 247).withOpacity(0.4),
                  elevation: 50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size(context).height * 0.08,
                        horizontal: size(context).width * 0.04),
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
                        SizedBox(height: size(context).height * 0.04),
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
                        SizedBox(height: size(context).height * 0.04),
                        Container(
                          width: size(context).height * 0.25,
                          height: size(context).height * 0.06,
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
