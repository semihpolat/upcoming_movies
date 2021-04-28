import 'package:get/state_manager.dart';
import 'package:movies_project/logic/model/movies_model.dart';
import 'package:movies_project/logic/services/api_service.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  Rx<List<MoviesModel>> xModel = Rx<List<MoviesModel>>();
  Rx<List<MoviesModel>> xFavorite = Rx<List<MoviesModel>>();
  List<MoviesModel> get dataX => xModel.value;
  List<MoviesModel> get favoriteX => xFavorite.value;
  @override
  void onInit() {
    fetchAPI();
    super.onInit();
  }

  void addFavorite(MoviesModel selectedMovie) async {
    print('xFavorite.value' + xFavorite.value.toString());
    if (xFavorite.value == null) {
      xFavorite.value = [selectedMovie];
      xFavorite.refresh();
    } else {
      xFavorite.value.add(selectedMovie);
      xFavorite.refresh();
      print(xFavorite.value.toString());
    }
  }

  void fetchAPI() async {
    try {
      isLoading(true);
      var xVars = await ApiServices.getPosts();
      if (xVars != null) {
        xModel.value = xVars;
      }
    } finally {
      isLoading(false);
    }
  }
}
