import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TNGExtra extends StatefulWidget {
  const TNGExtra({Key key}) : super(key: key);

  @override
  State<TNGExtra> createState() => _TNGExtraState();
}

class _TNGExtraState extends State<TNGExtra>
    with SingleTickerProviderStateMixin {
  // double leftAnimation = 14;
  String title = "EXTRA";
  AnimationController animationController;
  Animation<int> showMembershipCount;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: Duration(milliseconds: 400), vsync: this);
    showMembershipCount = StepTween(begin: 0, end: title.length).animate(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00A2C4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  width: MediaQuery.of(context).size.width,
                  height: 276,
                  // padding: EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 27,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          'TNG PAY',
                          style: TextStyle(
                              fontSize: 45,
                              fontFamily: "SVN-Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 65,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "#thenewgym",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SVN-Poppins",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "thenewgym.vn",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "SVN-Poppins",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 14,
                  bottom: 110,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        showMembershipCount == null
                            ? null
                            : AnimatedBuilder(
                                animation: showMembershipCount,
                                builder: (BuildContext context, Widget child) {
                                  String text = title.substring(
                                      0, showMembershipCount.value);
                                  return Row(
                                    children: [
                                      Text(text,
                                          style: TextStyle(
                                            fontSize: 45,
                                            fontFamily: "SVN-Poppins",
                                            fontWeight: FontWeight.w600,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 1
                                              ..color = Colors.white,
                                          )),
                                      SizedBox(width: 6),
                                      SvgPicture.asset(
                                        "assets/images/run.svg",
                                        color: Colors.white,
                                        height: 28,
                                      )
                                    ],
                                  );
                                })
                      ]),
                ),
              ]),
              buildCardMembership(),
              Padding(
                padding: EdgeInsets.fromLTRB(14, 32, 0, 0),
                child: Text(
                  "Thông tin gói tập",
                  style: TextStyle(
                      fontFamily: "SVN-Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 25, bottom: 28),
                margin: EdgeInsets.only(left: 14, right: 14, top: 19),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(30, 141, 145, 151),
                        offset: Offset(0, 10),
                        blurRadius: 12,
                        spreadRadius: 0),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildCardDetail(
                        title: "Homeclub:",
                        subtitle: "The New Gym - Nguyễn Thị Thập"),
                    buildCardDetail(
                        title: "Giói tập: ", subtitle: "TNG Pay Basic"),
                    buildCardDetail(
                        title: "Ngày bắt đầu: ", subtitle: "12/12/2022"),
                    buildCardDetail(
                        title: "Ngày kết thúc: ", subtitle: "12/12/2023"),
                  ],
                ),
              ),
              SizedBox(
                height: 89,
              ),
              buildButton(
                  title: "Gia hạn gói tập",
                  textColor: Colors.white,
                  backgroundColor: Color(0xffFE7000),
                  borderColor: Colors.transparent,
                  callback: () {
                    print("alo1");
                  }),
              buildButton(
                  title: "Thay đổi gói khác",
                  textColor: Color(0xffFE7000),
                  backgroundColor: Colors.white,
                  borderColor: Color(0xffFE7000),
                  callback: () {
                    print("alo2");
                  }),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardMembership() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 91,
      padding: EdgeInsets.only(left: 0, right: 14),
      margin: EdgeInsets.only(left: 14, right: 14, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(30, 141, 145, 151),
              offset: Offset(0, 10),
              blurRadius: 12,
              spreadRadius: 0),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "awd ",
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace stackTrace) {
                          return Center(child: Icon(Icons.person));
                        },
                      ),
                    )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    "Hội viên TNG từ ngày: ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontFamily: "SVN-Poppins", fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 32,
            // width: 90,
            padding: EdgeInsets.all(5),
            // margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                color: Color(0xff00A2C4),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                "12/12/2022",
                style:
                    TextStyle(fontFamily: "SVN-Poppins", color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCardDetail({String title, String subtitle}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //     border: Border(
      //   bottom: BorderSide(color: Colors.black),
      // )),
      padding: EdgeInsets.only(left: 0, right: 10, top: 2, bottom: 10),
      margin: EdgeInsets.only(left: 12, right: 14),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Icon(
              Icons.check_circle,
              color: Color(0xff3EB72A),
              size: 26,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey[200]),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: "SVN-Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: "SVN-Poppins",
                        fontSize: 16,
                        color: Color(0xff00A2C4)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton(
      {String title,
      Color textColor,
      Color backgroundColor,
      Color borderColor,
      Function callback}) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 26, right: 26, bottom: 5),
        margin: EdgeInsets.only(left: 26, right: 26, bottom: 8),
        decoration: BoxDecoration(
            border: Border.all(width: 0.85, color: borderColor),
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
