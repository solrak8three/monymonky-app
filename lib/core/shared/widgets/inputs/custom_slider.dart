import 'package:flutter/material.dart';

typedef OnSliderChange = void Function(double)?;

class CustomSlider extends StatefulWidget {

  final OnSliderChange onSliderChange;

  const CustomSlider({super.key, this.onSliderChange});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentValue = 0;

  _CustomSliderState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          value: _currentValue,
          min: 0,
          max: 1000,
          divisions: 1000,
          label: _currentValue.toString(),
          onChanged: (double value) {
            setState(() {
              _currentValue = value.toInt().toDouble();
            });
            widget.onSliderChange!(value);
          },
        ),
        Text('${_currentValue.truncate()}€', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ],
    );
  }
}
