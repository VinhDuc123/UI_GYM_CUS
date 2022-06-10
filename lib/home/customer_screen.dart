import 'package:codeui/animations/animations.dart';
import 'package:codeui/copycodegit/add_todo_button.dart';
import 'package:codeui/home/session_booking.dart/session_screen.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [buildHeader(), buildBody],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Center(
            child: Text(
              "Huấn Luyện Viên",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 21,
          child: AddTodoButton(),
        ),
      ],
    );
  }

  Widget get buildBody => Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.all(7),
          margin: EdgeInsets.fromLTRB(14, 20, 14, 0),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
          child: Container(
            child: TabBar(
                // indicatorColor: Colors.red,
                controller: _tabController,
                isScrollable: true,
                // indicatorColor: Colors.white,
                indicatorWeight: 0.1,
                unselectedLabelColor: Color.fromARGB(255, 141, 145, 151),
                labelColor: Colors.grey[600],
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "OpenSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                tabs: [
                  SizedBox(
                      width: 69,
                      child: Tab(
                          child: Text("Danh sách",
                              style: TextStyle(fontSize: 12)))),
                  SizedBox(
                    width: 69,
                    child: Tab(
                        child:
                            Text("Lịch tập", style: TextStyle(fontSize: 13))),
                  ),
                  SizedBox(
                    width: 69,
                    child: Tab(
                        child: Text("Trải nghiệm",
                            style: TextStyle(fontSize: 13))),
                  ),
                  SizedBox(
                    width: 69,
                    child: Tab(
                        child: Text("Lịch sử", style: TextStyle(fontSize: 13))),
                  ),
                ]),
          ),
        ),
        Expanded(
            child: TabBarView(controller: _tabController, children: <Widget>[
          Container(
              child: Center(
            child: Text("Trang 1"),
          )),
          SessionScreen(),
          Container(
              child: Center(
            child: Text("Trang 3"),
          )),
          Container(
              child: Center(
            child: Text("Trang 4"),
          )),
        ]))
      ]));
}
