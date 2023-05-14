
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _phoneNumberController = TextEditingController();
final _emailAddressController = TextEditingController();
String _initialFirstName = '';
String _initialLastName = '';
String _initialEmailAddress = '';
var _initialPhoneNumber = '';

final _formKey = GlobalKey<FormState>();

class _EditProfileState extends State<EditProfile> {
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((userDoc) {
      setState(() {
        _initialFirstName = userDoc.get('First Name');
        _initialLastName = userDoc.get('Last Name');
        _initialPhoneNumber = userDoc.get('Phone Number');
        _initialEmailAddress = userDoc.get('Email address');
        _firstNameController.text = _initialFirstName;
        _lastNameController.text = _initialLastName;
        _phoneNumberController.text = _initialPhoneNumber;
        _emailAddressController.text = _initialEmailAddress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            "Edit Profile",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 60,
                      child: const Icon(
                        Icons.person,
                        size: 110,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 30),
                  child: Text("First Name",
                      style: Theme.of(context).textTheme.headline6),
                ),
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(auth.currentUser!.uid)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!.data();

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                              // onChanged: (value) => lastname = value,

                              controller: _firstNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                              style: Theme.of(context).textTheme.headline6,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE

                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE

                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 30),
                  child: Text("Last Name",
                      style: Theme.of(context).textTheme.headline6),
                ),
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(auth.currentUser!.uid)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!.data();

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                              // onChanged: (value) => lastname = value,

                              controller: _lastNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                              style: Theme.of(context).textTheme.headline6,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE

                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE

                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 30),
                  child: Text("Phone Number",
                      style: Theme.of(context).textTheme.headline6),
                ),
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(auth.currentUser!.uid)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!.data();
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                              controller: _phoneNumberController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                } else if (!RegExp(
                                        r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                    .hasMatch(value)) {
                                  return "Please enter a valid phone number";
                                }
                                return null;
                              },
                              style: Theme.of(context).textTheme.headline6,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE

                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE

                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 30),
                  child: Text("Email address",
                      style: Theme.of(context).textTheme.headline6),
                ),
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(auth.currentUser!.uid)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!.data();

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                              readOnly: true,
                              controller: _emailAddressController,
                              style: Theme.of(context).textTheme.labelMedium,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final newFirstName = _firstNameController.text;
                          final newLastName = _lastNameController.text;
                          final newPhoneNumber = _phoneNumberController.text;
                          if (newFirstName != _initialFirstName ||
                              newLastName != _initialLastName ||
                              newPhoneNumber != _initialPhoneNumber) {
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(auth.currentUser!.uid)
                                .update({
                              'First Name': newFirstName,
                              'Last Name': newLastName,
                              'Phone Number': newPhoneNumber,
                            });
                          }

                          await showCustomDialog(context);
                        }
                      },
                      color: Theme.of(context)
                          .floatingActionButtonTheme
                          .backgroundColor,
                      textColor: Colors.white,
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(fontFamily: "Lato", fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          // Text("${widget.title}", style: Theme.of(context).textTheme.headline4),
          // SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Text("${widget.description}",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          SizedBox(height: 15),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: InkWell(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              highlightColor: Colors.grey[200],
              onTap: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 3);
              },
              child: Center(
                child: Text(
                  "OK",
                  style: TextStyle(
                      color: Color.fromRGBO(198, 48, 48, 1), fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> showCustomDialog(BuildContext context) async {
  return showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black26,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: const CustomAlertDialog(
          description:
              "Your account information has been updated successfully.",
        ),
      );
    },
  );
}