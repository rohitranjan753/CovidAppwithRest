import 'dart:async';
import 'dart:ui';

import 'package:covidappwithrest/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldStatesScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: const Center(
                        child: Image(
                          image: AssetImage('assets/virus.png'),
                        ),
                      ),
                    ),
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height*0.8,),
            const Align(
              alignment: Alignment.center,
              child: Text('Covid-19\nTracker App',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 25
              ),),
            )
          ],
        ),
      ),
    );
  }
}
