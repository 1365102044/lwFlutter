import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHouseWidgets.dart';

class Find extends StatefulWidget {
  @override
  FindState createState() => FindState();
}

class FindState extends State<Find> {
  TextStyle sty = TextStyle(backgroundColor: Colors.red);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('发现'),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
              color: Colors.yellow,
              child: houseTopWidget(context, 'quyuText', 'timeText',callBlackBlock: (index){

              }),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            )
          ],
        )),
      ),
    );
  }
}
