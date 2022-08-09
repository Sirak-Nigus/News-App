import 'package:flutter/material.dart';
import 'package:mekelletimes/model/user.dart';
import 'package:mekelletimes/provider/userProvider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isInit = true;
  var _editProfile = User(userId: null, name: '', email: '', token: null);

  Future<void> updateProfile(BuildContext context) async {
    _formKey.currentState.validate();
    _formKey.currentState.save();
    await Provider.of<UserProvider>(context, listen: false)
        .updateProfile(_editProfile)
        .then((value) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    print('build: ${_editProfile.name}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [IconButton(icon: Icon(Icons.edit), onPressed: () {})],
      ),
      body: FutureBuilder(
        future: Provider.of<UserProvider>(context, listen: false).fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('No Connection ,Please Connect to internet'),
            );
          }
          return Consumer<UserProvider>(
            builder: (context, user, child) {
              return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20, right: 20),
                          child: TextFormField(
                            style: Theme.of(context).textTheme.headline6,
                            initialValue: user.user.single.name,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              // border: OutlineInputBorder()
                            ),
                            validator: (value) =>
                                value.isEmpty ? 'Please enter your name' : null,
                            onSaved: (newValue) {
                              _editProfile = User(
                                  userId: user.user.single.userId,
                                  name: newValue,
                                  email: user.user.single.email,
                                  token: user.user.single.token);
                            },
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(197, 48, 48, 10)),
                            ),
                            onPressed: () {
                              updateProfile(context);
                            },
                            child: Text('Update'))
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
