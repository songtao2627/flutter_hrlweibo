import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Returning Data',
      home: MyScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('点我'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("--$result")));
  }
}

class PageContent extends StatelessWidget {
  PageContent(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Text(text,
              style: TextStyle(color: Theme.of(context).accentColor))),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _currentindex = 0;
  final List<Widget> _pages = [Home(), News(), Profiles()];
  final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('新闻')),
    BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("欢迎"),
      ),
      body: _pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        items: _barItems,
        onTap: (index) {
          setState(() {
            print(index);
            this._currentindex = index;
          });
        },
        currentIndex: _currentindex,
        fixedColor: Theme.of(context).accentColor,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContent("Home");
  }
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContent("News");
  }
}

class Profiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContent("Profiles");
  }
}
