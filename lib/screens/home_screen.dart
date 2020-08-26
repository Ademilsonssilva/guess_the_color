import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String, dynamic>> colors = [
    {
      'color': Colors.red,
      'name': 'vermelho'
    },
    {
      'color': Colors.blue,
      'name': 'azul'
    },
  ];

  Color _active_color = Colors.green;

  Timer _timer;
  int bazinga = 10;


  Map<String, dynamic> match = {
    'phrase': 'batatinha quando nasce esparrama pelo chão',
    'tip': 'Frase que toda criança conhece',
  };

  int gameStartCountDown = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adivinhe as cores"),
        centerTitle: true,
      ),
      body: gameStartCountDown == 0 ? SingleChildScrollView(
          child: Column(
              children: [
                Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: _active_color,
                          ),
                        ),
                      ),
                    )
                )
              ]
          )
      ) : Center(
        child: Text(
          gameStartCountDown.toString(),
          style: TextStyle(
              fontSize: 200,
              color: Colors.red
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          gameStartCountDown = 4;
          _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
            setState(() {
              if (gameStartCountDown < 1) {
                timer.cancel();
              }
              else {
//                bazinga = bazinga -1;
                gameStartCountDown = gameStartCountDown -1;
              }
            });
          });
//          setState(() {
//            gameStartCountDown = 3;
//          });
        },
        child: Icon(Icons.play_arrow, size: 50,),
      ),
    );
  }
}
