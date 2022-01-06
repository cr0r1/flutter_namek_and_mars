import 'package:flutter/material.dart';

class AnimationPlanet extends StatefulWidget {
  int i;
  int poids;
  AnimationPlanet({Key? key, required this.i, required this.poids})
      : super(key: key);

  @override
  _AnimationPlanetState createState() => _AnimationPlanetState();
}

class _AnimationPlanetState extends State<AnimationPlanet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Images(
          i: widget.i,
          x: MediaQuery.of(context).size.width.toDouble(),
          y: 250.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: poid(widget.poids),
        ),
      ],
    );
  }

  String calcul() {
    double poidsFinal;
    if (widget.i == 0) {
      poidsFinal = widget.poids.toDouble();
      return (poidsFinal.toString());
    } else if (widget.i == 1) {
      poidsFinal = (widget.poids * 3.711) / 9.81;
      return (poidsFinal.toStringAsFixed(0));
    } else if (widget.i == 2) {
      poidsFinal = (widget.poids * 0.62) / 9.81;
      return (poidsFinal.toStringAsFixed(0));
    } else {
      poidsFinal = (widget.poids * 8.87) / 9.81;
      return (poidsFinal.toStringAsFixed(0));
    }
  }

  String choices() {
    if (widget.i == 0) {
      return ("Terre");
    } else if (widget.i == 1) {
      return ("Mars");
    } else if (widget.i == 2) {
      return ("Pluton");
    } else {
      return ("Venus");
    }
  }

  Widget? poid(int poids) {
    if (!poids.isNegative && poids != 0) {
      return (Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.8),
        ),
        child: Center(
          child: Text(
            "Tu fais " + calcul() + "kg sur " + choices() + "!",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w800,
              // overflow: TextOverflow.ellipsis
            ),
          ),
        ),
      ));
    }
  }
}

class Images extends StatefulWidget {
  final int i;
  final double x;
  final double y;
  const Images({Key? key, required this.i, required this.x, required this.y})
      : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.y,
      width: widget.x,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(choice()), fit: BoxFit.contain)),
    );
  }

  String choice() {
    if (widget.i == 0) {
      return ("lib/images/earth.png");
    } else if (widget.i == 1) {
      return ("lib/images/mars.png");
    } else if (widget.i == 2) {
      return ("lib/images/pluto.png");
    } else {
      return ("lib/images/venus.png");
    }
  }
}
