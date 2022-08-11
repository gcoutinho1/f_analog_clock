import 'package:f_analog_clock/clock/analogic_circle.dart';
import 'package:f_analog_clock/clock/hour_pointer.dart';
import 'package:f_analog_clock/clock/minute_pointer.dart';
import 'package:f_analog_clock/clock/second_pointer.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.green,
      height: height,
      alignment: Alignment.bottomCenter,

      // width: width,
      child: StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Relógio Analógico",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 50),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnalogicCircle(),
                    HourPointer(),
                    MinutePointer(),
                    SecondPointer(),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
