import 'package:mekelletimes/provider/auth_provider.dart';
import 'package:mekelletimes/widgets/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool obscureText = true;
  bool isSubmmiting = false;

  String email, password;

  Future<void> submit(BuildContext context) async {
    if (!formkey.currentState.validate()) {
      // Invalid!
      return;
    }
    formkey.currentState.save();
    setState(() {
      isSubmmiting = true;
    });

    try {
      await Provider.of<Auth>(context, listen: false)
          .login(email, password)
          .then((_) => Navigator.of(context).pushReplacementNamed('/home'));
    }
    // on DioError catch (error) {
    //   //   var errorMessage = 'Login Failed!';
    //   //   print('fromLoginScreenOnDioError:: ${error.response.data}');
    //   //   if (error.response.data['message']
    //   //       .toString()
    //   //       .contains('Incorrect email or password')) {
    //   //     errorMessage = 'Incorrect email or password';
    //   //   }
    //   //   _showErrorDialog(errorMessage);
    // }
    catch (error) {
      print('loginScreenCatch: ${error['message'].toString()}');
      print(error);
      var errorMessage;
      if (error['message'].toString().contains('Incorrect email or password')) {
        errorMessage = 'Incorrect email or password';
      } else {
        errorMessage = 'Login failed. Please try again';
      }
      _showErrorDialog(errorMessage);
    }

    setState(() {
      isSubmmiting = false;
    });
  }

  // void storeUserData(responseData) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   Map<String, dynamic> user = responseData;
  //   print('response :${user.toString()}');
  //   user.putIfAbsent('token', () => responseData);
  //   prefs.setString('user', json.encode(user));
  // }

  // void redirectUser() {
  //   Future.delayed(Duration(seconds: 1), () {
  //     Navigator.of(context).pushReplacementNamed('/home');
  //   });
  // }
  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'An ERROR Occured!',
              style: TextStyle(color: Colors.red),
            ),
            content: Text(message, style: TextStyle(color: Colors.black)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  Widget showTitle() {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.headline1,
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
                  : 'Enter valid email',
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              hintText: 'Enter username',
              labelStyle: Theme.of(context).textTheme.bodyText2,
              hintStyle: Theme.of(context).textTheme.bodyText2,
              icon: FaIcon(FontAwesomeIcons.userAlt, color: Colors.red))),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (val) => password = val,
          validator: (val) => val.length < 8 ? 'Enter valid password' : null,
          obscureText: obscureText,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: obscureText
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
              labelText: 'Password',
              labelStyle: Theme.of(context).textTheme.bodyText2,
              hintText: 'Enter password',
              hintStyle: Theme.of(context).textTheme.bodyText2,
              icon: FaIcon(FontAwesomeIcons.lock, color: Colors.red))),
    );
  }

  Widget showSubmit() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          isSubmmiting
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                )
              : ElevatedButton(
                  onPressed: () {
                    submit(context);
                  },
                  child: Text('Login',
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
                Navigator.of(context).pushReplacementNamed('/register-page');
              },
              child: Text(
                'New User ? Register',
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                  key: formkey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: showTitle(),
                      ),
                      showUsernameInput(),
                      showPasswordInput(),
                      showSubmit()
                    ],
                  )),
            ),
          ),
        ));
  }
}
