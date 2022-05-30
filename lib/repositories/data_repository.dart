import 'package:clone_netflix/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/movies.dart';

class DataRepository with ChangeNotifier{
  ApiService apiService = ApiService();

  //private
  final List<Movie> _popularMovieList = [];
  int _popularMovieIndex = 1;


  //getter
  List <Movie> get popularMovieList => _popularMovieList;
  Future <void> getPopularMovies() async {
    try {
      List<Movie> movies =
        await apiService.getPopularMovies(pageNumber: _popularMovieIndex);
         _popularMovieList.addAll(movies);
         _popularMovieIndex++;
         notifyListeners();
    } on Response catch (response){
      print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  Future<Movie> getMovieDetails({required Movie movie}) async {
    try {
      //Recupere les infos Film
      Movie newMovie = await apiService.getMovieDetails(movie: movie);

      //Recupere les des videos
      newMovie = await apiService.getMovieVideos(movie: newMovie);
      return newMovie;
    } on Response catch (response) {
      print("Error: ${response.statusCode}");
      rethrow;
    }
  }


  Future<void> initData() async{
    await getPopularMovies();
    //await getnowPlaying();
  }


}