import 'package:flutter/material.dart';
import 'package:demo/PostRequirementPade.dart';
import 'package:demo/ChooseMiddlemanPage.dart';


void main() {
  runApp(MaterialApp(
    home : BusinessmanDashboard(),
  ));
}

class BusinessmanDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Businessman Dashboard"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Welcome Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.business, color: Colors.green, size: 40),
                title: Text(
                  "Welcome, Businessman!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Post crop requirements and choose middlemen"),
              ),
            ),
            SizedBox(height: 20),

            // Features Section (Grid View)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildFeatureTile(
                    icon: Icons.shopping_cart,
                    title: "Post Requirement",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostRequirementPage(),
                        ),
                      );
                    },
                  ),
                  _buildFeatureTile(
                    icon: Icons.search,
                    title: "View Crop Proposals",
                    onTap: () {},
                  ),
                  _buildFeatureTile(
                    icon: Icons.handshake,
                    title: "Choose Middleman",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseMiddlemanPage(),),);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
