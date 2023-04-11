/* import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/navigationbar_controller_screen.dart';
import 'package:graduationproject/original_button.dart';

import 'auth_screen.dart';

class Authform extends StatefulWidget {
  @override
  _AuthformState createState() => _AuthformState();
}

class _AuthformState extends State<Authform> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;
  String _email = '', _password = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) => _email = value,
                    validator: (value) {
                      print(value);
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enter your email ',
                      hintText: 'ex: test@gmail.com',
                      prefixIcon: Icon(
                        Icons.email, 
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: showPassword ? false : true,
                    onChanged: (value) => _password = value,
                    validator: (value) => value!.length <= 6
                        ? 'Your password must be larger than 6 characters'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Icon(
                              showPassword
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye,)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: Theme.of(context).textTheme.bodyText2
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  OriginalButton(
                    text: ('Login'),
                    textColor: Colors.white,
                    bgColor: Theme.of(context).backgroundColor,
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed('Home');
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('Register');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account? ",
                            style:Theme.of(context).textTheme.bodyText2
                          ),
                          Text(
                            "Sign Up ",
                            style: Theme.of(context).textTheme.bodyText1
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
 */