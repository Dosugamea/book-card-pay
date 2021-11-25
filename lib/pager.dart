import 'package:flutter/material.dart';
import 'package:tosyo_card_pay/pages/home.dart';
import 'package:tosyo_card_pay/pages/cards.dart';
import 'package:tosyo_card_pay/pages/settings.dart';

class Pager extends StatefulWidget {
  const Pager({Key? key}) : super(key: key);

  @override
  _PagerState createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  int _selectedIndex = 0;
  late PageController _pageController;

  static final List<Widget> _pageList = [
    const HomePage(),
    const CardsPage(),
    const SettingsPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('図書カードPay'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'カード一覧'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;

          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        },
      ),
    );
  }
}