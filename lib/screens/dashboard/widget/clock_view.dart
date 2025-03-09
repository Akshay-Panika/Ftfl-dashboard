import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/core/theme.dart';
import 'dart:async';

import '../../../app_widget/custom_container.dart';
import '../../../app_widget/custom_textstyle.dart';
import '../../../app_widget/dimands.dart';


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
    Demands demands = Demands(context);
    return customContainer(
       bRadius: demands.screenHeight*0.01,
       width: demands.screenWidth > 600 ? demands.screenWidth*0.25:double.infinity,
       hMargin: demands.screenWidth*0.01,
       vMargin: demands.screenWidth*0.01,
       vPadding: demands.screenWidth*0.05,
      borderColor: customColor.borderColor,
      shadowColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Dynamic Clock View
          Text(
            _currentTime,
            style: textStyle22(context,fontWeight: FontWeight.w600),
          ),
          Text('Current Time', style: textStyle14(context,)),
        ],
      ),
    );
  }
}
