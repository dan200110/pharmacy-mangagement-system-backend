import 'package:flutter/material.dart';
import 'package:flutter_medical_management_project/blocks/auth_block.dart';
import 'package:flutter_medical_management_project/models/user.dart';
import 'package:provider/provider.dart';

class EmployeeSignIn extends StatefulWidget {
  @override
  _EmployeeSignInState createState() => _EmployeeSignInState();
}

class _EmployeeSignInState extends State<EmployeeSignIn> {
  final _formKey = GlobalKey<FormState>();
  final UserCredential userCredential =
      UserCredential(usernameOrEmail: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Email or Username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        userCredential.usernameOrEmail = value!;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Username Or Email',
                      labelText: 'Email',
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      userCredential.password = value!;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Consumer<AuthBlock>(
                      builder: (BuildContext context, AuthBlock auth,
                          Widget? child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: auth.loading && auth.loadingType == 'login'
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white),
                                ),
                          onPressed: () async {
                            // Validate form
                            if (_formKey.currentState!.validate() &&
                                !auth.loading) {
                              // Update values
                              _formKey.currentState!.save();
                              // Hit Api

                              bool isLogined =
                                  await auth.employee_login(userCredential);
                              if (isLogined) {
                                Navigator.pop(context);
                                if (auth.user['role'] == 'doctor') {
                                  Navigator.pushNamed(context, '/doctor_home');
                                } else {
                                  Navigator.pushNamed(
                                      context, '/pharmacist_home');
                                }
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
