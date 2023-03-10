import 'package:flutter/material.dart';
import 'package:flutter_medical_management_project/blocks/auth_block.dart';
import 'package:provider/provider.dart';

class DoctorHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DoctorHome> {
  @override
  Widget build(BuildContext context) {
    AuthBlock auth = Provider.of<AuthBlock>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Welcome doctor"),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: ListView(
            // Add the app bar and list of items as slivers in the next steps.
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Cấp phép thuốc'),
                onTap: () {
                  Navigator.pushNamed(context, '/doctor_order');
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Settings'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Logout'),
                onTap: () async {
                  auth.logout().then((value) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/');
                  });
                },
              ),
            ]),
      ),
    );
  }
}
