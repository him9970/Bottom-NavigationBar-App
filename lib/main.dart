import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom Navigation App",
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bottom Navigation App"),
      ),

      body: new TabBarView(
        children: <Widget>[
          new NewPage("Page One"),
          new NewPage("Page Two"),
          new NewPage("Page Three"),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: new Material(
        color: Colors.red,
        child: new TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            
            new Tab(
              icon: new Icon(Icons.favorite),
            ),

            new Tab(
              icon: new Icon(Icons.music_video),
            )
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {

  final String title;
  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}
