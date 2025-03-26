import 'package:flutter/material.dart';

class MiddlemanDashboard extends StatelessWidget {
  final List<String> tenders = ["Tender 1", "Tender 2", "Tender 3"];

  void _claimTender(String tender) {
    print("Claiming tender: $tender (Private Address Required)");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text("Middleman Dashboard"),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tenders.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.assignment, color: Colors.green[700]),
              title: Text(tenders[index], style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
                onPressed: () => _claimTender(tenders[index]),
                child: Text("Claim"),
              ),
            ),
          );
        },
      ),
    );
  }
}
