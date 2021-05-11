import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: TopBannerPage(),
    );
  }
}

class TopBannerPage extends StatefulWidget {
  @override
  _TopBannerPageState createState() => _TopBannerPageState();
}

class _TopBannerPageState extends State<TopBannerPage> {
  final _itemCount = 7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (BuildContext context, int index){
              return Image.network('https://picsum.photos/200/300', fit: BoxFit.cover,);
            },
            itemCount: _itemCount,
          ),
        ],
      ),

    );
  }
}
