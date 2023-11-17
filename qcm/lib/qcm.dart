import 'package:flutter/material.dart';
import 'package:qcm/listes_questions.dart';

class Qcm extends StatefulWidget {
  const Qcm({super.key});
  @override
  State<Qcm> createState() => _QcmState();
}

class _QcmState extends State<Qcm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QCM'),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: ListesQuestions(),
      backgroundColor: Colors.blue.shade100,
    );
  }
}
