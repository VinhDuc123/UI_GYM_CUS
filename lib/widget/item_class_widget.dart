import 'package:flutter/material.dart';

class ItemClassWidget extends StatefulWidget {
  final String image;
  final String title;
  const ItemClassWidget({Key key, this.image, this.title}) : super(key: key);

  @override
  State<ItemClassWidget> createState() => _ItemClassWidgetState();
}

class _ItemClassWidgetState extends State<ItemClassWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: 80,
        padding: const EdgeInsets.only(left: 14, right: 14),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(30, 141, 145, 151),
                offset: Offset(0, 4),
                blurRadius: 12,
                spreadRadius: 0)
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                  height: 66,
                  width: 66,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  )),
              SizedBox(width: 14),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xff00A2C4),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Image.asset("assets/icons/calendar.jpg"),
                      SizedBox(width: 8),
                      Text(
                        "Today",
                        style: TextStyle(color: Color(0xff555859)),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 20.0,
                        width: 1.0,
                        color: Color(0xffEDF1F7),
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Image.asset("assets/icons/clock.jpg"),
                      SizedBox(width: 8),
                      Text(
                        "17:00 (45 mins)",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xff555859)),
                      ),
                    ],
                  ),
                ],
              )
            ]),
            size.width > 390
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return PopupMenuButton(
                          offset: Offset(-20, -75),
                          elevation: 1.5,
                          child: Image.asset(
                            "assets/icons/ischeck.jpg",
                            fit: BoxFit.cover,
                            height: 30,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              enabled: false,
                              height: 60,
                              child: Container(
                                // height: 30,
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: Stack(
                                  children: [
                                    Text(
                                      "Nội dung gi đó Nội dung gi đó Nội dung gi đó Nội dung gi đó  ",
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 13),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Positioned(
                                        bottom: -15,
                                        right: -10,
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.blueAccent,
                                          size: 30,
                                        )),
                                  ],
                                ),
                              ),
                              value: 1,
                            ),
                          ],
                          onCanceled: () {
                            print("cancel");
                          },
                        );
                        // Positioned(
                        //     bottom: 50,
                        //     right: 0,
                        //     child: Icon(
                        //       Icons.arrow_drop_down,
                        //       size: 30,
                        //     )),
                      },
                    ))
                : SizedBox()
          ],
        ));
  }
}
