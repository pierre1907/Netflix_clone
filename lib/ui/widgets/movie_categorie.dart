import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/movies.dart';
import 'movie_card.dart';

class MovieCategorie extends StatelessWidget {
  final String label;
  final List<Movie> movieList;
  final double imageHeight;
  final double imageWidth;
  const MovieCategorie(
      {Key? key,
        required this.movieList,
        required this.label,
        required this.imageHeight,
        required this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: imageHeight,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) => Container(
                width: imageWidth,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.yellow,
                child: movieList.isEmpty
                    ? Center(child: Text(index.toString()))
                    : MovieCard(movie: movieList[index]),
              ))),
        ),
      ],
    );
  }
}
