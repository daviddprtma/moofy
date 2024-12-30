import 'package:flutter/material.dart';
import 'package:moofy/models/movie.dart';
import 'package:moofy/services/model_service.dart';
import 'package:moofy/widgets/footer.dart';

class SearchPage extends StatefulWidget {
  final String query;
  const SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> movies = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    movies = await ModelService().searchMovie(widget.query);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result for ${widget.query}"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: movies.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, idx) {
                        final movie = movies[idx];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 6,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.network(
                                    'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        movie.title,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        movie.overview,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Text(
                                                  'Vote Count: ${movie.voteCount}',
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.trending_up,
                                                  color: Colors.orange,
                                                ),
                                                Text(
                                                  'Popularity: ${movie.popularity}',
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  color: Colors.green,
                                                ),
                                                Text(
                                                  'Release Date: ${movie.releaseDate}',
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  Footer()
                ],
              ),
            ),
    );
  }
}
