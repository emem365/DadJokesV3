import 'package:dadjokesmobile/slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      ),
      home: SplashScreen(),
    );
  }
}

class RandomJokeScreen extends StatelessWidget {
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
                  onPressed: () {},
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
                  onPressed: () {},
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
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
