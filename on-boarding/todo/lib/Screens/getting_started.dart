import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEE6F57),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("hey"),
          const Image(
            width: 390,
            height: 390,
            image: AssetImage('assets/images/stick-man-painting-on-canvas.png'),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: SizedBox(
              width: 256,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
