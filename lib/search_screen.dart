import 'package:dadjokesmobile/search_joke_screen.dart';
import 'package:dadjokesmobile/slide_transition.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  final TextEditingController controller = TextEditingController();
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
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: controller,
                  style: TextStyle(fontSize: 20),
                  cursorColor: Color(0xFF62BD96),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                    focusColor: Color(0xFF62BD96),
                    hoverColor: Color(0xFF62BD96),
                    fillColor: Color(0xFF62BD96),
                    labelText: 'Search key-word',
                    hintText: 'Use common words like rain, dog, etc.',
                    // focusColor: Color(0xFF62BD96),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Color(0xFF62BD96)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: RaisedButton(
                  color: Color(0xFF62BD96),
                  textColor: Color.fromARGB(255, 103, 103, 103),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(SlideRoute(widget: SearchJokeScreen(controller.text)));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Search',
                      style: Theme.of(context).textTheme.headline4.apply(
                            color: Colors.white70,
                          ),
                    ),
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
