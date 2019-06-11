import 'package:flutter/material.dart';

class demo4 extends StatefulWidget {
  String title;
  demo4(this.title);
  @override
  _demo4State createState() => _demo4State();
}

class _demo4State extends State<demo4> {
  String _title ;
  @override
  void initState() {
    super.initState();
    _title = widget.title;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(_title),
        ),
      ),
    );
  }
}