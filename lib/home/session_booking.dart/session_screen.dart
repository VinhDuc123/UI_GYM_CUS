import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 3),
            child: SvgPicture.asset("assets/images/gymb.svg"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: SvgPicture.asset("assets/images/gyma.svg"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Center(child: Text("lo")),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.1,
                    0.4,
                    0.6,
                    0.9,
                  ],
                  colors: [
                    Colors.yellow,
                    Colors.red,
                    Colors.indigo,
                    Colors.teal,
                  ],
                )),
          )
        ],
      ),
    );
  }
}
