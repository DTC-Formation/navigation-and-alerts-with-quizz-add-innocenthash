import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qcm/donnees.dart';
import 'package:qcm/note.dart';

class ListesQuestions extends StatefulWidget {
  const ListesQuestions({super.key});

  @override
  State<ListesQuestions> createState() => _ListesQuestionsState();
}

class _ListesQuestionsState extends State<ListesQuestions> {
  List<Map<String, dynamic>> listesDesDonnees = Donnees.mesDonnees;
  List<String> Alphabet = ['A','B','C'];
  int i = 0;
  Color check = Colors.green;
  Color checkBlack = Colors.black;

  bool isShow = true;

  int score = 10;
  int page = 0;

  int second = 10;
  // on va afficher la seconde pour les resultats attendu

  alert(int i, int index) {
    // satria efa misy build donc on  retourne pas un widget mais plutot un buildcontext
    return listesDesDonnees[i]['reponse'][index]['isCheck'] == true
        ? listesDesDonnees[i]['reponse'][index]['isTrue'] == true
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Question n° $i'),
                    content: Image.asset(
                      'assets/3d-rendering-of-checkmark-icon-true-choice-png.png',
                      cacheHeight: 100,
                      cacheWidth: 100,
                    ),
                    actions: [
                      // TextButton(onPressed: () {}, child: Text('ok')),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text('ok'))
                    ],
                  );
                })
            : ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('votre reponse n\'est pas correcte'),
                  duration: Duration(seconds: 2),
                  showCloseIcon: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color.fromARGB(255, 255, 39, 39),
                  behavior: SnackBarBehavior.floating,
                ),
              )
        : Text('data');
  }

  // seconds() {
  //   Timer.periodic(Duration(seconds: 10),() {
  //     setState(() {
  //       second = second + 1;
  //     });
  //   });
  // }
  Timer? _timer;
  seconds() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (!mounted) {
        // Vérifiez si le widget est toujours dans l'arborescence avant d'appeler setState
        return;
      }
      setState(() {
        page == 10 ? second = second - 1 : '';
      });
    });
  }
  // decrementScore(int i, int index) {
  //   // satria efa misy build donc on  retourne pas un widget mais plutot un buildcontext
  //   return listesDesDonnees[i]['reponse'][index]['isCheck'] == true
  //       ? listesDesDonnees[i]['reponse'][index]['isTrue'] == true
  //           ? showDialog(
  //               context: context,
  //               builder: (BuildContext context) {
  //                 return AlertDialog(
  //                   title: Text('Question n° $i'),
  //                   content: Image.asset(
  //                     'assets/3d-rendering-of-checkmark-icon-true-choice-png.png',
  //                     cacheHeight: 100,
  //                     cacheWidth: 100,
  //                   ),

  //                   actions: [
  //                     // TextButton(onPressed: () {}, child: Text('ok')),
  //                     TextButton(
  //                         onPressed: () {
  //                           setState(() {
  //                             Navigator.pop(context);
  //                           });
  //                         },
  //                         child: Text('ok'))
  //                   ],

  //                 );
  //               })
  //           : ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(
  //                 content: Text('votre reponse n\'est pas correcte'),
  //                 duration: Duration(seconds: 2),
  //                 showCloseIcon: true,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                 ),
  //                 backgroundColor: const Color.fromARGB(255, 175, 175, 175),
  //                 behavior: SnackBarBehavior.floating,

  //               ),
  //             )
  //       : Text('data');
  // }

  @override
  void initState() {
    i = 0;
    isShow = true;

    score = 10;
    page = 0;

    second = 10;

//  for (var index = 0; index < 3; index++) {
//      setState(() {
//         listesDesDonnees[i]['reponse'][index]['isCheck'] == false;
//      });
//     }
    // page == 9
    //     ? Navigator.of(context).push(
    //         MaterialPageRoute(builder: (BuildContext context) {
    //           return Note();
    //         }),
    //       )
    //     : '';
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // c'est une instance on l'appel avant la construction de la classe
    var auj = DateTime.now();
    var formatter = DateFormat(' EEEE dd/MM/yyyy HH:mm:ss');
    String formattedDate = formatter.format(auj);
    return Column(
      children: [
        // Container(
        //   child: Text('Score : ${score} | page ${page}'),
        // ),
        Container(
          child: Stack(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 2,
                      style: BorderStyle.solid),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                margin: EdgeInsets.all(50),
                padding: EdgeInsets.only(top: 0, bottom: 100),
                width: double.infinity,
                child: Image.asset(listesDesDonnees[i]['image']),
              ),
              Container(
                height: 300,
                // color: const Color.fromARGB(255, 7, 255, 65),
                margin: EdgeInsets.all(50),
                padding: EdgeInsets.all(50),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(listesDesDonnees[i]['question']),
                ),
              )
            ],
          ),
        ),
        Expanded(
          // ICI si on check juste l'un d'eux
          child: Container(
            margin: EdgeInsets.only(top: 0, left: 50, right: 50),
            child: ListView.builder(
              itemCount: listesDesDonnees[i]['reponse'].length,
              itemBuilder: (context, index) {
                final question =
                    listesDesDonnees[i]['reponse'][index]['reponse_1'];
                //  var checkbox =
                //   listesDesDonnees[i]['reponse'][index]['isCheck'];
                return Card(
                    elevation: 0.2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200)),
                    child: ListTile(
                      // key:question ,
                      leading: Text(Alphabet[index]),
                      title: Text(question),
                      trailing: isShow == true
                          ? Checkbox(
                              activeColor: Colors.green,
                              // fillColor: MaterialStatePropertyAll(Colors.green),
                              // checkColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              value: listesDesDonnees[i]['reponse'][index]
                                  ['isCheck'],
                              onChanged: (bool? newValue) {
                                setState(() {
                                  // pour rediriger apres
                                  page = page + 1;
                                  listesDesDonnees[i]['reponse'][index]
                                      ['isCheck'] = newValue ?? false;

                                  isShow = false;
                                  listesDesDonnees[i]['reponse'][index]
                                              ['isCheck'] ==
                                          true
                                      ? listesDesDonnees[i]['reponse'][index]
                                                  ['isTrue'] ==
                                              true
                                          ? score = score
                                          : score = score - 1
                                      : score = score;

                                  page == 10
                                      ? Future.delayed(Duration(seconds: 10),
                                          () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                              return Note(
                                                score: score, page: page, i: i,
                                                // function x(){
                                                //   setState((int x) {
                                                //     page = x ;
                                                //   });
                                                // } :function
                                              );
                                            }),
                                          );
                                        })
                                      : '';
                                });
                                alert(i, index);
                                seconds();
                              })
                          : Text(''),
                      // Icon(
                      //   Icons.check_circle,
                      //   color: checkBlack,
                      // ),

                      // onTap: () {
                      //   setState(() {
                      //     checkBlack = check;
                      //   });
                      // },
                    ));
              },
            ),
          ),
        ),
        page < 10
            ? isShow == false
                ? Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 50),
                    decoration: const BoxDecoration(
                        // color: Color.fromARGB(255, 126, 126, 126),
                        ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            i == 9 ? i = i + 1 : i = i + 1;

                            isShow = true;

                            // i > 9
                            //     ? Navigator.of(context).push(
                            //         MaterialPageRoute(
                            //             builder: (BuildContext context) {
                            //           return Note();
                            //         }),
                            //       )
                            //     : '';
                            // page == 10
                            //     ? Future.delayed(Duration(seconds: 3), () {
                            //         Navigator.of(context).push(
                            //           MaterialPageRoute(
                            //               builder: (BuildContext context) {
                            //             return Note();
                            //           }),
                            //         );
                            //       })
                            //     : '';
                          });
                        },
                        // label: Text('Suivant'),
                        child: Text('Suivant',
                            style: TextStyle(color: Colors.black)),
                        // icon: const Icon(Icons.arrow_circle_down_outlined),
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 255, 255, 255)),
                            iconColor:
                                const MaterialStatePropertyAll(Colors.indigo)),
                      ),
                    ),
                  )
                : Container(
                    child: Text('En attente de votre reponse ....'),
                  )
            : Text('Dans ${second} seconde => Votre note est :')
      ],
    );
  }
}
