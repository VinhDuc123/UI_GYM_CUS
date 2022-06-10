import 'dart:async';

// import 'package:appcustomer/resource/widgets/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:rxdart/rxdart.dart';

import 'expanded_section.dart';
import 'my_scrollbar.dart';

class WidgetDropDown extends StatefulWidget {
  WidgetDropDown(
      {Key key,
      // this.dropdownController,
      this.clubs,
      this.onSelect,
      this.initClub,
      this.clubName,
      this.hasClub})
      : super(key: key);
  // final BehaviorSubject<bool> dropdownController;
  final Map<int, String> clubs;
  final Function onSelect;
  final int initClub;
  String clubName;
  final bool hasClub;
  @override
  _WidgetDropDownState createState() => _WidgetDropDownState();
}

class _WidgetDropDownState extends State<WidgetDropDown> {
  bool isStrechedDropDown = false;
  int groupValue;
  //todo language
  String title = 'Chọn club';
  StreamSubscription listenDropdown;
  Map<int, String> clubs;

  @override
  void initState() {
    super.initState();
    clubs = widget.clubs;

    try {
      if (widget.initClub != null) {
        title = widget.clubs[widget.initClub];
      }
    } catch (e) {
      print(e);
    }

    // listenDropdown = widget.dropdownController.listen((value) {
    //   setState(() {
    //     isStrechedDropDown = value;
    //   });
    // });
  }

  @override
  void dispose() {
    // listenDropdown.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> lstDropdown = [];
    clubs.forEach((key, value) {
      lstDropdown.add(FlatButton(
          onPressed: () {
            if (widget.hasClub) {
              setState(() {
                isStrechedDropDown = false;
                title = value ?? "";
              });
              widget.onSelect(key);
            }
          },
          splashColor: Colors.grey[200],
          child: Text(value ?? "",
              style: TextStyle(
                  color: Color.fromARGB(255, 107, 111, 117),
                  fontWeight: FontWeight.w700,
                  fontFamily: "OpenSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0))));
    });
    return Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200],
                            offset: Offset(0, 2),
                            blurRadius: 12,
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          try {
                            if (widget.hasClub && widget.clubs.length > 1)
                              setState(() {
                                isStrechedDropDown = !isStrechedDropDown;
                              });
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Container(
                            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                            height: 48,
                            decoration: BoxDecoration(
                              color: widget.hasClub ? Colors.white : Colors.red,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[200],
                                    offset: Offset(0, 6),
                                    blurRadius: 12,
                                    spreadRadius: 0),
                              ],
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(title,
                                      style: TextStyle(
                                          color: widget.hasClub
                                              ? Color(0xff999DA3)
                                              : Colors.red,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                          fontSize: 15)),
                                  isStrechedDropDown
                                      ? Icon(Icons.arrow_right_outlined,
                                          size: 20,
                                          color: widget.hasClub
                                              ? null
                                              : Colors.red)
                                      : Icon(Icons.arrow_left_outlined,
                                          size: 20,
                                          color: widget.hasClub
                                              ? null
                                              : Colors.red),
                                ])),
                      ),
                      ExpandedSection(
                        expand: isStrechedDropDown,
                        height: 100,
                        child: MyScrollbar(
                            builder: (context, scrollController2) => ListView(
                                  padding: EdgeInsets.only(top: 5),
                                  controller: scrollController2,
                                  shrinkWrap: true,
                                  children: lstDropdown,
                                )),
                      )
                    ],
                  ),
                )),
              ],
            )
          ],
        ));
  }
}
