import 'package:flutter/material.dart';
import 'package:news_app/views/CategoryView.dart';
import 'package:news_app/widgets/news_list_builder.dart';
import '../core/style/app_colors.dart';
import '../widgets/CategoryList.dart';

class HomeSccreen extends StatefulWidget{
   HomeSccreen({super.key});
  @override
  State<HomeSccreen> createState() =>  _HomeScreenState() ;

}

class  _HomeScreenState extends State<HomeSccreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Newsly',
            style: TextStyle(fontWeight: FontWeight.bold),

        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.secondary),
              child: Text(
                'Newsly Menu',
                style: TextStyle(color: AppColors.onPrimary, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CategoryList(
              selectedCategory: 'general',
              onCategorySelected: (category) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryView(category: category),
                  ),
                );
              },
            ),
          ),
          const NewsListBuilder(category: 'general',),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.trending_up),
          //   label: 'Trending',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}