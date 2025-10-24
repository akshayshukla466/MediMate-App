import 'package:flutter/material.dart';

class MedicineDetailScreen extends StatefulWidget {
  @override
  State<MedicineDetailScreen> createState() => _MedicineDetailScreenState();
}

class _MedicineDetailScreenState extends State<MedicineDetailScreen> {
  bool addedToSchedule = false;
  @override
  Widget build(BuildContext context) {
    final med = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ??
        {
          'name': 'Paracetamol',
          'time': '11:00 AM',
          'desc': 'Pain relief / fever reducer',
          'image': 'assets/images/pill.png'
        };

    return Scaffold(
      appBar: AppBar(
        title: Text(med['name']),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Image.asset(med['image'], height: 160),
            SizedBox(height: 12),
            Text(med['name'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Time: ${med['time']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text(med['desc'], style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addedToSchedule ? null : () {
                setState(() {
                  addedToSchedule = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added to schedule (simulated)')),
                );
              },
              child: Text(addedToSchedule ? 'Added' : 'Add to Schedule'),
            ),
            SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}