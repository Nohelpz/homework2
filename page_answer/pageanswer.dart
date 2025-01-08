import 'package:flutter/material.dart';
import 'answer1.dart';
import 'answer2.dart';
import 'answer3.dart';
import 'answer4.dart';

void main() {
  runApp(
    const MaterialApp(
      home: AnswerPortal(),
    ),
  );
}

class AnswerPortal extends StatelessWidget {
  const AnswerPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Answer"),
        backgroundColor: const Color.fromARGB(255, 79, 255, 234),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 220, 240, 255),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Answer1()),
                  );
                },
                child: const Text("Answer1"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Answer2()),
                  );
                },
                child: const Text("Answer2"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Answer3()),
                  );
                },
                child: const Text("Answer3"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Answer4()),
                  );
                },
                child: const Text("Answer4"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
