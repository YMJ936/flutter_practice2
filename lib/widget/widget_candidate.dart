import 'package:flutter/material.dart';

class CandWidget extends StatefulWidget {
  VoidCallback tap; //해당 위젯을 사용하는 부모 위젯에서 지정한 onTap을 전달해주는 기능
  String text;
  int index;
  double width;
  bool answerState;

  CandWidget(
      {super.key,
      required this.tap,
      required this.index,
      required this.width,
      required this.text,
      required this.answerState});
  @override
  _CandWidgetState createState() => _CandWidgetState();
}

class _CandWidgetState extends State<CandWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.1,
      padding: EdgeInsets.fromLTRB(
        widget.width * 0.048,
        widget.width * 0.024,
        widget.width * 0.048,
        widget.width * 0.024,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple),
        color: widget.answerState ? Colors.deepPurple : Colors.white,
      ),
      child: InkWell( //컨테이너처럼 별도의 제스쳐 기능을 제공하지 않는 위젯에 제스처 기능을 추가하고자 할 때 사용
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.width * 0.035,
            color: widget.answerState ? Colors.white : Colors.black,
          ),
        ),
        onTap: () {
          setState(() {
            widget.tap();
            widget.answerState = !widget.answerState;
          });
        },
      ),
    );
  }
}
