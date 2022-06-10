import 'package:codeui/copycodegit/customer_rect_tween.dart';
import 'package:codeui/copycodegit/styles.dart';
import 'package:codeui/widget/drop_down/widget_dropdown.dart';
import 'package:flutter/material.dart';
import 'hero_dialog_route.dart';

/// {@template add_todo_button}
/// Button to add a new [Todo].
///
/// Opens a [HeroDialogRoute] of [_AddTodoPopupCard].
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class AddTodoButton extends StatelessWidget {
  /// {@macro add_todo_button}
  const AddTodoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("active");
            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
              return ChoseProvince();
            }));
          },
          child: Hero(
            tag: _heroAddTodo,
            createRectTween: (begin, end) {
              return CustomRectTween(begin: begin, end: end);
            },
            child: Container(
              height: 35,
              width: 35,
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}

/// Tag-value used for the add todo popup button.
const String _heroAddTodo = 'add-todo-hero';

/// {@template add_todo_popup_card}
/// Popup card to add a new [Todo]. Should be used in conjuction with
/// [HeroDialogRoute] to achieve the popup effect.
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}

class ChoseProvince extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTodoPopupCard();
  }
}

class _AddTodoPopupCard extends State<ChoseProvince> {
  @override
  Widget build(BuildContext context) {
    Map<int, String> listClub = {1: "HVT", 2: "HG", 3: "UVK", 4: "DBP"};
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Stack(children: [
              Material(
                color: Colors.white,
                elevation: 2,
                type: MaterialType.canvas,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: SizedBox(
                    height: 180,
                    child: new LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return constraints.maxWidth > 50
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Tìm kiếm",
                                    ),
                                  ),
                                )
                              ],
                            )
                          : SizedBox();
                    })

                    // width: double.infinity,

                    ),
              ),
              new LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return constraints.maxWidth > 150
                    ? Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: WidgetDropDown(
                          clubs: listClub,
                          initClub: 1,
                          hasClub: true,
                          onSelect: (key) {
                            print("Select ne: " + key.toString());
                          },
                        ),
                      )
                    : SizedBox();
              }),
            ]),
          ),
        ),
      ),
    );
  }
}
