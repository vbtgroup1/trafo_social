import 'package:flutter/material.dart';
import 'package:travel_blog/ui/detail/viewmodel/detail_viewmodel.dart';

class HomeView extends DetailViewModel {
  double get appBarButtonSize => MediaQuery.of(context).size.width * 0.08;
  double get appBarTitleSize => MediaQuery.of(context).size.width * 0.08;
  final storyList = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildListViewStories(),
      bottomNavigationBar: BottomNavigationBar(items: [
        buildBottomNavigationBarItem('Food', Icons.ac_unit),
        buildBottomNavigationBarItem('Travel', Icons.ac_unit),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String text, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(text),
    );
  }

  ListView buildListViewStories() {
    return ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${storyList[index]}'),
          );
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: buildIconButtonProfile(),
      title: buildTextMainTitle('Home Page'),
      actions: [
        buildIconButtonSearch(),
      ],
    );
  }

  IconButton buildIconButtonSearch() {
    return IconButton(
      icon: Icon(Icons.search),
      iconSize: appBarButtonSize,
      onPressed: () {},
      color: Colors.black,
    );
  }

  Text buildTextMainTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: appBarTitleSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  IconButton buildIconButtonProfile() {
    return IconButton(
      icon: Icon(Icons.ac_unit),
      iconSize: appBarButtonSize,
      color: Colors.black,
      onPressed: () {},
    );
  }
}
