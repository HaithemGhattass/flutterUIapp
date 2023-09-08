import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late TabController _tabController;
  late int _currentIndex;
  late double _circlePosition;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _currentIndex = 0;
    _circlePosition = 0.0;

    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    setState(() {
      _currentIndex = _tabController.index;
      _circlePosition = _currentIndex == 0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Container(
        // Wrap the body with a Container for the gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green,
              Color(0xFF0A1B3D),
              Color(0xFF0A1B3D),
              Color(0xFF0A1B3D),
              Color(0xFF0A1B3D),
              Color(0xFF0A1B3D),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/image.png'),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      size: 36,
                    ),
                  ],
                ),
              ),
              Container(
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: "Spirulina",
                    ),
                    Tab(
                      text: "Eco-impact",
                    )
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 500,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SizedBox(
                      child: Container(
                        height: 500,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 36.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment(1, 0.8),
                                        colors: <Color>[
                                          Color.fromARGB(252, 103, 213, 114),
                                          Color.fromARGB(255, 27, 109, 35),
                                        ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 8.0),
                                          child: Text(
                                            "Available",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "100%",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.auto_graph,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GlassmorphicContainer(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 120,
                                    borderRadius: 20,
                                    blur: 20,
                                    alignment: Alignment.bottomCenter,
                                    border: 2,
                                    linearGradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF555555).withOpacity(0.4),
                                          Color(0xFF555555).withOpacity(0.05),
                                        ],
                                        stops: [
                                          0.1,
                                          1,
                                        ]),
                                    borderGradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF555555).withOpacity(0.5),
                                        Color((0xFF555555)).withOpacity(0.5),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 8.0),
                                          child: Text(
                                            "Doses",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "12",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.watch_sharp,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ActionSlider.standard(
                                child: const Text(
                                  'Harvest now          >>',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.transparent,
                                toggleColor: Colors.green,
                                action: (controller) async {
                                  controller
                                      .loading(); //starts loading animation
                                  await Future.delayed(
                                      const Duration(seconds: 3));
                                  controller
                                      .success(); //starts success animation
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  controller.reset(); //resets the slider
                                },
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "harvest schedules",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  "asset/noScheduale.png",
                                  height: 170,
                                  width: 170,
                                ),
                              )
                            ],
                          ),
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                    Text(
                      "two",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
