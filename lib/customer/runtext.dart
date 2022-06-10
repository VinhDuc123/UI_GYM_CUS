import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RunText extends StatefulWidget {
  const RunText({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<RunText> createState() => _RunTextState();
}

class _RunTextState extends State<RunText> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<int> showMembershipCount;
  // static const String membership = "BASIC";
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: Duration(milliseconds: 400), vsync: this);
    showMembershipCount = StepTween(begin: 0, end: widget.title.length).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn))
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {}
      })
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          showMembershipCount == null
              ? null
              : AnimatedBuilder(
                  animation: showMembershipCount,
                  builder: (BuildContext context, Widget child) {
                    String text =
                        widget.title.substring(0, showMembershipCount.value);
                    return Row(
                      children: [
                        Text(text,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        SizedBox(width: 6),
                        SvgPicture.asset(
                          "assets/icon/run.svg",
                          color: Colors.white,
                          height: 28,
                        )
                      ],
                    );
                  })
        ]),
      ),
    );
  }
}
