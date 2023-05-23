import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_hour/model/movie_model.dart';

import '../Widgets/movie_tile.dart';
import '../model/dropdown_category.dart';

class HomeScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundWidget(deviceHeight, deviceWidth),
            _foregroundWidget(deviceHeight, deviceWidth),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget(
    double height,
    double width,
  ) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
              'https://pics.filmaffinity.com/Evil_Dead_Rise-438707144-large.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  Widget _foregroundWidget(
    double height,
    double width,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        0,
        height * 0.06,
        0,
        0,
      ),
      // color: Colors.yellow,
      width: width * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(height, width),
          Container(
            height: height * 0.83,
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
            ),
            child: _moviesListViewWidget(height, width),
          ),
        ],
      ),
    );
  }

  Widget _topBarWidget(
    double height,
    double width,
  ) {
    return Container(
      height: height * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _searchFieldWidget(height, width),
            _dropDownSelectionWidegt(height, height),
          ]),
    );
  }

  Widget _searchFieldWidget(
    double height,
    double width,
  ) {
    const border = InputBorder.none;
    return SizedBox(
      width: width * 0.50,
      height: height * 0.05,
      child: TextField(
        controller: _controller,
        onSubmitted: (input) {},
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          focusedBorder: border,
          border: border,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white24,
          ),
          hintStyle: TextStyle(
            color: Colors.white24,
          ),
          filled: false,
          fillColor: Colors.white24,
          hintText: 'Search movies...',
        ),
      ),
    );
  }

  Widget _dropDownSelectionWidegt(
    double height,
    double width,
  ) {
    return DropdownButton(
      dropdownColor: Colors.black54,
      value: DropDownCategory.popular,
      icon: const Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      onChanged: (value) {},
      items: const [
        DropdownMenuItem(
          value: DropDownCategory.popular,
          child: Text(
            DropDownCategory.popular,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DropdownMenuItem(
          value: DropDownCategory.upomming,
          child: Text(
            DropDownCategory.upomming,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DropdownMenuItem(
          value: DropDownCategory.latest,
          child: Text(
            DropDownCategory.latest,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DropdownMenuItem(
          value: DropDownCategory.none,
          child: Text(
            DropDownCategory.none,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

//************************************************* */

  Widget _moviesListViewWidget(double height, double width) {
    final List<MovieModel> movies = [];
    for (var i = 0; i < 20; i++) {
      movies.add(
        MovieModel(
          name: "The Super Mario Bros. Movie",
          language: "en",
          isAdult: false,
          description:
              "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
          posterPath: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
          backDropPath: "/nLBRD7UPR6GjmWQp6ASAfCTaWKX.jpg",
          rating: 7.7,
          releaseDate: "2023-04-05",
        ),
      );
    }

    if (movies.isNotEmpty) {
      return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, int count) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: GestureDetector(
              onTap: () {},
              child: MovieTile(
                height * 0.20,
                movies[count],
                width * 0.85,
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
