import 'package:flutter/material.dart';

import 'package:responsive_container/responsive_container.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scrollable Web View Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Scrollable Web View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    // Determine landscape or portrait
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    // Allow scroll gestures - See https://medium.com/flutter-io/the-power-of-webviews-in-flutter-a56234b57df2
    /*
    var verticalGestures = Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer());
    var gestureSet = Set.from([verticalGestures]);
    */
    var gestureSet = null; // Except I can't get it to work

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body:

      ListView(
          children: <Widget>[

            Text('\r\n Karthik Ponnam is awesome\r\n'),

            ResponsiveContainer(
                widthPercent: 100,
                heightPercent: currentOrientation == Orientation.portrait ? 30 : 60,
                alignment: Alignment(0, 0),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: WebView(
                  initialUrl: 'https://github.com/PonnamKarthik/FlutterWebView',
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureRecognizers: gestureSet,
                )
            ),

            Text('\r\n Emily Fortuna is awesome\r\n'),

            ResponsiveContainer(
                widthPercent: 100,
                heightPercent: currentOrientation == Orientation.portrait ? 30 : 60,
                alignment: Alignment(0, 0),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: WebView(
                  initialUrl: 'https://medium.com/flutter-io/the-power-of-webviews-in-flutter-a56234b57df2',
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureRecognizers: gestureSet,
                )
            ),

            Text('\r\n I\'m patching for AndroidX?\r\n'),

            ResponsiveContainer(
                widthPercent: 100,
                heightPercent: currentOrientation == Orientation.portrait ? 30 : 60,
                alignment: Alignment(0, 0),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: WebView(
                  initialUrl: 'https://github.com/peeto/FlutterWebView/commit/7a43af67f1058719120c25ca416eff77de6a55eb',
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureRecognizers: gestureSet,
                )
            ),

            Text('\r\n Google\r\n'),

            ResponsiveContainer(
                widthPercent: 100,
                heightPercent: currentOrientation == Orientation.portrait ? 30 : 60,
                alignment: Alignment(0, 0),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: WebView(
                  initialUrl: 'https://google.com',
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureRecognizers: gestureSet,
                )
            ),

            Text('\r\n Me\r\n'),

            ResponsiveContainer(
                widthPercent: 100,
                heightPercent: currentOrientation == Orientation.portrait ? 30 : 60,
                alignment: Alignment(0, 0),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: WebView(
                  initialUrl: 'https://peeto.net',
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureRecognizers: gestureSet,
                )
            ),

            Text('\r\n I can\'t get Emily Fortuna\'s scrolling working\r\n'),

            ResponsiveContainer(
                widthPercent: 100,
                heightPercent: currentOrientation == Orientation.portrait ? 30 : 60,
                alignment: Alignment(0, 0),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: WebView(
                  initialUrl: 'https://www.youtube.com/watch?v=5cc_h5Ghuj4',
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureRecognizers: gestureSet,
                )
            ),

          ],
        )
    );
  }
}
