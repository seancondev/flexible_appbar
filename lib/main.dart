import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),*/
      drawer: _buildDrawer(context, 'The Title', 'assets/bkg.jpg'),
      body: _buildCustomScrollViewBody(
          context, 'The Title', 'assets/bkgorange.jpg'),
      floatingActionButton: _buildFAB(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'You have pushed the button this many times:',
          ),
          new Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, String title, String img) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: const Text('Zach Widget'),
            accountEmail: const Text('zach.widget@example.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage(img),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                onTap: () {},
                child: new Semantics(
                  label: 'Switch to Account B',
                  child: new CircleAvatar(
                    backgroundImage: new AssetImage(img),
                  ),
                ),
              ),
              new GestureDetector(
                onTap: () {},
                child: new Semantics(
                  label: 'Switch to Account C',
                  child: new CircleAvatar(
                    backgroundImage: new AssetImage(img),
                  ),
                ),
              ),
            ],
            margin: EdgeInsets.zero,
            onDetailsPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCustomScrollViewBody(
      BuildContext context, String title, String img) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          pinned: true,
          expandedHeight: 170.0,
          flexibleSpace: new FlexibleSpaceBar(
            title: new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ConstrainedBox(
                      constraints:
                      new BoxConstraints.loose(new Size(70.0, 70.0)),
                      // new BoxConstraints.loose(new Size(70.0, 70.0)),
                      child: new Image.asset('assets/web_hi_res_512.png')),
                  new Text(title),
                ],
              ),
            ),
            background: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Image.asset(
                  img,
                  fit: BoxFit.cover,
                  height: 100.0,
                ),
                const DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: const LinearGradient(
                      begin: const Alignment(0.0, -1.0),
                      end: const Alignment(0.0, -0.4),
                      colors: const <Color>[
                        Colors.black87,
                        const Color(0xFFFFFF)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black87,
          centerTitle: true,
          /*leading: new IconButton(
            icon: new Image.asset(img),
            alignment: Alignment.centerRight,
            tooltip: 'Image',
            onPressed: () {
              Navigator.pop(context);
            },
          ),*/
        ),
        new SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: new Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFAB(BuildContext context) {
    return new FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: new Icon(Icons.add),
    );
  }

  Widget _buildCopy(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
