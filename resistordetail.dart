import 'package:flutter/material.dart';

class ResistorDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resistor")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/resistor_image.png'), // Add an image for the resistor
            SizedBox(height: 16),
            Text(
              "Resistor is a passive electrical component that implements electrical resistance as a circuit element.",
              style: TextStyle(fontSize: 18),
            ),
            // Add more content related to resistor, like datasheets or formulas
          ],
        ),
      ),
    );
  }
}
