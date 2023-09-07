import 'package:flutter/material.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/factories/screen_factory.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  final _screenFactory = ScreenFactory();

  void _onSelectedTab(int index) {
    if (_selectedTab == index) return;
    _selectedTab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart University'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              SessionDataProvider().deleteTokenUser().then(
                    (value) => MainNavigation.resetNavigation(context),
                  )
            },
            icon: const Icon(Icons.logout_sharp),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _screenFactory.makeYuklamaScreen(2, 'qwertyy'),
          _screenFactory.makeAnketaScreen(),
          _screenFactory.makeAccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Yuklama'),
          BottomNavigationBarItem(
              icon: Icon(Icons.face), label: "Anketa ma'lumotlari"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Account'),
        ],
        onTap: _onSelectedTab,
      ),
    );
  }
}
