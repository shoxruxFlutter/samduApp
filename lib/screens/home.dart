import 'package:samduapp/models/post.dart';
import 'package:samduapp/screens/category_screen.dart';


import 'package:samduapp/screens/setting_screens.dart';
import 'package:samduapp/services/user_service.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



int _selectedIndex = 0;

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

 List<Widget> screens = [

    const Category(),
    MyWidget(),
    
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Samdu App'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              logout().then((value) => {
                   Navigator.of(context).pushReplacementNamed('/login')
              });
            },
          )
        ],
      ),
      body: screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        // notchMargin: 5,
        // elevation: 10,
        // clipBehavior: Clip.antiAlias,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp),
              label: 'Category'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account'
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,         //New
       
      ),
    );
  }
}