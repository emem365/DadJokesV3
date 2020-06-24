import 'package:dadjokesmobile/choose_screen.dart';
import 'package:dadjokesmobile/slide_transition.dart';
import 'package:flutter/material.dart';

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