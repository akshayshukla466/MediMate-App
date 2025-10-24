import 'package:flutter/material.dart';

final demoMedicines = [
  {
    'name': 'Paracetamol',
    'time': '11:00 AM',
    'desc': 'Pain relief / fever reducer',
    'image': 'assets/images/pill.png'
  },
  {
    'name': 'Vitamin D',
    'time': '9:00 AM',
    'desc': 'Supplement, once daily',
    'image': 'assets/images/bottle.png'
  },
  {
    'name': 'Amoxicillin',
    'time': '2:00 PM',
    'desc': 'Antibiotic as prescribed',
    'image': 'assets/images/placeholder.png'
  },
  {
    'name': 'Iron Tablets',
    'time': '8:00 PM',
    'desc': 'Iron supplement',
    'image': 'assets/images/placeholder.png'
  },
];

class MedicineListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Medicines'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: demoMedicines.length,
        itemBuilder: (context, idx) {
          final med = demoMedicines[idx];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.asset(med['image']!, height: 56, width: 56),
              title: Text(med['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              subtitle: Text('${med['desc']} • ${med['time']}'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/details', arguments: med);
              },
            ),
          );
        },
      ),
    );
  }
}