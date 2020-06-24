import 'package:dadjokesmobile/random_jokes_screen.dart';
import 'package:dadjokesmobile/slide_transition.dart';
import 'package:flutter/material.dart';

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