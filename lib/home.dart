import 'package:flutter/material.dart';
import 'package:moofy/widgets/footer.dart';
import 'package:moofy/models/movie.dart';
import 'package:moofy/services/model_service.dart';
import 'package:moofy/widgets/home_widgets/custom_carousel_slider.dart';
import 'package:moofy/widgets/skeletons/carousel_skeleton.dart';
import 'package:moofy/widgets/drawer.dart';
import 'package:moofy/widgets/navbar.dart';
import 'package:moofy/widgets/skeletons/now_playing_skeleton.dart';
import 'package:moofy/widgets/skeletons/popular_movie_skeleton.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  List<Movie> _topRatedMovies = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    _topRatedMovies = await ModelService().fetchtopRatedMovie();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: const CustomNavbar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Top Rated Movies",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 2,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: 
                          _isLoading 
                          ? const CarouselSkeleton() : 
                          CustomCarouselSlider(topRatedMovies: _topRatedMovies))),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              "Now Playing",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          NowPlayingSkeleton()
                        ]),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Explore Popular Movies",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: LayoutBuilder(builder: (context, contraints) {
                  double gridHeight = (contraints.maxWidth / 4) * 1.4 * 3;
                  return SizedBox(
                      height: gridHeight, child: const PopularMovieSkeleton());
                }),
              ),
              SizedBox(
                height: 8,
              ),
              Footer()
            ],
          ),
        ));
  }
}
