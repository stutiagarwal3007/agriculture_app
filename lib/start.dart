import 'package:flutter/material.dart';
import 'button.dart';
import 'login.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/men.jpeg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  'Secured Contract Farming experience',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 28.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'For the Farmers and businessmen ',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),
                MyElevatedButton(
                  'Get Started',
                  action: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                ),
              ],
            ),
            Container(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}