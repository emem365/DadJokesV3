import 'package:dadjokesmobile/slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.alluraTextTheme(Theme.of(context).textTheme),
        accentColor: Color(0xFFF15839),
      ),
      home: SplashScreen(),
    );
  }
}

class RandomJokeScreen extends StatefulWidget {
  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  final String joke =
      'Did you hear about the guy whose whole left side was cut off? He\'s all right now.';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF80CAAA),
            Color(0xFF62BD96),
          ],
          end: Alignment.bottomRight,
          begin: Alignment.topLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: DadJokesService.getRandomJoke(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Spacer(),
                  Text(
                    '\"${snapshot.data}\"',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(color: Colors.white),
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 40),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Color(0xFFF15839),
                            onPressed: () {
                              setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text('Random Joke',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .apply(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: RaisedButton(
                            color: Color(0xFFF15839),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text('Search',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .apply(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ChooseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFFF5A665),
            Color(0xFFE16D0F),
          ],
          end: Alignment.bottomRight,
          begin: Alignment.topLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: RaisedButton(
                  color: Color(0xFFF1E5C0),
                  textColor: Color.fromARGB(255, 103, 103, 103),
                  onPressed: () {
                    Navigator.of(context).push(SlideRoute(widget: RandomJokeScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text('Random Joke',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: RaisedButton(
                  color: Color(0xFFF1E5C0),
                  textColor: Color.fromARGB(255, 103, 103, 103),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text('Search',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animateIn = false;

  Future<void> loadNewScreen() {
    return Future.delayed(Duration(seconds: 4)).then(
      (value) => Navigator.pushReplacement(
        context,
        SlideRoute(
          widget: ChooseScreen(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadNewScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFFB9260D),
            Color(0xFFF58774),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: TweenAnimationBuilder(
            tween: animateIn
                ? Tween<double>(begin: 0, end: 10)
                : Tween<double>(begin: 10, end: 0),
            duration: Duration(milliseconds: 700),
            curve: Curves.easeIn,
            onEnd: () {
              setState(() => animateIn = !animateIn);
            },
            builder: (_, double blurVal, __) => Text(
              'Dad Jokes 3.0',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .apply(
                    color: Colors.white,
                    fontSizeFactor: 0.75,
                  )
                  .copyWith(
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: blurVal,
                    offset: Offset.zero,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DadJokesService {
  static String url = "https://icanhazdadjoke.com/";
  static Future<String> getRandomJoke() async {
    var response = await http.get(url, headers: {'Accept': 'text/plain'});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error with status code : ${response.statusCode}";
    }
  }

  static Future<String> getJokeByTopic(String topic) async {
    String searchURL='$url/search?term=$topic&limit=30';
    var response = await http.get(searchURL, headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return (jsonResponse['results']..shuffle()).first['joke'];
    } else {
      return "Error with status code : ${response.statusCode}";
    }
  }
}
