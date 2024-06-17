import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:plants_project/constants.dart';
import 'package:plants_project/root_page.dart';
import 'package:plants_project/ui/login.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController on_board_page_controller =
      PageController(initialPage: 0);
  int current_index = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 8,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (var i = 0; i < 3; i++) {
      if (i == current_index) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: InkWell(
              onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const RootPage()));
              },
              child: Text(
                "Skip",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                current_index = page;
              });
            },
            controller: on_board_page_controller,
            children: [
              Create_page(
                  image: 'assets/images/plant-one.png',
                  title: Constants.titleOne,
                  description: Constants.descriptionOne),
              Create_page(
                  image: 'assets/images/plant-two.png',
                  title: Constants.titleTwo,
                  description: Constants.descriptionTwo),
              Create_page(
                  image: 'assets/images/plant-three.png',
                  title: Constants.titleThree,
                  description: Constants.descriptionThree),
            ],
          ),
          Positioned(
              bottom: 80,
              left: 20,
              child: Row(
                children: _buildIndicator(),
              )),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (current_index < 2) {
                      current_index++;
                      if (current_index < 3) {
                        on_board_page_controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    }
                    else{
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const RootPage()));
                  }});
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Create_page extends StatelessWidget {
  final image;
  final title;
  final description;
  const Create_page({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 80, left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Image.asset(image),
          ),
          const SizedBox(height: 30),
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Constants.blackColor)),
          const SizedBox(height: 15),
          Text(description,
              style: TextStyle(
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
