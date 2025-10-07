import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
       
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF001F5B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  const Text(
                    'BitDogLab',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.wifi,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A5C8A),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildButton('A', Colors.red),
                        _buildButton('B', Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildButton('C', Colors.green),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  // >>> A FUNÇÃO <<<
  //
  Widget _buildButton(String label, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
