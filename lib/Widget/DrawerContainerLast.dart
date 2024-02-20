import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hover_menu/hover_menu.dart';

class DrawerContainerLast extends StatefulWidget {
  @override
  State<DrawerContainerLast> createState() => _DrawerContainerState();
}

class _DrawerContainerState extends State<DrawerContainerLast> {
  ValueNotifier<double> rightContainerWidth = ValueNotifier(0);

  bool openContainer = false;

  double containerHeight = Get.width * 0.05;

  void _toggleWidth() {
    if (rightContainerWidth.value == Get.width / 6) {
      rightContainerWidth.value = 0;
    } else {
      rightContainerWidth.value = Get.width / 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 100),

      height: Get.height - Get.height / 14, // Variable height
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: HoverMenu(
                    title: InkWell(
                      onTap: (){
                        _toggleWidth();

                      },
                      child: Icon(
                        Icons.calendar_month,
                        color: Colors.blue,
                      ),
                    ),
                    items: [
                      Text(
                        "Calendar",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: HoverMenu(
                    title: InkWell(
                      onTap: (){
                        _toggleWidth();
                      },
                      child: Icon(
                        Icons.lightbulb_circle,
                        color: Colors.yellow,
                      ),
                    ),
                    items: [
                      Text(
                        "Keep",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: HoverMenu(
                    title: InkWell(
                      onTap: (){
                        _toggleWidth();

                      },
                      child: Icon(
                        Icons.task,
                        color: Colors.blue,
                      ),
                    ),
                    items: [
                      Text(
                        "Task",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: HoverMenu(
                    title: InkWell(
                      onTap: (){
                        _toggleWidth();

                      },
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    items: [
                      Text(
                        "Contacts",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
         ValueListenableBuilder(valueListenable: rightContainerWidth, builder: (context,value,child){
           return  AnimatedContainer(
             color: Colors.white,
             duration: Duration(milliseconds: 200),
             width: rightContainerWidth.value,
           );
         })
        ],
      ),
    );
  }
}
