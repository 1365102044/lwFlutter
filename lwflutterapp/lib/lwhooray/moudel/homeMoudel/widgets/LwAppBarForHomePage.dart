import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自定义 APPbar
class lwAppBarForHomePage extends StatefulWidget
    implements PreferredSizeWidget {
  String title = '';
  String leftText;
  Function callBlackBlock;
  lwAppBarForHomePage(this.title, {this.leftText, this.callBlackBlock});
  @override
  _lwAppBarForHomePageState createState() => _lwAppBarForHomePageState();
  @override
  Size get preferredSize => Size.fromHeight(55);
}

class _lwAppBarForHomePageState extends State<lwAppBarForHomePage> {
  String _title;
  String _leftText;
  Function _callBlackBlock;
  @override
  void initState() {
    super.initState();
    print('---------3333-$_title');
    setState(() {
      print('---------3333-$_title');
      _title = widget.title;
      _leftText = widget.leftText;
      _callBlackBlock = widget.callBlackBlock;
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('-------------didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 50, 0, 5),
              padding: EdgeInsets.fromLTRB(10, 8, 1, 10),
              // color: Colors.red,
              child: Container(
                height: 40,
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
              padding: EdgeInsets.fromLTRB(0, 40, 90, 0),
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
