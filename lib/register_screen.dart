import 'package:flutter/material.dart';
import 'package:graduationproject/auth_screen.dart';
import 'original_button.dart';
import 'package:graduationproject/theme_manager';
import 'package:graduationproject/themes.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ThemeManager _themeManager = ThemeManager();
  var SelectedDay;
  var SelectedMonth;
  var SelectedYear;
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 620,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).colorScheme.onPrimary),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ListView(
                      children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 15),
                            child: Text(
                              "Create Account",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Wrap(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 160,
                                        child: TextFormField(
                                          onChanged: (value) => _email = value,
                                          validator: (value) => value!.isEmpty
                                              ? 'Enter your first name'
                                              : null,
                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                            ),
                                            labelText: 'First Name',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 160,
                                        child: TextFormField(
                                          onChanged: (value) => _email = value,
                                          validator: (value) => value!.isEmpty
                                              ? 'Enter your last name'
                                              : null,
                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                            ),
                                            labelText: 'Last Name',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 340,
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
                                            decoration: const InputDecoration(
                                              labelText: 'Email address',
                                              prefixIcon: Icon(
                                                Icons.email,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 340,
                                          child: TextFormField(
                                            controller: _passwordController,
                                            obscureText:
                                                showPassword ? false : true,
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 340,
                                          child: TextFormField(
                                            onChanged: (value) => _email = value,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please enter your phone number ";
                                              } else if (!RegExp(
                                                      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                                  .hasMatch(value)) {
                                                return "Please enter a valid phone number";
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.call,
                                              ),
                                              labelText: 'Phone number',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 95,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: DropdownButton(
                                          underline: const Divider(
                                            thickness: 0,
                                          ),
                                          hint: const Text("    DD"),
                                          items: [
                                            "1",
                                            "2",
                                            "3",
                                            "4",
                                            "5",
                                            "6",
                                            "7",
                                            "8",
                                            "9",
                                            "10",
                                            "11",
                                            "12",
                                            "13",
                                            "14",
                                            "15",
                                            "16",
                                            "17",
                                            "18",
                                            "19",
                                            "20",
                                            "21",
                                            "22",
                                            "23",
                                            "24",
                                            "25",
                                            "26",
                                            "27",
                                            "28",
                                            "29",
                                            "30",
                                            "31",
                                          ]
                                              .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              SelectedDay = val;
                                            });
                                            (value) {
                                              if (value == null) {
                                                return 'Relationship is required';
                                              }
                                            };
                                          },
                                          value: SelectedDay,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 118,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: DropdownButton(
                                          underline: const Divider(
                                            thickness: 0,
                                          ),
                                          hint: const Text("    MM"),
                                          items: [
                                            "January",
                                            "February",
                                            "March",
                                            "April",
                                            "May",
                                            "June",
                                            "July",
                                            "August",
                                            "Semptemper",
                                            "October",
                                            "November",
                                            "December",
                                          ]
                                              .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              SelectedMonth = val;
                                            });
                                          },
                                          value: SelectedMonth,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 95,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: DropdownButton(
                                          underline: const Divider(
                                            thickness: 0,
                                          ),
                                          hint: const Text("    YY"),
                                          items: [
                                            "2000",
                                            "2001",
                                            "2002",
                                            "2003",
                                            "2004",
                                            "2005",
                                            "2006",
                                            "2007",
                                            "2008",
                                            "2009",
                                            "2010",
                                            "2011",
                                            "2012",
                                            "2013",
                                            "2014",
                                            "2015",
                                            "2016",
                                            "2017",
                                            "2018",
                                            "2019",
                                            "2020",
                                            "2021",
                                            "2022",
                                            "2023",
                                          ]
                                              .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              SelectedYear = val;
                                            });
                                          },
                                          value: SelectedYear,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: SizedBox(
                                        width: 340,
                                        child: OriginalButton(
                                          text: ('Register'),
                                          textColor: Colors.white,
                                          bgColor:
                                              Theme.of(context).backgroundColor,
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              print(_email);
                                              print(_password);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 100),
                                      child: Row(
                                        children: [
                                          Text("Already a user? ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3),
                                          Text("Login ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ])
                      ],
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: -15,
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Theme.of(context).colorScheme.onPrimary,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              radius: 20,
                              child:Icon(
                                Icons.close,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            )))
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
