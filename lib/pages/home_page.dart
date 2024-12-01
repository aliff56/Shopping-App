
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
      final List<String> filters = [
      'All','Nike','Adiddas','Servis'
    ];
    late String selectfilter;
    int currentpage=0;
    List<Widget> pages = const [
      ProductList(),
      CartPage(),
    ];
    @override
  void initState() {
    super.initState();
    selectfilter=filters[0];
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedIconTheme: IconThemeData(
          color: Color.fromRGBO(113, 131, 85, 1)
        ),
        currentIndex: currentpage,
        onTap: (value) {
          setState(() {
            currentpage=value;
          });
        },
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: '',
          
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: '',
          )
          
      ]),
    );
  }
}