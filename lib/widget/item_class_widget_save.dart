// import 'package:flutter/material.dart';

// class ItemClassWidget extends StatefulWidget {
//   final String image;
//   final String title;
//   const ItemClassWidget({Key key, this.image, this.title}) : super(key: key);

//   @override
//   State<ItemClassWidget> createState() => _ItemClassWidgetState();
// }

// class _ItemClassWidgetState extends State<ItemClassWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.only(left: 15),
//       margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//               color: Color.fromARGB(30, 141, 145, 151),
//               offset: Offset(0, 4),
//               blurRadius: 12,
//               spreadRadius: 0)
//         ],
//         color: Colors.white,
//       ),
//       child: Row(
//         children: [
//           Container(
//               margin: EdgeInsets.only(right: 12),
//               height: 66,
//               width: 66,
//               child: Image.asset(
//                 widget.image,
//                 fit: BoxFit.cover,
//               )),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                     padding: EdgeInsets.only(top: 15),
//                     child: Text(
//                       widget.title,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           color: Color(0xff00A2C4),
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                     )),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   children: [
//                     Image.asset("assets/icons/calendar.jpg"),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8, right: 8),
//                         child: Text(
//                           "Today",
//                           style: TextStyle(color: Color(0xff555859)),
//                         )),
//                     Container(
//                       height: 20.0,
//                       width: 1.0,
//                       color: Color(0xffEDF1F7),
//                       margin: const EdgeInsets.only(left: 10.0, right: 10.0),
//                     ),
//                     Image.asset("assets/icons/clock.jpg"),
//                     Padding(
//                         padding: EdgeInsets.only(left: 8, right: 8),
//                         child: Text(
//                           "17:00 (45 mins)",
//                           style: TextStyle(color: Color(0xff555859)),
//                         )),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: MediaQuery.of(context).size.width / 2 + 20, top: 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(" "),
//                       GestureDetector(
//                         onTap: () {
//                           print("is check");
//                         },
//                         child: Container(
//                             height: 30,
//                             width: 30,
//                             child: Image.asset(
//                               "assets/icons/ischeck.jpg",
//                               fit: BoxFit.cover,
//                             )),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
