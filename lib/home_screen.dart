import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ict_hub_flutter/app_assets.dart';
import 'package:ict_hub_flutter/custom_text_filed_widget.dart';
import 'package:ict_hub_flutter/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  final TextEditingController controller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );
  final formKey = GlobalKey<FormState>();

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
                      Container(
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(AppAssets.screenShot),
                      ),
                      // Image.asset(AppAssets.screenShot),
                      // Image.asset(AppAssets.screenShot),
                      // Image.asset(AppAssets.screenShot),
                      // Image.asset(AppAssets.screenShot),
                      Image.network(
                        height: 100,
                        width: 200,
                        "https://static.srpcdigital.com/styles/1037xauto/public/2026-07/1636566.jpeg.webp",
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            AppAssets.screenShot,
                            height: 50,
                            width: 50,
                          );
                        },
                      ),
                      CachedNetworkImage(
                        errorWidget: (context, url, error) {
                          return Image.asset(AppAssets.screenShot);
                        },
                        imageUrl:
                            "https://static.srpcdigital.com/styles/1037xauto/public/2026-07/1636566.jpeg.webp",
                      ),
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
                      Form(
                        key: formKey,
                        child: Column(
                          spacing: 16,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }

                                if (!passwordRegex.hasMatch(value)) {
                                  return 'Password must contain at least 8 characters, '
                                      'one uppercase, one lowercase, one number, '
                                      'and one special character';
                                }

                                return null;
                              },
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
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                }

                                // if (!passwordRegex.hasMatch(value)) {
                                //   return 'Password must contain at least 8 characters, '
                                //       'one uppercase, one lowercase, one number, '
                                //       'and one special character';
                                // }

                                return null;
                              },
                              controller: emailcontroller,
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
                            CustomTextFiledWidget(
                              controller: emailcontroller,
                              hintText: "enter mail ",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          context.pushNamed(Routes.imagePickerScreen);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ImagePickerScreen();
                          //     },
                          //   ),
                          // );
                        },
                        child: Icon(Icons.add),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 54,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              log("Hi from Filled Buttom ");
                            }
                          },
                          child: Text("Click on !!"),
                        ),
                      ),
                      MaterialButton(onPressed: () {}, child: Text("Press")),
                      TextButton(onPressed: () {}, child: Text("data")),
                      IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
                      Text(controller.text),
                      Text(
                        "Home Screen",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Home Screen "),
                      Text("Home Screen "),
                      SizedBox(height: 20),
                      Text("Home Screen "),

                      SizedBox(
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          spacing: 4,
                          children: [
                            Text("Row Widgwt"),
                            SizedBox(width: 20),
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
