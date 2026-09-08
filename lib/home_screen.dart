import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
          log("Floatin gaction button ");
          log("counter is $counter");
        },
      ),
      appBar: AppBar(
        title: Text("Home Screen "),
        centerTitle: true,
        leading: Icon(Icons.car_repair, color: Colors.amber),
        actions: [
          Icon(Icons.ac_unit_sharp, color: Colors.amber),
          Icon(Icons.edit, color: Colors.red),
          IconButton(
            onPressed: () {
              log("On Cliked !!!!");
            },
            icon: Icon(Icons.accessibility_new_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "Enter Your Mail ",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Text(controller.text),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      SizedBox(height: 20),
                      Text("Home Screen "),

                      SizedBox(
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // spacing: 16,
                          children: [
                            Text("Row Widgwt"),
                            Text("Row Widgwt"),
                            Text("Row Widgwt"),

                            // Text("Row Widgwt"),
                          ],
                        ),
                      ),

                      Text("Counter $counter"),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      SizedBox(height: 20),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      SizedBox(height: 20),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      SizedBox(height: 20),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      SizedBox(height: 20),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      SizedBox(height: 20),
                      Text("Home Screen "),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                //  alignment: Alignment.center,
                // height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Hi Form Container "), Icon(Icons.abc)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
