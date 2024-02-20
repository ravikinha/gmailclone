import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/Mail.dart';
import '../Widget/Primary.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    // Create a TabController with two tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: Get.height - Get.height / 14,
        width: Get.width ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              width: Get.width/2,
              height: Get.height/14,
              child: TabBar(
                dividerColor: Colors.transparent,
                controller: _tabController,
                tabs: const [
                  Row(
                    children: [
                    Icon(Icons.inbox,color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text('Primary',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite_border,color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text('Promoton',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_2_outlined,color: Colors.black,),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text('Social',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      key: const PageStorageKey('Tab1Key'),

                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mailList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PrimaryWidget(
                            mail: mailList[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      key: const PageStorageKey('Tab2Key'),

                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mailList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PrimaryWidget(
                            mail: mailList[index],
                          );
                        },
                      ),
                    ),
                  ),
                  const Center(child: Text("Social"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
