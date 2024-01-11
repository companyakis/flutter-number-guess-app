import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  bool result;
  ResultPage({required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Page"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.result
              ? Image.asset("images/win.png")
              : Image.asset("images/lost.png"),
          Text(widget.result ? "You won" : "You Lost",
              style: const TextStyle(color: Colors.white, fontSize: 30)),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Try again")),
          )
        ],
      )),
    );
  }
}
