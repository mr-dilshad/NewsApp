import 'package:bicsom/bloc/news_bloc.dart';
import 'package:bicsom/models/news_model.dart';
import 'package:bicsom/widgets/news_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    bloc.fetchAllNews();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.filter_alt_rounded), Icon(Icons.notifications)],
        leading: Icon(Icons.account_circle),
      ),
      body: StreamBuilder(
        stream: bloc.allNews,
        builder: (context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center),
            label: 'Help',
          ),
        ],
      ),
    );
  }

  Widget buildList(AsyncSnapshot<NewsModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.articles.length,
      itemBuilder: (context, index) => NewsCard(article:snapshot.data.articles[index]),
    );
  }
}
