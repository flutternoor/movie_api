import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/MoviesModel.dart';

class MovieDetailsScreens extends StatefulWidget {
  final MoviesModel moviesModel;

  const MovieDetailsScreens({Key? key, required this.moviesModel})
      : super(key: key);

  @override
  State<MovieDetailsScreens> createState() => _MovieDetailsScreensState();
}

class _MovieDetailsScreensState extends State<MovieDetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.moviesModel.title!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          widget.moviesModel.poster!,
                          height: 300,
                          width: 180,
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                      ),
                      const SizedBox(width: 8,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.moviesModel.title!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.moviesModel.year!,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.moviesModel.genre!),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.moviesModel.type!),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.moviesModel.language!),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.moviesModel.runtime!),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.moviesModel.country!),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              const Text(
                'Actors : ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.moviesModel.actors!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Writer : ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.moviesModel.writer!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Director : ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.moviesModel.director!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Box Office : ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.moviesModel.boxOffice!,
                ),
              ),
              const Text(
                'Awards: ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.moviesModel.awards!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'DVD : ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.moviesModel.dVD!,
                ),
              ),
              const Text(
                'Plot : ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.moviesModel.plot!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.blue,
              //     //backgroundBlendMode: BlendMode.darken,
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         Text(
              //           'Year: ${widget.moviesModel.year!}',
              //           textAlign: TextAlign.start,
              //         ),
              //         Text('Rated : ${widget.moviesModel.rated!}'),
              //         Text('Actors : ${widget.moviesModel.actors!}'),
              //         Text('Writer : ${widget.moviesModel.writer!}'),
              //         Text('Release Date : ${widget.moviesModel.released!}'),
              //         Text('Run Time : ${widget.moviesModel.runtime!}'),
              //         Text('Genre : ${widget.moviesModel.genre!}'),
              //         Text('Director Name : ${widget.moviesModel.director!}'),
              //         Text('Language : ${widget.moviesModel.language!}'),
              //         Text('Country : ${widget.moviesModel.country!}'),
              //         Text('Awards : ${widget.moviesModel.awards!}'),
              //         Text('Ratings : ${widget.moviesModel.ratings!}'),
              //         Text('Meta Score : ${widget.moviesModel.metascore!}'),
              //         Text('imdbRating : ${widget.moviesModel.imdbRating!}'),
              //         Text('imdbVotes : ${widget.moviesModel.imdbVotes!}'),
              //         Text('imdbID : ${widget.moviesModel.imdbID!}'),
              //         Text('type : ${widget.moviesModel.type!}'),
              //         Text('dVD : ${widget.moviesModel.dVD!}'),
              //         Text('boxOffice : ${widget.moviesModel.boxOffice!}'),
              //         //Text('production : ${widget.moviesModel.production!}'),
              //         //Text('website : ${widget.moviesModel.website!}'),
              //         //Text('response : ${widget.moviesModel.response!}'),
              //         Text('Plot : ${widget.moviesModel.plot!}'),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
