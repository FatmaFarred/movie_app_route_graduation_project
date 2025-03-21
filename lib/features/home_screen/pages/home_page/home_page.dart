import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import '../../../../core/customized widgets/reusable widgets/customized_card_item.dart';
import '../../../../core/resources/style manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
              children:[
                Image.asset(
                  getFilmImage(_selectedIndex),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: Column(
                    children: [
                      Image.asset(ImageAssets.availableNowImage),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 400,
                          viewportFraction: 0.6,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                        items: List.generate(50, (index) {
                          return Builder(
                            builder: (BuildContext context) {
                              return FilmCardItem(index: index,);
                            },
                          );
                        }).toList(),
                      ),
                      Image.asset(ImageAssets.watchNowImage),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Action" , style: getRegularStyle(fontSize: 18, color: AppColors.whiteColor),),
                            Text("See More" , style: getRegularStyle(fontSize: 18, color: AppColors.orangeColor),),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 150,
                                height: 200,
                                child: FilmCardItem(
                                  index: index
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),]
          ),
        ),
      ),
    );
  }
}