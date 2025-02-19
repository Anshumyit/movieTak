import 'package:get/get.dart';
import 'package:movietask/api/apimovie.dart';
import 'package:movietask/data/modeldata.dart';


class MovieController extends GetxController {
  var isLoading = true.obs;
  var movieList = <Movie>[].obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var movies = await ApiService.fetchMovies();
      movieList.assignAll(movies);
    } finally {
      isLoading(false);
    }
  }
}
