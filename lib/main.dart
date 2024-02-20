import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'Screens/Home.dart';
import 'Widget/DrawerContainerLast.dart';
import 'library/hover.dart';
import 'names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const MyContainer());
  }
}

class MyContainer extends StatefulWidget {
  const MyContainer({super.key});

  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> with WidgetsBindingObserver {
  // variables
  ValueNotifier<bool> expanded = ValueNotifier(false);

  ValueNotifier<bool> visibleMore = ValueNotifier(false);
  ValueNotifier<bool> openContainer = ValueNotifier(false);
  ValueNotifier<double> containerHeight =
      ValueNotifier(Get.width * 0.05 < 80 ? 80 : Get.width * 0.05);
  ValueNotifier<double> inboxContainer = ValueNotifier(0);
  ValueNotifier<bool> inboxOpen = ValueNotifier(true);

  _toggleinboxContainer() {
    // toggle container

    if (inboxOpen.value) {
      inboxContainer.value = Get.height / 20;
    } else {
      inboxContainer.value = Get.height / 1.5;
    }
    inboxOpen.value = !inboxOpen.value;
  }

  _openContainer() {
    // open add gmail container
    inboxContainer.value = Get.height / 1.5;
  }

  _closeContainer() {
    // close gmail add container
    inboxContainer.value = 0;
  }

  void toggleHeight() {
    // toggle width and height

    expanded.value = !expanded.value;
    openContainer.value = !openContainer.value;
    containerHeight.value = ((containerHeight.value == Get.width * 0.05) ||
            (containerHeight.value == 80))
        ? Get.width * 0.15
        : Get.width * 0.05 < 80
            ? 80
            : Get.width * 0.05;
  }

  void _toggleVisibleMore() {
    // more section toggle
    visibleMore.value = !visibleMore.value;
    // });
  }

  void _openHeight() {

    // make large left container

    if (!expanded.value) {
      openContainer.value = true;
      containerHeight.value = Get.width * 0.15;
    }
  }

  void _closeHeight() {
    // make small left container
    if (!expanded.value) {
      openContainer.value = false;
      containerHeight.value = Get.width * 0.05 < 80 ? 80 : Get.width * 0.05;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    setState(() {});
    // This method is called when the window size changes, including tab changes.
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      HoverMenus( // use for hcall hover functions
                          title: GestureDetector(
                              onTap: () {
                                toggleHeight();
                              },
                              child: const Icon(
                                Icons.menu,
                                color: Colors.black,
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.network(  // google network image
                          "$gmailImage",
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      width: Get.width / 1.8,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.transparent)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Search mail",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.question_mark_outlined,
                        size: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.settings,
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: containerHeight,
                    builder: (context, value, child) {
                      return AnimatedContainer(
                        duration:
                            const Duration(milliseconds: 0), // Animation duration
                        width: containerHeight.value, // Fixed width
                        height: Get.height - Get.height / 14, // Variable height
                        color: Colors.grey[200],
                        alignment: Alignment.center,
                        child: Center(
                          child: MouseRegion(
                            onEnter: (v) {
                              _openHeight();
                            },
                            onExit: (v) {
                              _closeHeight();
                            },
                            child: Container(
                                color: Colors.grey[200],
                                child: ValueListenableBuilder(
                                    valueListenable: openContainer,
                                    builder: (conext, value, child) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              children: [
                                                FloatingActionButton.extended(
                                                  backgroundColor: Colors
                                                      .lightBlueAccent[100],
                                                  hoverElevation: 2,
                                                  elevation: 0,
                                                  onPressed: () {
                                                    _openContainer();
                                                  },
                                                  label: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        MdiIcons.pencil,
                                                        color: Colors.black,
                                                        size: 17,
                                                      ),
                                                      openContainer.value
                                                          ? const Text(
                                                              ' Compose',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                            )
                                                          : Container(),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4),
                                            child: HoverMenus(
                                              title: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.inbox,
                                                    color: Colors.black,
                                                  ),
                                                  openContainer.value
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Text(
                                                            "Inbox",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      : Container()
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4),
                                            child: HoverMenus(
                                              title: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star_border,
                                                    color: Colors.black,
                                                  ),
                                                  openContainer.value
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Text(
                                                            "Starred",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        )
                                                      : Container()
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4),
                                            child: HoverMenus(
                                              title: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.snooze,
                                                    color: Colors.black,
                                                  ),
                                                  openContainer.value
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Text(
                                                            "Snoozed",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      : Container()
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4),
                                            child: HoverMenus(
                                              title: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.send_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  openContainer.value
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Text(
                                                            "Sent",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        )
                                                      : Container()
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4),
                                            child: HoverMenus(
                                              title: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.drafts_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  openContainer.value
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Text(
                                                            "Draft",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      : Container()
                                                ],
                                              ),
                                            ),
                                          ),
                                          ValueListenableBuilder(
                                              valueListenable: visibleMore,
                                              builder: (context, value, child) {
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8.0,
                                                          vertical: 4),
                                                      child: HoverMenus(
                                                        title: GestureDetector(
                                                          onTap: () {
                                                            _toggleVisibleMore();
                                                          },
                                                          child:
                                                              !visibleMore.value
                                                                  ? Row(
                                                                      children: [
                                                                        const Icon(
                                                                          Icons
                                                                              .arrow_drop_down,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                        openContainer.value
                                                                            ? const Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                                child: Text(
                                                                                  "More",
                                                                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              )
                                                                            : Container()
                                                                      ],
                                                                    )
                                                                  : Row(
                                                                      children: [
                                                                        const Icon(
                                                                          Icons
                                                                              .arrow_drop_up,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                        openContainer.value
                                                                            ? const Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                                child: Text(
                                                                                  "Less",
                                                                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              )
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                        ),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible:
                                                          visibleMore.value,
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8.0,
                                                                    vertical:
                                                                        4),
                                                            child: HoverMenus(
                                                              title: Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons.chat,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  openContainer
                                                                          .value
                                                                      ? const Padding(
                                                                          padding: EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 8.0),
                                                                          child:
                                                                              Text(
                                                                            "Chats",
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                );
                                              })
                                        ],
                                      );
                                    })),
                          ),
                        ),
                      );
                    }),
                ValueListenableBuilder(
                  valueListenable: inboxContainer,
                  builder: (context, value, child) {
                    return Expanded(
                      child: Stack(
                        children: [
                          MyHomePage(),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Card(
                                    elevation: 10,
                                    child: AnimatedContainer(
                                      height: inboxContainer.value,
                                      width: Get.width / 2.5,
                                      color: Colors.white,
                                      duration: const Duration(milliseconds: 100),
                                      child: SingleChildScrollView(
                                        physics: const NeverScrollableScrollPhysics(),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: Get.height / 20,
                                              color: Colors.grey[200],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "New Message",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                _toggleinboxContainer();
                                                              },
                                                              child: const Icon(Icons
                                                                  .minimize)),
                                                          // Icon(Icons.fullscreen),
                                                          InkWell(
                                                              onTap: () {
                                                                _closeContainer();
                                                              },
                                                              child: const Icon(
                                                                  Icons.close))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    decoration: const InputDecoration(
                                                      hintText: "Recipent",
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    decoration: const InputDecoration(
                                                      hintText: "Subject",
                                                    ),
                                                  ),
                                                  SingleChildScrollView(
                                                    physics: const ScrollPhysics(),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height:
                                                              Get.height / 2.2,
                                                          child: TextFormField(
                                                            minLines: 10,
                                                            maxLines: 1000,
                                                            style: const TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                            decoration:
                                                                const InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText: "",
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                ),
                DrawerContainerLast(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
