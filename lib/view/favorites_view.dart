import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:movies_project/logic/controller/movie_controller.dart';
import 'package:movies_project/view/widgets/post_card.dart';

class FavoritesView extends StatelessWidget {
  final MovieController xController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorites',
          ),
          centerTitle: true,
          backgroundColor: Color(0xff000000),
          elevation: 0,
        ),
        body: Obx(() {
          if (xController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else
            return SingleChildScrollView(
              child: Container(
                /*  height: 2000,
                width: 1000, */
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 210,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.7)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      for (var item in xController.favoriteX)
                        MovieCard(
                          title: item.title,
                          desc: item.storyline,
                          thumbnail: item.posterurl,
                          item: item,
                        ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            );
        }));
  }
}
