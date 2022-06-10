import 'package:codeui/models/class_model.dart';
import 'package:codeui/widget/common/common_widget.dart';
import 'package:codeui/widget/drop_down/widget_dropdown.dart';
import 'package:codeui/widget/item_class_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key key}) : super(key: key);

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  TextEditingController textSearch = TextEditingController();
  Map<int, String> listClub = {
    1: "UVK",
    2: "HVT",
    3: "HG",
    4: "DBP",
    5: "BH",
    6: "Q12"
  };
  List<ClassModel> listClass = [
    ClassModel(
        id: "1", image: "assets/images/basicyoga.jpg", title: "Basic Yoga"),
    ClassModel(
        id: "2", image: "assets/images/poweryoga.jpg", title: "Power Yoga"),
    ClassModel(
        id: "3",
        image: "assets/images/loweryoga.jpg",
        title: "Yoga for Lower Body"),
    ClassModel(
        id: "4",
        image: "assets/images/upperyoga.jpg",
        title: "Yoga for Upper Body"),
    ClassModel(id: "5", image: "assets/images/zumba.jpg", title: "Zumba"),
    ClassModel(
        id: "6", image: "assets/images/newdance.jpg", title: "New Dance"),
    ClassModel(
        id: "6", image: "assets/images/newdance.jpg", title: "New Dance"),
    ClassModel(
        id: "6", image: "assets/images/newdance.jpg", title: "New Dance"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 46, bottom: 38),
                child: Text(
                  "Lớp học",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "SVN-Poppins",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff555859)),
                ),
              ),
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  padding: EdgeInsets.only(bottom: 30, top: 130),
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 10),
                    itemBuilder: (context, index) {
                      return ItemClassWidget(
                        image: listClass[index].image,
                        title: listClass[index].title,
                      );
                    },
                    itemCount: listClass.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, top: 64),
                  child: WidgetDropDown(
                    clubs: listClub,
                    initClub: 1,
                    hasClub: true,
                    onSelect: (key) {
                      print("Select ne: " + key.toString());
                    },
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: WidgetDropDown(
                        clubs: listClub,
                        initClub: 1,
                        hasClub: true,
                        onSelect: (key) {
                          print("Select ne: " + key.toString());
                        },
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
