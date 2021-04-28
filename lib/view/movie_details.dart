import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/logic/controller/movie_controller.dart';
import 'package:movies_project/logic/model/movies_model.dart';

class MovieDetails extends StatelessWidget {
  final MoviesModel item;
  final Stack imageCard;
  MovieDetails({this.item, this.imageCard});
  final MovieController xController = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: [
                  SizedBox(height: 40),
                  imageCard,
                  SizedBox(height: 20),
                  textItemBold(item.title),
                  SizedBox(height: 20),
                  textItem(item.storyline),
                  SizedBox(height: 20),
                  textItemBold('year : ' + item.year),
                  SizedBox(height: 60),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      xController.addFavorite(item);
                      Get.back();
                    },
                    child: Text(
                      'Add To The Favorite!',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  textItem(String item) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Expanded(
        child: Text(
          item ?? 'movie',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }

  textItemBold(String item) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Expanded(
        child: Text(
          item ?? 'movie',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
