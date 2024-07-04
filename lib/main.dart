import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Slider Example'),
          backgroundColor: Colors.black,
        ),
        body: SliderDemo(),
      ),
    );
  }
}

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  int _sliderValue1 = 6;
  int _sliderValue2 = 7;
  int _sliderValue3 = 4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildComparisonSlider("Fasilitas", _sliderValue1, "Harga", (newValue) {
            setState(() {
              _sliderValue1 = newValue;
            });
          }),
          buildComparisonSlider("Tahun Berdiri", _sliderValue2, "Aksesibilitas", (newValue) {
            setState(() {
              _sliderValue2 = newValue;
            });
          }),
          buildComparisonSlider("Fasilitas", _sliderValue3, "Aksesibilitas", (newValue) {
            setState(() {
              _sliderValue3 = newValue;
            });
          }),
        ],
      ),
    );
  }

  Widget buildComparisonSlider(String label1, int value, String label2, ValueChanged<int> onChanged) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label1,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              value.toString(),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              ':',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              (10 - value).toString(),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              label2,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        Slider(
          value: value.toDouble(),
          min: 0,
          max: 10,
          divisions: 10,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          onChanged: (double newValue) {
            onChanged(newValue.toInt());
          },
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
