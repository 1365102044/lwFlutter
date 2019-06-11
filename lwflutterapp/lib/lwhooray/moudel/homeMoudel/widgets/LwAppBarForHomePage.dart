import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../LwHomePage.dart';

/// 自定义 APPbar
class lwAppBarForHomePage extends StatefulWidget
    implements PreferredSizeWidget {
  String title = '';
  String leftText;
  Function callBlackBlock;
  BuildContext context;
  lwAppBarForHomePage(this.title,{Key key,this.leftText, this.callBlackBlock}):super(key: key);
  @override
  lwAppBarForHomePageState createState() => lwAppBarForHomePageState();
  @override
  Size get preferredSize => Size.fromHeight(64);
}

class lwAppBarForHomePageState extends State<lwAppBarForHomePage> {
  String _title;
  String _leftText;
  BuildContext _context;
  Function _callBlackBlock;

  GlobalKey myKey = new GlobalKey();
  @override
  void initState() {
    super.initState();
    
    setState(() {
      _title = widget.title;
      _leftText = widget.leftText;
      _callBlackBlock = widget.callBlackBlock;
    });
  }
   void changeLeftText(String str){
    _leftText = str;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin:(MediaQuery.of(context).padding.top != 44.0) ?EdgeInsets.fromLTRB(10, 35, 0, 5) :EdgeInsets.fromLTRB(10, 50, 0, 5),
              padding: EdgeInsets.fromLTRB(10, 8, 1, 10),
              // color: Colors.red,
              child: Container(
                height: 31,
                width: 70,
                child: Center(
                  child: Text(_leftText,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
            ),
            onTap: _callBlackBlock,
          ),
            Expanded(
              child: Container(
              alignment: Alignment.center,
              padding:(MediaQuery.of(context).padding.top != 44.0) ?EdgeInsets.fromLTRB(0, 30, 90, 0) : EdgeInsets.fromLTRB(0, 40, 90, 0),
              child: Container(
                child: Text(
                  _title,
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),

            ),
            )
        ],
      ),
    );
  }
}
