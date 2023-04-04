import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/model/MoviesModel.dart';
import 'package:movie/screens/movie_details_screens.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  var movieName = TextEditingController();
  late StreamController _streamController;
  late Stream _stream;

  getAllMovies(String name) async {
    _streamController.add('loading');
    var url = 'https://www.omdbapi.com/?t=$name&plot=full&apiKey=94e188aa';
    // store api in url object
    var response = await http
        .get(Uri.parse(url)); // http get all url then save in response
    if (response.statusCode == 200) //200 mean that api works properly
        {
      var jsonData = json.decode(response.body);
      //print(jsonData);
      // debugPrint(jsonData);
      if (jsonData['Response'] == 'True') {
        //jason to dart data convert
        MoviesModel moviesModel = MoviesModel.fromJson(jsonData);//
        _streamController.add(moviesModel);
      } else {
        _streamController.add('Not Found');
      }
    } else {
      _streamController.add('went wrong');
    }
  }

  @override
  void initState() {
    _streamController = StreamController();
    _stream = _streamController.stream;
    _streamController.add('empty');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title:const Center(child:  Text('Movies App',style: TextStyle(color: Colors.black),)),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: movieName,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          ElevatedButton(

            onPressed: () {
              getAllMovies(movieName.text);
            },
            child: const Text('Search'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _stream,
              builder: (context, snapshort) {
                if (snapshort.hasData) {
                  if (snapshort.data == 'loading') {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshort.data == 'went wrong') {
                    return const Center(child: Text('Something went wrong'));
                  } else if (snapshort.data == 'not found') {
                    return const Text('Move is not found');
                  } else if (snapshort.data == 'empty') {
                    return const Text("Enter a Movie Name");
                  } else {
                    MoviesModel myModelData = snapshort.data as MoviesModel;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Title: ${myModelData.title!}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                          const Text(
                            'Poster:',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),

                          Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              myModelData.poster!,
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                                return MovieDetailsScreens( moviesModel: myModelData,);
                              }));
                              },
                            child: const Text("Movie Details"),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
