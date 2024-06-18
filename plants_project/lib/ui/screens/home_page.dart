import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:plants_project/models/plant.dart';
import 'package:plants_project/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    //Plants category
    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    bool Togglefavorite(bool isFavorated) {
      return !isFavorated;
    }

    TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(40)),
                    width: size.width * 0.9,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            size: 24,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'search Plant',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              controller: _controller,
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _plantTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                                print(currentIndex);
                              });
                            },
                            child: Text(
                              _plantTypes[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: currentIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: currentIndex == index
                                      ? Constants.primaryColor
                                      : Constants.blackColor),
                            ),
                          ));
                    })),
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 200,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                  icon: Icon(
                                      _plantList[index].isFavorated == true
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined),
                                  color: Constants.primaryColor,
                                  iconSize: 30,
                                  onPressed: () {},
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                          Positioned(
                              right: 50,
                              left: 50,
                              top: 50,
                              bottom: 50,
                              child: Image.asset(_plantList[index].imageURL)),
                          Positioned(
                              bottom: 5,
                              left: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_plantList[index].category,
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 15)),
                                  Text(_plantList[index].plantName,
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                          Positioned(
                              bottom: 15,
                              right: 20,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Text(
                                  r'$' + _plantList[index].price.toString(),
                                  style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontSize: 13),
                                ),
                              ))
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    );
                  }),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 26, bottom: 20, top: 20),
              child: const Text(
                'New Plants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: size.height * 0.5,
                child: ListView.builder(
                    itemCount: _plantList.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.primaryColor.withOpacity(0.08)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Constants.primaryColor),
                                ),
                                Positioned(
                                    left: 15,
                                    right: 0,
                                    bottom: 5,
                                    child: SizedBox(
                                        height: 70,
                                        child: Image.asset(
                                            _plantList[index].imageURL))),
                                Positioned(
                                    left: 100,
                                    bottom: 30,
                                    child: Text(_plantList[index].plantName,style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21
                                    ),)),
                                Positioned(
                                    left: 100,
                                    bottom: 10,
                                    child: Text(_plantList[index].category))
                              ],
                            )
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
