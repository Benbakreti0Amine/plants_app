import 'package:flutter/material.dart';
import 'package:plants_project/constants.dart';
import 'package:plants_project/models/plant.dart';

class DetailPage extends StatefulWidget {
  final int plant_id;
  const DetailPage({super.key, required this.plant_id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    Plant selectedPlant =
        _plantList.firstWhere((plant) => plant.plantId == widget.plant_id);

    return Scaffold(
      body: Stack(
        children: [
          appbar(selectedPlant: selectedPlant),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(20),
              height: size.height * 0.8,
              width: size.width * 0.8,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: SizedBox(
                      height: 300,
                      child: Image.asset(selectedPlant.imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          attributes(title: "Size", feature: selectedPlant.size),
                          attributes(
                              title: "Humidity",
                              feature: selectedPlant.humidity.toString()),
                          attributes(
                              title: "Temperature",
                              feature: selectedPlant.temperature),
                        ],
                      ),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
          Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                      height: size.height * .5,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.4),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedPlant.plantName,
                                    style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    r'$' + selectedPlant.price.toString(),
                                    style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    selectedPlant.rating.toString(),
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Constants.primaryColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 30.0,
                                    color: Constants.primaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      selectedPlant.decription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18,
                        color: Constants.blackColor.withOpacity(0.7),
                      ),)
                    ),
                        ],
                      ),
                    ),
                  ),       
        ],
      ),
    );
  }
}

class attributes extends StatelessWidget {
  final String title;
  final String feature;
  const attributes({
    super.key,
    required this.title,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        Text(
          feature,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
      ],
    );
  }
}

class appbar extends StatelessWidget {
  const appbar({
    super.key,
    required this.selectedPlant,
  });

  final Plant selectedPlant;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 29,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Constants.blackColor.withOpacity(0.4),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle favorite button tap
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  selectedPlant.isFavorated
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: Constants.blackColor.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
