import 'package:flutter/material.dart';
import 'animation.dart';
import 'row.dart';

class Planet extends StatefulWidget {
  const Planet({Key? key}) : super(key: key);

  @override
  _PlanetState createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {
  int i = 0;
  int poids = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/back.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black87, BlendMode.color))),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimationPlanet(
                  i: i,
                  poids: poids,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Ui(
                i: i,
                notifyParent: refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void refresh(int child, int schild) {
    setState(() {
      i = child;
      poids = schild;
    });
  }
}
