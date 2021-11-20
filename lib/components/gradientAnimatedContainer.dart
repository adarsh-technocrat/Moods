import 'package:flutter/material.dart';

class GradientAnimatedContainer extends StatefulWidget {
  final Widget child;
  final bool isSelected;

  const GradientAnimatedContainer({Key key, this.isSelected, this.child})
      : super(key: key);

  @override
  _GradientAnimatedContainerState createState() =>
      _GradientAnimatedContainerState();
}

class _GradientAnimatedContainerState extends State<GradientAnimatedContainer> {
  List<Color> colorList = [
    Color(0xff4fcf70),
    Color(0xfffad648),
    Color(0xffa767e5),
    Color(0xff12bcfe),
    Color(0xff44ce7b),
  ];

  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.centerLeft;
  Alignment end = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected)
      Future.delayed(const Duration(milliseconds: 1), () {
        setState(() {
          bottomColor = Colors.blue;
        });
      });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedContainer(
        decoration: widget.isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: begin, end: end, colors: [bottomColor, topColor]),
              )
            : BoxDecoration(),
        duration: Duration(milliseconds: 200),
        onEnd: () {
          setState(() {
            index = index + 1;
            // animate the color
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];

            // animate the alignment
            begin = alignmentList[index % alignmentList.length];
            end = alignmentList[(index + 2) % alignmentList.length];
          });
        },
        child: widget.child,
      ),
    );
  }
}
