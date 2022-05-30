import 'package:clone_netflix/repositories/data_repository.dart';
import 'package:clone_netflix/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import './home_page.dart';
import 'login.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    initData();
  }

  Future<void> initData() async{
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    await dataProvider.initData();
    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return Login();
    })));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ksiBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/netflix_2.png"),
          const SpinKitRing(
            color: ksiPrimaryColor,
            size: 50,
            duration: Duration(seconds: 15),
          )
        ],

      ),
    );
  }
}
