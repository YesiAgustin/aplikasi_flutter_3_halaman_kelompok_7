import 'package:flutter/material.dart';

// Konstanta untuk teks dan ukuran font
const double fontSizeLarge = 40.0;
const double fontSizeMedium = 18.0;
const double buttonSpacing = 10.0;

class HalamanCounter extends StatefulWidget {
  const HalamanCounter({super.key});

  @override
  _HalamanCounterState createState() => _HalamanCounterState();
}

class _HalamanCounterState extends State<HalamanCounter> {
  int _counter = 0;

  // Menambah jumlah counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Mengurangi jumlah counter
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLabelText('Jumlah angka sekarang:', fontSizeMedium),
          _buildCounterText(_counter),
          SizedBox(height: 20),
          _buildActionButtons(),
        ],
      ),
    );
  }

  // Widget untuk menampilkan label teks
  Widget _buildLabelText(String text, double fontSize) {
    return Text(text, style: TextStyle(fontSize: fontSize));
  }

  // Widget untuk menampilkan jumlah counter
  Widget _buildCounterText(int counter) {
    return Text(
      '$counter',
      style: TextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold),
    );
  }

  // Widget untuk menampilkan tombol aksi
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(Icons.remove, _decrementCounter),
        SizedBox(width: buttonSpacing),
        _buildButton(Icons.add, _incrementCounter),
      ],
    );
  }

  // Widget untuk membuat tombol aksi
  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(onPressed: onPressed, child: Icon(icon));
  }
}
