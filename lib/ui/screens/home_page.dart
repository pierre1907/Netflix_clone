import 'package:clone_netflix/repositories/data_repository.dart';
import 'package:clone_netflix/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../shared/constants.dart';
import '../widgets/movie_categorie.dart';

class HomeScreen extends StatefulWidget {
  //Données externes
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Données internes
  //List<Movie>? movies= [];


  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);

    return Scaffold(
      backgroundColor: ksiBackgroundColor,
      appBar:  AppBar(
        backgroundColor: ksiBackgroundColor,
        leading:Image.asset("assets/images/Logo.png", ),
      ),
      body: ListView(
        children: [
          Container(
              height: 621,
              //color: ksiPrimaryColor,
              child: dataProvider.popularMovieList.isEmpty
                  ?const Center(child: Text("Indisponibilité du film"),
              ):
              MovieCard(movie: dataProvider.popularMovieList[0])
          ),

          const SizedBox(height: 15,),

          Text("Tendances actuelles",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15,),

          SizedBox(
            height: 180,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                    width: 125,
                    margin: EdgeInsets.only(right: 5),
                    color: Colors.green,
                    child: dataProvider.popularMovieList.isEmpty
                        ?const Center(child: Text("Indisponibilité du film"),):
                    Image.network(dataProvider.popularMovieList[index+1].posterUrl(),
                      fit: BoxFit.cover,)
                )
            ),
          ),


          const SizedBox(height: 15,),

          Text("Actuellement au cinéma",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15,),

          SizedBox(
            height: 375,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 250,
                  margin: EdgeInsets.only(right: 5),
                  color: Colors.green,
                  child: dataProvider.popularMovieList.isEmpty
                      ?const Center(child: Text("Indisponibilité du film"),):
                  Image.network(dataProvider.popularMovieList[index].posterUrl(),
                    fit: BoxFit.cover,)
                )
            ),
          ),

          const SizedBox(height: 15,),

          Text("Ils arrivent bientôt....",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15,),

          SizedBox(
            height: 180,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 125,
                  margin: EdgeInsets.only(right: 10),
                  color: Colors.blueAccent,
                  child: dataProvider.popularMovieList.isEmpty
                      ?const Center(child: Text("Indisponibilité du film"),):
                  Image.network(dataProvider.popularMovieList[index+10].posterUrl(),
                    fit: BoxFit.cover,)
                )
            ),
          ),

          const SizedBox(height: 15,),

          Text("Annimation",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15,),

          SizedBox(
            height: 180,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 125,
                  margin: EdgeInsets.only(right: 10),
                  color: Colors.yellowAccent,
                  child: dataProvider.popularMovieList.isEmpty
                      ?const Center(child: Text("Indisponibilité du film"),):
                  Image.network(dataProvider.popularMovieList[index+8].posterUrl(),
                    fit: BoxFit.cover,)
                )
            ),
          )
        ],
      ),
    );

  }
}
