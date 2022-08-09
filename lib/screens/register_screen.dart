import 'package:mekelletimes/provider/auth_provider.dart';
import 'package:mekelletimes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final passwordController = TextEditingController();

  Response response;

  var dio = Dio();

  String name, email, password, passwordConfirm;

  bool obscureTextpassword = true;
  bool obscureTextConfirmpassword = true;
  bool isSubmitting = false;

  void submit() {
    final isValid = formkey.currentState.validate();
    if (!isValid) {
      return print('Invalid form');
    }
    formkey.currentState.save();

    registerUser();
  }

  Future<void> registerUser() async {
    setState(() {
      isSubmitting = true;
    });
    await Provider.of<Auth>(context, listen: false)
        .signUp(name, email, password, passwordConfirm);

    setState(() {
      isSubmitting = false;
    });

    showSuccessSnackBar();
    redirectUser();
  }

  // void storeUserData(response) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   Map<String, dynamic> user = response['user'];
  //   user.putIfAbsent('token', () => response);
  //   prefs.setString('user', json.encode(user));
  // }

  void showSuccessSnackBar() {
    final SnackBar snackBar = SnackBar(
      content: Text(
        'User $name successfully registered!',
        style: TextStyle(color: Colors.green),
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
    formkey.currentState.reset();
  }

  void redirectUser() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  Widget showTitle() {
    return Text(
      'Register',
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget showUFullnameInput() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (val) => name = val,
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.text,
          validator: (val) => val.contains(RegExp(r'^[a-zA-Z]+'))
              ? null
              : 'Please Enter valid Name',
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full Name',
              hintText: 'Enter Fullname',
              icon: Icon(Icons.verified_user, color: Colors.red))),
    );
  }

  Widget showUsernameInput() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (val) => email = val,
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          validator: (val) =>
              val.contains(RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+'))
                  ? null
                  : 'please Enter valid email',
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              hintText: 'Enter an email',
              icon: FaIcon(FontAwesomeIcons.userAlt, color: Colors.red))),
    );
  }

  Widget showpasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (val) => password = val,
          controller: passwordController,
          style: TextStyle(color: Colors.black),
          validator: (val) => val.length < 8 ? 'Enter valid password' : null,
          obscureText: obscureTextpassword,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureTextpassword = !obscureTextpassword;
                  });
                },
                child: obscureTextpassword
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
              labelText: 'password',
              hintText: 'Enter password',
              icon: FaIcon(FontAwesomeIcons.lock, color: Colors.red))),
    );
  }

  Widget showConfirmpasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (val) => passwordConfirm = val,
          style: TextStyle(color: Colors.black),
          validator: (val) =>
              val == passwordController.text ? null : 'password donot match',
          obscureText: obscureTextConfirmpassword,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Confirm password',
              hintText: 'Enter password',
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureTextConfirmpassword = !obscureTextConfirmpassword;
                  });
                },
                child: obscureTextConfirmpassword
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
              icon: FaIcon(FontAwesomeIcons.lock, color: Colors.red))),
    );
  }

  Widget showSubmit() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          isSubmitting
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                )
              : ElevatedButton(
                  onPressed: submit,
                  child: Text('Register',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(1.0),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(197, 48, 48, 10),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
                ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text(
                'Existing user? Login',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        showTitle(),
                        showUFullnameInput(),
                        showUsernameInput(),
                        showpasswordInput(),
                        showConfirmpasswordInput(),
                        showSubmit()
                      ],
                    )),
              ),
            ),
          ),
        ));
  }
}
