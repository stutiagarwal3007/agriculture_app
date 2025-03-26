// import 'dart:convert';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/material.dart';
//
// class FarmerDashboard extends StatefulWidget {
//   @override
//   _FarmerDashboardState createState() => _FarmerDashboardState();
// }
//
// class _FarmerDashboardState extends State<FarmerDashboard> {
//   final _formKey = GlobalKey<FormState>();
//   String cropType = "";
//   String weight = "";
//   String price = "";
//   String harvestedDate = "";
//   String chemicalsUsed = "";
//
//   @override
//   void initState(){
//     super.initState();
//     _loadData();
//   }
//
//   Future<File> _getFile() async{
//     final directory = await getApplicationDocumentsDirectory();
//     print("JSON file path: ${directory.path}/farmer_data.json");
//     return File('${directory.path}/farmer_data.json');
//
//   }
//   Future<void> _saveData() async{
//     final file = await _getFile();
//     Map<String, String> data = {
//       "croptype" : cropType,
//       "weight" : weight,
//       "price" : price,
//       "harvestDate" : harvestedDate,
//       "chemicalsUsed" : chemicalsUsed,
//     };
//     await file.writeAsString(jsonEncode(data));
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text("data saved")),);
//   }
//   Future<void> _loadData() async{
//     try {
//       final file = await _getFile();
//       if(await file.exists()) {
//         String contents = await file.readAsString();
//         Map<String, dynamic> data = jsonDecode(contents);
//
//         setState((){
//           cropType = data["cropType"] ?? "";
//           weight = data["weight"] ?? "";
//           price = data["price"] ?? "";
//           harvestedDate = data["harvestedDate"] ?? "";
//           chemicalsUsed = data["chemicalsUsed"] ?? "";
//         });
//       }
//     } catch (e) {
//       print("errir loading data: $e");
//     }
//   }
//
//   void _submitDetails() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       _saveData();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Crop details submitted successfully!")),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[50],
//       appBar: AppBar(
//         title: Text("Farmer Dashboard"),
//         backgroundColor: Colors.green[700],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Enter Crop Details",
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 10),
//                   _buildTextField("Crop Type", Icons.grass, (value) => cropType = value),
//                   _buildTextField("Weight (kg)", Icons.scale, (value) => weight = value),
//                   _buildTextField("Price (per kg)", Icons.attach_money, (value) => price = value),
//                   _buildTextField("Harvested Date", Icons.date_range, (value) => harvestedDate = value),
//                   _buildTextField("Chemicals Used", Icons.science, (value) => chemicalsUsed = value),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green[700],
//                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: _submitDetails,
//                     child: Text("Submit Details", style: TextStyle(fontSize: 16)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, IconData icon, Function(String) onSaved) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: TextFormField(
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: Colors.green[700]),
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//         onSaved: (value) => onSaved(value!),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'dart:html' as html; // Import HTML storage for web
//
// class FarmerDashboard extends StatefulWidget {
//   @override
//   _FarmerDashboardState createState() => _FarmerDashboardState();
// }
//
// class _FarmerDashboardState extends State<FarmerDashboard> {
//   final _formKey = GlobalKey<FormState>();
//
//   late TextEditingController _cropTypeController;
//   late TextEditingController _weightController;
//   late TextEditingController _priceController;
//   late TextEditingController _harvestedDateController;
//   late TextEditingController _chemicalsUsedController;
//
//   @override
//   void initState() {
//     super.initState();
//     _cropTypeController = TextEditingController();
//     _weightController = TextEditingController();
//     _priceController = TextEditingController();
//     _harvestedDateController = TextEditingController();
//     _chemicalsUsedController = TextEditingController();
//     _loadData();
//   }
//
//   @override
//   void dispose() {
//     _cropTypeController.dispose();
//     _weightController.dispose();
//     _priceController.dispose();
//     _harvestedDateController.dispose();
//     _chemicalsUsedController.dispose();
//     super.dispose();
//   }
//
//   // ✅ Save data to `localStorage`
//   void _saveData() {
//     Map<String, String> data = {
//       "cropType": _cropTypeController.text,
//       "weight": _weightController.text,
//       "price": _priceController.text,
//       "harvestedDate": _harvestedDateController.text,
//       "chemicalsUsed": _chemicalsUsedController.text,
//     };
//
//     html.window.localStorage['farmerData'] = jsonEncode(data);
//     print("Data saved: $data");
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Data saved successfully!")),
//     );
//   }
//
//   // ✅ Load data from `localStorage`
//   void _loadData() {
//     String? storedData = html.window.localStorage['farmerData'];
//     if (storedData != null) {
//       Map<String, dynamic> data = jsonDecode(storedData);
//       print("Data loaded: $data");
//
//       setState(() {
//         _cropTypeController.text = data["cropType"] ?? "";
//         _weightController.text = data["weight"] ?? "";
//         _priceController.text = data["price"] ?? "";
//         _harvestedDateController.text = data["harvestedDate"] ?? "";
//         _chemicalsUsedController.text = data["chemicalsUsed"] ?? "";
//       });
//     }
//   }
//
//   void _submitDetails() {
//     if (_formKey.currentState!.validate()) {
//       _saveData();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[50],
//       appBar: AppBar(
//         title: Text("Farmer Dashboard"),
//         backgroundColor: Colors.green[700],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Enter Crop Details",
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 10),
//                   _buildTextField("Crop Type", Icons.grass, _cropTypeController),
//                   _buildTextField("Weight (kg)", Icons.scale, _weightController),
//                   _buildTextField("Price (per kg)", Icons.attach_money, _priceController),
//                   _buildTextField("Harvested Date", Icons.date_range, _harvestedDateController),
//                   _buildTextField("Chemicals Used", Icons.science, _chemicalsUsedController),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green[700],
//                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: _submitDetails,
//                     child: Text("Submit Details", style: TextStyle(fontSize: 16)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, IconData icon, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: Colors.green[700]),
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:html' as html; // Import HTML storage for web

