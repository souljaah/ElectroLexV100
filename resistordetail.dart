import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    home: ResistorDetailPage(),
  ));
}

class ResistorDetailPage extends StatelessWidget {
  final List<String> resistorItems = [
    'Carbon Film Resistor',
    'Current Sense Resistors',
    'High Voltage Resistor',
    'LED Strip Resistors',
    'Metal Glaze Resistors',
    'Metal Oxide Resistors',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resistors")),
      body: ListView.builder(
        itemCount: resistorItems.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(resistorItems[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => _getResistorPage(resistorItems[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _getResistorPage(String name) {
    switch (name) {
      case 'Carbon Film Resistor':
        return IndividualResistorPage(
          title: name,
          description: 'Used in low current circuits.',
          imagePath: 'lib/assets/1.jpg',
        );
      case 'Current Sense Resistors':
        return IndividualResistorPage(
          title: name,
          description: 'Suitable for limiting small currents.',
          imagePath: 'assets/resistors/10ohm.png',
        );
      case 'High Voltage Resistor':
        return IndividualResistorPage(
          title: name,
          description: 'Commonly used for LEDs.',
          imagePath: 'assets/resistors/100ohm.png',
        );
      case 'LED Strip Resistors':
        return IndividualResistorPage(
          title: name,
          description: 'Standard value for pull-up resistors.',
          imagePath: 'assets/resistors/1kohm.png',
        );
      case 'Metal Glaze Resistors':
        return IndividualResistorPage(
          title: name,
          description: 'Often used in analog signal filtering.',
          imagePath: 'assets/resistors/10kohm.png',
        );
      case 'Metal Oxide Resistors':
        return IndividualResistorPage(
          title: name,
          description: 'Great for voltage divider applications.',
          imagePath: 'assets/resistors/100kohm.png',
        );
      default:
        return IndividualResistorPage(
          title: name,
          description: 'No description available.',
          imagePath: 'assets/resistors/default.png',
        );
    }
  }
}

class IndividualResistorPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const IndividualResistorPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
