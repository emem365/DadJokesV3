import 'package:dadjokesmobile/dad_jokes_service.dart';
import 'package:dadjokesmobile/random_jokes_screen.dart';
import 'package:dadjokesmobile/search_screen.dart';
import 'package:flutter/material.dart';

import 'slide_transition.dart';

class SearchJokeScreen extends StatefulWidget {
  final String term;
  SearchJokeScreen(this.term);
  @override
  _SearchJokeScreenState createState() => _SearchJokeScreenState();
}

class _SearchJokeScreenState extends State<SearchJokeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFFF1E5C0),
            Color(0xFFD9B855),
          ],
          end: Alignment.bottomRight,
          begin: Alignment.topLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: DadJokesService.getJokeByTopic(widget.term),
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
                        .apply(color: Colors.black),
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
                            color: Color(0xFF62BD96),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(SlideRoute(widget: RandomJokeScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text('Random Joke',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .apply(color: Colors.white70)),
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: RaisedButton(
                            color: Color(0xFF62BD96),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(SlideRoute(widget: SearchScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text('Try again?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .apply(color: Colors.white70)),
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
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
