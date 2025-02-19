import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movietask/viewcontroller/moviecontroller.dart';

class MoviePage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie List")),
      body: Obx(() {
        if (movieController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          itemCount: movieController.movieList.length,
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey, // Separator line color
            thickness:0.1, // Thickness of the divider
            height: 0, // Space between items
          ),
          itemBuilder: (context, index) {
            var movie = movieController.movieList[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: Image.network(
                movie.imageUrl,
                width: 60,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.star,
                    color: Colors.green,
                    size: 16,
                  ),
                ],
              ),
              tileColor: const Color(0xFF1D1C3B),
            );
          },
        );
      }),
    );
  }
}
