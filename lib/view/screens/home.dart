import 'package:flutter/material.dart';
import 'explore_page.dart';
import 'recipes_screen.dart';

// 1
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;
  List<Widget> tabs = [
    ExplorePage(),
    const RecipesScreen(),
    Container(
      color: Colors.red,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fooder', style: Theme.of(context).textTheme.headline6),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            selectedIndex = i;
          });
          print(selectedIndex);
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank), label: 'recipes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'card 3'),
        ],
      ),
    );
  }
}
