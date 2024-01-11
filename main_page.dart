import 'package:flutter/material.dart';
import 'package:number_guess/game_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text("Main Page"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Number Guess Game",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Image.asset("images/guess.png"),
          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Text("Let's start")),
          ),
        ],
      )),
    );
  }
}