class FarmerDashboard extends StatefulWidget {
  @override
  _FarmerDashboardState createState() => _FarmerDashboardState();
}

class _FarmerDashboardState extends State<FarmerDashboard> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _cropTypeController;
  late TextEditingController _weightController;
  late TextEditingController _priceController;
  late TextEditingController _harvestedDateController;
  late TextEditingController _chemicalsUsedController;
  late TextEditingController _farmSizeController;
  late TextEditingController _villageController;
  late TextEditingController _districtController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;

  @override
  void initState() {
    super.initState();
    _cropTypeController = TextEditingController();
    _weightController = TextEditingController();
    _priceController = TextEditingController();
    _harvestedDateController = TextEditingController();
    _chemicalsUsedController = TextEditingController();
    _farmSizeController = TextEditingController();
    _villageController = TextEditingController();
    _districtController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _loadData();
  }

  @override
  void dispose() {
    _cropTypeController.dispose();
    _weightController.dispose();
    _priceController.dispose();
    _harvestedDateController.dispose();
    _chemicalsUsedController.dispose();
    _farmSizeController.dispose();
    _villageController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  // ✅ Save data to `localStorage`
  void _saveData() {
    Map<String, String> data = {
      "cropType": _cropTypeController.text,
      "weight": _weightController.text,
      "price": _priceController.text,
      "harvestedDate": _harvestedDateController.text,
      "chemicalsUsed": _chemicalsUsedController.text,
      "farmSize": _farmSizeController.text,
      "village": _villageController.text,
      "district": _districtController.text,
      "city": _cityController.text,
      "state": _stateController.text,
    };

    html.window.localStorage['farmerData'] = jsonEncode(data);
    print("Data saved: $data");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Data saved successfully!")),
    );
  }

  // ✅ Load data from `localStorage`
  void _loadData() {
    String? storedData = html.window.localStorage['farmerData'];
    if (storedData != null) {
      Map<String, dynamic> data = jsonDecode(storedData);
      print("Data loaded: $data");

      setState(() {
        _cropTypeController.text = data["cropType"] ?? "";
        _weightController.text = data["weight"] ?? "";
        _priceController.text = data["price"] ?? "";
        _harvestedDateController.text = data["harvestedDate"] ?? "";
        _chemicalsUsedController.text = data["chemicalsUsed"] ?? "";
        _farmSizeController.text = data["farmSize"] ?? "";
        _villageController.text = data["village"] ?? "";
        _districtController.text = data["district"] ?? "";
        _cityController.text = data["city"] ?? "";
        _stateController.text = data["state"] ?? "";
      });
    }
  }

  void _submitDetails() {
    if (_formKey.currentState!.validate()) {
      _saveData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text("Farmer Dashboard"),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter Crop Details",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    _buildTextField("Crop Type", Icons.grass, _cropTypeController),
                    _buildTextField("Weight (kg)", Icons.scale, _weightController),
                    _buildTextField("Price (per kg)", Icons.attach_money, _priceController),
                    _buildTextField("Harvested Date", Icons.date_range, _harvestedDateController),
                    _buildTextField("Chemicals Used", Icons.science, _chemicalsUsedController),
                    _buildTextField("Farm Size (acres)", Icons.landscape, _farmSizeController),
                    _buildTextField("Village Name", Icons.home, _villageController),
                    _buildTextField("District", Icons.map, _districtController),
                    _buildTextField("City", Icons.location_city, _cityController),
                    _buildTextField("State", Icons.public, _stateController),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _submitDetails,
                      child: Text("Submit Details", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.green[700]),
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
