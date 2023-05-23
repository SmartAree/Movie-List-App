import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:watch_hour/model/movie_model.dart';

class MovieTile extends StatelessWidget {
  const MovieTile(this.height, this.movieModel, this.width, {super.key});
  final double height;
  final double width;
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _moviePoster(movieModel.posterURL()),
        _movieInfo(),
      ],
    ));
  }

  Widget _moviePoster(String imgURL) {
    return Container(
      height: height,
      width: width * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imgURL),
        ),
      ),
    );
  }

  Widget _movieInfo() {
    return SizedBox(
      height: height,
      width: width * 0.66,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: width * 0.56,
                child: Text(
                  movieModel.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                movieModel.rating.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
            child: Text(
              '${movieModel.language.toUpperCase()} | R: ${movieModel.isAdult} | ${movieModel.releaseDate}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * 0.07, 0, 0),
            child: Text(
              movieModel.description,
              maxLines: 9,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
