import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/movies.dart';
import '../../repositories/data_repository.dart';
import '../../shared/constants.dart';
import '../widgets/action_boutton.dart';
import '../widgets/movie_info.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie? newMovie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieData();
    
  }

  void getMovieData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    //Recupere les detail d'un movie
    Movie _movie = await dataProvider.getMovieDetails(movie: widget.movie);
    setState(() {
      newMovie = _movie;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksiBackgroundColor,
      appBar: AppBar(
        backgroundColor: ksiBackgroundColor,
        // leading: Image.asset('assets/images/netflix_logo_2.png'),
      ),
      body: newMovie == null
          ? Center(
        child: SpinKitFadingCircle(
          color: ksiPrimaryColor,
          size: 20,
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            MovieInfo(newMovie: newMovie!),
            const SizedBox(
              height: 10,
            ),
            ActionButton(
                label: "Lecture",
                icon: Icons.play_arrow,
                bgColor: Colors.white,
                color: ksiBackgroundColor),
            const SizedBox(
              height: 5,
            ),
            ActionButton(
                label: "Telecharcher la video",
                icon: Icons.download,
                bgColor: Colors.grey.withOpacity(0.3),
                color: Colors.white),
            const SizedBox(
              height: 20,
            ),
            Text(
              newMovie!.description,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                      width: 125,
                      margin: EdgeInsets.only(right: 5),
                      color: Colors.green,
                      child: Image.network(newMovie!.videos![index],
                        fit: BoxFit.cover,)
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

}
