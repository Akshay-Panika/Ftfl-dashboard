import 'package:flutter/material.dart';
import 'dart:async';

import '../../../custom_widget/custom_container.dart';
import '../../../custom_widget/custom_textstyle.dart';

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  Timer? _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel(); // Stop the timer if the widget is disposed
        return;
      }

      final now = DateTime.now();
      setState(() {
        _currentTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 550,
      width: 400,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Dynamic Clock View
          Text(
            _currentTime,
            style: textStyle22(fontWeight: FontWeight.w600),
          ),
          Text('Current Time', style: textStyle14()),
        ],
      ),
    );
  }
}
