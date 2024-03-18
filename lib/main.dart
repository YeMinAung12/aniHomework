import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  double radius = 0, top = 288;
  Color color1 = Colors.blueAccent, color2 = Colors.lightGreenAccent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: InkWell(
          onTap: () {
            if (radius == 0 && top == 186) {
              radius = 50;

              color1 = Colors.lightBlueAccent;
            } else {
              radius = 0;
              color1 = Colors.blueAccent;
            }

            setState(() {});
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
              color: color1,
            ),
          ),
        )),
        AnimatedPositioned(
          duration: Duration(seconds: 1),
          top: top,
          left: 80,
          child: InkWell(
            onTap: () {
              if (radius == 0 && top == 186) {
                top = 288;
              } else {
                top = 186;
              }
              setState(() {});
            },
            child: Container(
              color: Colors.greenAccent,
              height: 100,
              width: 200,
            ),
          ),
        )
      ],
    );
  }
}
