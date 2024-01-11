import 'dart:math';
import 'package:flutter/material.dart';
import 'package:number_guess/result_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //let's create game variables
  var tfGuess = TextEditingController();
  int randomNumber = 0;
  int yourRightsLeft = 10;
  String gameHelp = "";

  //create a random number between 0 and 200
  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(201);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text("Game Page"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Your rights left: $yourRightsLeft",
              style: TextStyle(color: Colors.white, fontSize: 25)),
          Text(
            "Guess a number between 0 and 200",
            style: TextStyle(color: Colors.white),
          ),
          Text("Hint: $gameHelp",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tfGuess,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: "Guess",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    yourRightsLeft -= 1;
                  });

                  int guess = int.parse(tfGuess.text);

                  if (guess == randomNumber) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(result: true)));
                  }

                  if (guess > randomNumber) {
                    setState(() {
                      gameHelp = "Guess a smaller number";
                    });
                  }

                  if (guess < randomNumber) {
                    setState(() {
                      gameHelp = "Guess a bigger number";
                    });
                  }

                  if (yourRightsLeft == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(result: false)));
                  }

                  tfGuess.text = "";
                },
                child: Text("Guess")),
          ),
        ],
      )),
    );
  }
}
