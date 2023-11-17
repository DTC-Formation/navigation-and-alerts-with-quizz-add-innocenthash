import 'package:flutter/material.dart';
import 'package:qcm/qcm.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qcm'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        height: 5000,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          children: [
            Image.asset(
                'assets/pngtree-businessman-making-planning-list-3d-character-illustration-png-image_13379245.png'),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(bottom: 100 , left: 20 , right:20 ),
                child: ElevatedButton(
                    style: ButtonStyle(
                      
                      backgroundColor:MaterialStatePropertyAll(Colors.blueAccent ) ,
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
                      
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Qcm()),
                      );
                    },
                    child: Text('Go')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
