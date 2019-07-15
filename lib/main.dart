import 'package:flutter/material.dart';

import 'package:overlay_container/overlay_container.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:webview_flutter/webview_flutter.dart';
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

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            // Overlay to fix iOS overlay bug
            // without this iOS will display a webview over the container when scrolling up
            OverlayContainer(
                asWideAsParent: true,
                show: true,
                child: Container(
                  height: 40.0,
                  child: Text('Heading'),
                )
            ),

            // Duplicate of above container to use as underlay and keep widget tree relatively intact
            Container(
              height: 40.0,
              child: Text('Heading'),
            ),

            Expanded(
                child: ListView(
                  shrinkWrap: false,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[

                    Text('\r\n Karthik Ponnam is awesome\r\n'),

                    // For a WebView to work within a ListView it needs it's size set
                    // Use a ResponsiveContainer to set relative sizes
                    ResponsiveContainer(
                        widthPercent: 100,
                        heightPercent: currentOrientation == Orientation.portrait ? 30 : 60,
                        alignment: Alignment(0, 0),
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: WebView(
                          initialUrl: 'https://github.com/PonnamKarthik/FlutterWebView',
                          javascriptMode: JavascriptMode.unrestricted,
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
                        )
                    ),

                  ],
                )
            )

          ],
        )

    );
  }
}
