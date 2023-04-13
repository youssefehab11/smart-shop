import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduationproject/auth_screen.dart';
import 'package:graduationproject/transition_animation.dart';
import 'original_button.dart';
import 'package:graduationproject/theme_manager';
import 'package:graduationproject/themes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
      
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Center(
        child: Column(
          children: [
            Text(
              "Forgot Password",
              
             style: Theme.of(context).textTheme.headline5,
             
             
            ),
            SizedBox(
              height: 90,
            ),
             Text(
              "Enter Email Address",
              style: Theme.of(context).textTheme.headline2,
              
              /*style:TextStyle(
                                                          fontSize: 18,
                                                           fontFamily: "Lato",
                                                           fontWeight: FontWeight.bold,
                                                          color: Colors.black),

  */
                                                    ), 
                           
            
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 360,
              child: Form(
                key: _formKey,
                child: TextFormField(
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
                  decoration: InputDecoration(
                    labelText: 'Enter your email address',
                    hintText: 'ex: test@gmail.com',
                    prefixIcon: const Icon(
                      Icons.email,
                
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(ScaleAnimationRoute(Page: AuthScreen()));
              },
              child: Text(
                "Back to sign in",
                style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline3
              
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 360,
              child: OriginalButton(
                text: ('Send code'),
                textColor: Colors.white,
                bgColor: Theme.of(context).backgroundColor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed('Verification');
                  }
                },
              ),
            ),
            SizedBox(
              height: 150,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(ScaleAnimationRoute(Page: AuthScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 78.0),
                child: Row(
                  children: [
                    Text("Don't have an account? ",
                        style:  Theme.of(context).textTheme.headline3),
                    Text("Sign Up ",
                        style: Theme.of(context).textTheme.headline4),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }
}

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

final _formKey = GlobalKey<FormState>();

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Text(
                "Verification",
                style: Theme.of(context).textTheme.headline5
              ),
              SizedBox(
                height: 90,
              ),
              Text(
                "Enter Verification Code",
                style: Theme.of(context).textTheme.headline2
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1) {},
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin2) {},
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin3) {},
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin4) {},
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "If you didn’t receive a code! ",
                                 style: Theme.of(context).textTheme.headline3),
                              ),
                              Text(
                                "Resend",
                                style: Theme.of(context).textTheme.headline4),
                              
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 360,
                        child: OriginalButton(
                          text: ('Verify'),
                          textColor: Colors.white,
                          bgColor: Theme.of(context).backgroundColor,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pushNamed('NewPassword');
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  String _password = '', _pass = '';
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool showPass = false;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(children: [
                Text(
                  "New Password",
                  style: Theme.of(context).textTheme.headline5
                ),
                SizedBox(
                  height: 90,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Enter New Password",
                        style: Theme.of(context).textTheme.headline2
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 360,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: showPassword ? false : true,
                    onChanged: (value) => _password = value,
                    validator: (value) => value!.length <= 6
                        ? 'Your password must be larger than 6 characters'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                                  : Icons.remove_red_eye,
                              )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Confirm Password",

                        style: Theme.of(context).textTheme.headline2
                      ),
                    ),
                  ],
                ),
                SizedBox(
                 height: 10,
               ),
                SizedBox(
                  width: 360,
                  child: TextFormField(
                    controller: _passController,
                    obscureText: showPass ? false : true,
                    onChanged: (value) => _pass = value,
                    validator: (value) => value!.length <= 6
                        ? 'Your password must be larger than 6 characters'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock,
                        
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          child: Icon(
                              showPass
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye,
                              )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                SizedBox(
                  width: 360,
                  child: OriginalButton(
                    text: ('Submit'),
                    textColor: Colors.white,
                    bgColor: Theme.of(context).backgroundColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed('Login');
                      }
                    },
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
