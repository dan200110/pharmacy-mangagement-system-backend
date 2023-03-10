import 'package:flutter/material.dart';
import 'package:flutter_medical_management_project/blocks/auth_block.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    AuthBlock auth = Provider.of<AuthBlock>(context);
    return Column(
      children: <Widget>[
        if (auth.isLoggedIn)
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/drawer-header.jpg'),
            )),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars2.githubusercontent.com/u/2400215?s=120&v=4'),
            ),
            accountEmail: Text(auth.user['email']),
            accountName: Text(auth.user['name']),
          ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Shop'),
                trailing: Text('New',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shop');
                },
              ),
              ListTile(
                leading: Icon(Icons.category,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Categorise'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categorise');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('My Wishlist'),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('4',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/wishlist');
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('My Cart'),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('2',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              ListTile(
                leading: Icon(Icons.accessibility_new_outlined,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('doctor home temporary'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/doctor_home');
                },
              ),
              ListTile(
                leading: Icon(Icons.accessibility_new_outlined,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('pharmacist home temporary'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/pharmacist_home');
                },
              ),
              ListTile(
                leading: Icon(Icons.accessibility_new_outlined,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('supplier home temporary'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/supplier_home');
                },
              ),
              if (!auth.isLoggedIn)
                ListTile(
                  leading: Icon(Icons.lock,
                      color: Theme.of(context).colorScheme.secondary),
                  title: Text('User Login'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/user_auth');
                  },
                ),
              ListTile(
                leading: Icon(Icons.lock,
                    color: Theme.of(context).colorScheme.secondary),
                title: Text('Employee Login'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/employee_auth');
                },
              ),
              Divider(),
              if (auth.isLoggedIn)
                ListTile(
                  leading: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.secondary),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              if (auth.isLoggedIn)
                ListTile(
                  leading: Icon(Icons.exit_to_app,
                      color: Theme.of(context).colorScheme.secondary),
                  title: Text('Logout'),
                  onTap: () async {
                    await auth.logout();
                  },
                ),
            ],
          ),
        )
      ],
    );
  }
}
