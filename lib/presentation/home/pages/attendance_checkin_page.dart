import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AttendanceCheckinPage extends StatefulWidget {
  const AttendanceCheckinPage({super.key});

  @override
  State<AttendanceCheckinPage> createState() => _AttendanceCheckinPageState();
}

class _AttendanceCheckinPageState extends State<AttendanceCheckinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Checkin'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Checkin',
          ),
        ),
      ),
    );
  }
}
