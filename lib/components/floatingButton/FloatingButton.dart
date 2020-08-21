import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  final changeIndex;
  final int index;
  const FloatingButton({Key key, this.index, this.changeIndex}) : super(key: key);

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white
      ),
      child: FloatingActionButton(
          backgroundColor: widget.index == 1 ? Colors.lightBlue : Colors.blueAccent,
          child: Icon(Icons.add, size: 30,),
          onPressed: () {
            widget.changeIndex(1);
          }
      ),
    );
  }
}

