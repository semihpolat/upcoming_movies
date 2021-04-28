import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/logic/model/movies_model.dart';
import 'package:movies_project/view/movie_details.dart';

class MovieCard extends StatelessWidget {
  final MoviesModel item;
  final String title;
  final String desc;
  final String thumbnail;
  MovieCard({this.title, this.desc, this.thumbnail, this.item});
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      //height: 100,
      child: InkWell(
        onTap: () {
          Get.to(MovieDetails(
              item: item, imageCard: buildPostPicture(thumbnail, _width)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            buildPostPicture(thumbnail, _width),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Text(
                  title ?? 'movie',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    desc ?? 'desc',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Stack buildPostPicture(String urlPost, double _width) {
    return Stack(
      children: [
        Container(
          height: _width - 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlPost ?? ''),
              )),
        ),
      ],
    );
  }

  Row buildPostFirstRow(String urlProfilePhoto, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(urlProfilePhoto),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? 'noName',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            Get.dialog(AlertDialog(
                content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text(
                    'Geri',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFF01afbd),
                  onPressed: () => Get.back(result: true),
                  // ** result: returns this value up the call stack **
                ),
                SizedBox(
                  width: 5,
                ),
                RaisedButton(
                  //TODO: sikayet etme apisine bagla
                  child: Text(
                    //TODO: sikkayet et apisine bagla
                    'Şikayet Et',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                  onPressed: () => Get.back(result: false),
                ),
              ],
            )));
          },
        )
      ],
    );
  }
}
