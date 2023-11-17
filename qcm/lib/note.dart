import 'package:flutter/material.dart';
import 'dart:async';

class Note extends StatefulWidget {
  final int score;
  final int page;
  final int i;
  // final Function function;
  const Note(
      {super.key, required this.score, required this.page, required this.i });
      // , required this.function

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  alert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: widget.score >= 5
                ? Text(
                    'Felicition à vous avec \r ${widget.score.toString()} / 10 ',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  )
                : Text(
                    'Vous avez echoué avec \r ${widget.score.toString()} / 10 ',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
            content:
                // Column(
                // children:
                // [
                widget.score >= 5
                    ? Image.asset(
                        'assets/ilustracao-de-inovacao-em-3d_541443-4078.jpg',
                        cacheHeight: 100,
                        cacheWidth: 100,
                      )
                    : Image.asset(
                        'assets/false.png',
                        cacheHeight: 100,
                        cacheWidth: 100,
                      ),
            // Text('${widget.score.toString()} / 10 '),
            // ],
            // ),
            actions: [
              // TextButton(onPressed: () {}, child: Text('ok')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      //  Navigator.pop(context);
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
                      // widget.page = 0;
                      // widget.i = 0;
                    });
                  },
                  child: Text('ok'))
            ],
          );
        });
  }

  @override
  void initState() {
    // au demarage de cette classe

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vos resultats')),
      body: Center(
        child: Container(
          child: OutlinedButton(
            onPressed: () {
              alert();
            },
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))),
            child: Text('Afficher mon resultat'),
          ),
        ),
      ),
    );
  }
}
