import 'dart:io';
import 'package:flutter/material.dart';
import 'package:on_boarding/data/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tes",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SliderModel> mySlides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = new PageController();
    mySlides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: mySlides != null
            ? PageView.builder(
                controller: pageController,
                onPageChanged: (val) {
                  setState(() {
                    currentIndex = val;
                  });
                },
                itemCount: mySlides.length,
                itemBuilder: (context, i) {
                  return SliderTile(
                    assetImage: mySlides[i].getImagePath(),
                    title: mySlides[i].getTitle(),
                    description: mySlides[i].getDesc(),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        bottomSheet: currentIndex != mySlides.length - 1
            ? Container(
                height: Platform.isIOS ? 70.0 : 60.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pageController.animateToPage(
                          currentIndex = 3,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      child: Text("Skip"),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < mySlides.length; i++)
                          currentIndex == i
                              ? pageIndicator(true)
                              : pageIndicator(false),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.animateToPage(
                          currentIndex + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      child: Text("Next"),
                    ),
                  ],
                ),
              )
            : Container(
                height: Platform.isIOS ? 70.0 : 60.0,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                color: Colors.purple,
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}

Widget pageIndicator(bool isCurrentPage) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2.0),
    height: isCurrentPage ? 10.0 : 6.0,
    width: isCurrentPage ? 10.0 : 6.0,
    decoration: BoxDecoration(
      color: isCurrentPage ? Colors.grey : Colors.grey[300],
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}

class SliderTile extends StatelessWidget {
  String assetImage, title, description;
  SliderTile({this.assetImage, this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(assetImage)),
          SizedBox(height: 20.0),
          Text(
            title,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
