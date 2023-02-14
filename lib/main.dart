import 'package:flutter/material.dart';

void main() => runApp(const Game());

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Punto di Partenza della Sfera con Coordinate (0, 0)
  double _x = 0;
  double _y = 0;

  // Funzione che Rimuove 30 Pixel dall'Asse X (Orizzontale)
  // Spostamento verso Sinistra
  void _moveLeft() {
    setState(() {
      _x -= 30;
    });
  }

  // Funzione che Aggiunge 30 Pixel all'Asse X (Orizzontale)
  // Spostamento verso Destra
  void _moveRight() {
    setState(() {
      _x += 30;
    });
  }

  // Funzione che Rimuove 30 Pixel dall'Asse Y (Verticale)
  // Spostamento verso l'Alto
  void _moveUp() {
    setState(() {
      _y -= 30;
    });
  }

  // Funzione che Aggiunge 30 Pixel all'Asse Y (Verticale)
  // Spostamento verso il Basso
  void _moveDown() {
    setState(() {
      _y += 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Game Controller'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          // Posizione di Partenza in Alto a Sinistra
          // Left = 0, Top = 0
          Positioned(
            left: _x,
            top: _y,
            // Struttura e Colore della Sfera
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
                border: Border.all(
                  color: Colors.black,
                  width: 4,
                ),
              ),
            ),
          ),
          // Container Blu in basso, contenente i vari GestureDetector
          // Utilizzati per spostare la Sfera al Click
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.blueAccent,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _moveUp,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.yellow,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: const Icon(Icons.arrow_upward),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: _moveLeft,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.greenAccent,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      GestureDetector(
                        onTap: _moveRight,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.greenAccent,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _moveDown,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.yellow,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: const Icon(Icons.arrow_downward),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
