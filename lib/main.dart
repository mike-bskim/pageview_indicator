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

final _itemCount = 7;
Size size;

class _TopBannerPageState extends State<TopBannerPage> {
  PageController _pageController = PageController();
  LittleDotsPainter _littleDotsPainter = LittleDotsPainter(_itemCount, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(onPageChanged);
  }

  void onPageChanged() {
    setState(() {
      _littleDotsPainter = LittleDotsPainter(_itemCount, _pageController.page);
    });
//    print(_pageController.page);
  }

  @override
  Widget build(BuildContext context) {
    if(size == null) {
      size = MediaQuery.of(context).size;
    }

//    print(size.width.toString());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _images(),
          Positioned(
            left: size.width / 2 - _itemCount * 7,
//            left: 100,
            right: size.width / 2 - _itemCount * 7,
            bottom: 50,
            height: size.width / _itemCount / 2,
            child: CustomPaint(
              painter: _littleDotsPainter,
            ),
          )
        ],
      ),
    );
  }

  PageView _images() {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          'https://picsum.photos/200/300',
          fit: BoxFit.cover,
        );
      },
      itemCount: _itemCount,
    );
  }
}

class LittleDotsPainter extends CustomPainter {
  final int numOfDots;
  final double page;

  LittleDotsPainter(this.numOfDots, this.page);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    for (int i = 0; i < numOfDots; i++) {
      canvas.drawCircle(
          Offset(size.width / numOfDots * i + (size.width / numOfDots / 2), 0),
//          Offset((i*15*3).toDouble(), 0),
//          10,
          size.width / _itemCount / 4, //반지름
          Paint()
            ..color = Colors.white54
            ..strokeWidth = 2
            ..style = PaintingStyle.stroke);
    }
//    print('width: ${size.width}, numOfDots: $numOfDots');
    canvas.drawCircle(
        Offset(size.width / numOfDots * page + (size.width / numOfDots / 2), 0),
        size.width / _itemCount / 3,
        Paint()
          ..color = Colors.black87
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
//    throw UnimplementedError();
    return (oldDelegate as LittleDotsPainter).page != page;
  }
}


List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++){
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == i
            ? Color.fromRGBO(255, 255, 255, 0.9)
            : Color.fromRGBO(255, 255, 255, 0.4),
      ),
    ),);
  }

  return results;
}
