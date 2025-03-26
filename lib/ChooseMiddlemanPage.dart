import 'package:flutter/material.dart';

class ChooseMiddlemanPage extends StatelessWidget {
  final List<String> middlemen = [
    "Middleman A",
    "Middleman B",
    "Middleman C",
    "Middleman D"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Middleman"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: middlemen.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.green),
              title: Text(middlemen[index]),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${middlemen[index]} Selected!")),
                  );
                  Navigator.pop(context);
                },
                child: Text("Select"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),
          );
        },
      ),
    );
  }
}
