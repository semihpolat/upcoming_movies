class MoviesModel {
  String id;
  String title;
  String year;
  List<String> genres;
  List<int> ratings;
  String poster;
  String contentRating;
  String duration;
  String releaseDate;
  int averageRating;
  String originalTitle;
  String storyline;
  List<String> actors;
  var imdbRating;
  String posterurl;

  MoviesModel(
      {this.id,
      this.title,
      this.year,
      this.genres,
      this.ratings,
      this.poster,
      this.contentRating,
      this.duration,
      this.releaseDate,
      this.averageRating,
      this.originalTitle,
      this.storyline,
      this.actors,
      this.imdbRating,
      this.posterurl});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genres = json['genres'].cast<String>();
    ratings = json['ratings'].cast<int>();
    poster = json['poster'];
    contentRating = json['contentRating'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    averageRating = json['averageRating'];
    originalTitle = json['originalTitle'];
    storyline = json['storyline'];
    actors = json['actors'].cast<String>();
    imdbRating = json['imdbRating'];
    posterurl = json['posterurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['year'] = this.year;
    data['genres'] = this.genres;
    data['ratings'] = this.ratings;
    data['poster'] = this.poster;
    data['contentRating'] = this.contentRating;
    data['duration'] = this.duration;
    data['releaseDate'] = this.releaseDate;
    data['averageRating'] = this.averageRating;
    data['originalTitle'] = this.originalTitle;
    data['storyline'] = this.storyline;
    data['actors'] = this.actors;
    data['imdbRating'] = this.imdbRating;
    data['posterurl'] = this.posterurl;
    return data;
  }
}
