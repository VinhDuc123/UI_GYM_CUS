import 'package:flutter/material.dart';

Widget buildSearch(BuildContext context, TextEditingController textSearch) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    height: 48,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          TextField(
            controller: textSearch,
            onChanged: (value) {},
            onSubmitted: (value) {
              print("Search ne");
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                // contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                hintText: "       Tìm kiếm"),
          ),
          Container(
            width: 50,
            child: IconButton(
                splashColor: Colors.transparent,
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                onPressed: () {
                  print("Search ne");
                  FocusScope.of(context).requestFocus(new FocusNode());
                }),
          )
        ],
      ),
    ),
  );
}
