import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'monday_screen.dart';
import 'tuesday_screen.dart';
import 'wednesday_screen.dart';
import 'thursday_screen.dart';
import 'friday_screen.dart';
import 'saturday_screen.dart';
import 'sunday_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bugetbuddy',
      initialRoute: '/',
      routes: {
        '/': (context) => const Budgetbuddy(),
        '/monday': (context) => const MondayScreen(),
        '/tuesday': (context) => const TuesdayScreen(),
        '/wednesday': (context) => const WednesdayScreen(),
        '/thursday': (context) => const ThursdayScreen(),
        '/friday': (context) => const FridayScreen(),
        '/saturday': (context) => const SaturdayScreen(),
        '/sunday': (context) => const SundayScreen(),
      },
    );
  }
}

class Budgetbuddy extends StatefulWidget {
  const Budgetbuddy({Key? key}) : super(key: key);

  @override
  State<Budgetbuddy> createState() => BudgetbuddyState();
}

class BudgetbuddyState extends State<Budgetbuddy> {
  // _prefs will refer a created SharedPreferences  object
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // _counter as a Future
  //int? _counter;
  late Future<int> _budget;
  final textController = TextEditingController();
  String inputtext = '';
  late Future<int> _exMo;
  late Future<int> _exTu;
  late Future<int> _exWe;
  late Future<int> _exTh;
  late Future<int> _exFr;
  late Future<int> _exSa;
  late Future<int> _exSu;

  late Future<int> _result;
  int result = 0;

  Future<void> _inputExMo(int exMo) async {
    final SharedPreferences prefs = await _prefs;
    final int newEx = exMo;
    prefs.setInt('exMo', newEx);
    _exMo = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exMo') ?? 0;
    });
  }
  Future<void> _inputExTu(int exTu) async {
    final SharedPreferences prefs = await _prefs;
    final int newEx = exTu;
    prefs.setInt('exTu', newEx);
    _exTu = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exTu') ?? 0;
    });
  }
  Future<void> _inputExWe(int exWe) async {
    final SharedPreferences prefs = await _prefs;
    final int newEx = exWe;
    prefs.setInt('exWe', newEx);
    _exWe = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exWe') ?? 0;
    });
  }
  Future<void> _inputExTh(int exTh) async {
    final SharedPreferences prefs = await _prefs;
    final int newEx = exTh;
    prefs.setInt('exTh', newEx);
    _exTh = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exTh') ?? 0;
    });
  }
  Future<void> _inputExFr(int exFr) async {
    final SharedPreferences prefs = await _prefs;
    final int newEx = exFr;
    prefs.setInt('exFr', newEx);
    _exFr = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exFr') ?? 0;
    });
  }
  Future<void> _inputExSa(int exSa) async {
    final SharedPreferences prefs = await _prefs;
    final int newEx = exSa;
    prefs.setInt('exSa', newEx);
    _exSa = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exSa') ?? 0;
    });
  }
  Future<void> _inputExSu(int exSu) async {
    final SharedPreferences prefs = await _prefs;
    final int newEx = exSu;
    prefs.setInt('exSu', newEx);
    _exSu = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exSu') ?? 0;
    });
  }
  Future<void> _inputBudget(String inputtext) async {
    int help = int.parse(inputtext);
    final SharedPreferences prefs = await _prefs;
    final int newCounter = help;
    prefs.setInt('budget', newCounter);
    _budget = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('budget') ?? 0;
    });
    _division();
  }

  Future<void> _division() async {
    final SharedPreferences prefs = await _prefs;
    int? divB = prefs.getInt('budget') ?? 0;
    int? divMo = prefs.getInt('exMo') ?? 0;
    int? divTu = prefs.getInt('exTu') ?? 0;
    int? divWe = prefs.getInt('exWe') ?? 0;
    int? divTh = prefs.getInt('exTh') ?? 0;
    int? divFr = prefs.getInt('exFr') ?? 0;
    int? divSa = prefs.getInt('exSa') ?? 0;
    int? divSu = prefs.getInt('exSu') ?? 0;

     result = divB - (divMo+divTu+divWe+divTh+divFr+divSa+divSu);
    prefs.setInt('result', result);
    _result = _prefs.then((SharedPreferences prefs){
      return prefs.getInt('result') ?? 0;
    });
  }


  Future<void> _clearCounter() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }


  Future<void> colorManager() async {
    final SharedPreferences prefs = await _prefs;
    result = prefs.getInt('result')!;
  }

  @override
  void initState() {
    super.initState();
    _exMo = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exMo') ?? 0;
    });
    _exTu = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exTu') ?? 0;
    });
    _exWe = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exWe') ?? 0;
    });
    _exTh = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exTh') ?? 0;
    });
    _exFr = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exFr') ?? 0;
    });
    _exSa = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exSa') ?? 0;
    });
    _exSu = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exSu') ?? 0;
    });
    _budget = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('budget') ?? 0;
    });
    _result = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('result') ?? 0;
    });
    colorManager();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Budget Buddy"), centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment(0.8, 1),
      colors: <Color>[
        Colors.indigoAccent,
        Colors.blueGrey,
      ],),),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 30,),
                    keyboardType: TextInputType.number,
                    controller: textController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    decoration: InputDecoration(
                      filled: true,
                        fillColor: Color.fromARGB(200,21,21,21),
                        border: OutlineInputBorder(),
                        hintText: 'Please enter your Budget',hintStyle: TextStyle(color: Colors.white54, fontSize: 20),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _inputBudget(inputtext = textController.text);
                              });
                            },
                            icon: Icon(Icons.arrow_circle_right_sharp, color: Colors.white, size: double.tryParse('30'),))),
                  ),
                ),// InputBudget
                FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: Color.fromARGB(200, 21, 21, 21), borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                      child: FutureBuilder<int>(
                          future: _budget,
                          builder: (BuildContext context,
                              AsyncSnapshot<int> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const CircularProgressIndicator();
                              default:
                                if (snapshot.hasError) {
                                  return const Text('Error');
                                } else {
                                  return Text('  ${snapshot.data}  ',style: TextStyle(color: Colors.white,fontSize: 30),);
                                }
                            }
                          }),
                    ),
                  ),
                ), //ShowBudget
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(5, 5),
                              )
                            ],
                          ),
                          width: 170,
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  print('will load a Monday screen');
                                  dynamic outMo = await Navigator.pushNamed(
                                      context, '/monday');
                                  _inputExMo(outMo);
                                  _division();
                                  setState(() {});
                                },
                                child: const Text('Monday',style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.underline, decorationThickness: 2.0),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: FutureBuilder<int>(
                                      future: _exMo,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return const CircularProgressIndicator();
                                          default:
                                            if (snapshot.hasError) {
                                              return const Text('Error');
                                            } else {
                                              return Text('${snapshot.data}',style: TextStyle(fontSize: 40, color: Colors.white),);
                                            }
                                        }
                                      }),
                                ),
                              )

                              //Container(FutureBuilder)
                            ],
                          ),
                        ),
                      ) //Monday
,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(5, 5),
                              )
                            ],
                          ),
                          width: 170,
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  print('will load a Tuesday screen');
                                  dynamic outTu = await Navigator.pushNamed(
                                      context, '/tuesday');
                                  _inputExTu(outTu);
                                  _division();
                                  setState(() {});
                                },
                                child: const Text('Tuesday',style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.underline, decorationThickness: 2.0),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: FutureBuilder<int>(
                                      future: _exTu,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return const CircularProgressIndicator();
                                          default:
                                            if (snapshot.hasError) {
                                              return const Text('Error');
                                            } else {
                                              return Text('${snapshot.data}',style: TextStyle(fontSize: 40, color: Colors.white),);
                                            }
                                        }
                                      }),
                                ),
                              )

                              //Container(FutureBuilder)
                            ],
                          ),
                        ),
                      ) //Tuesday
                    ],
                  ),
                ),// Monday, Tuesday
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(5, 5),
                              )
                            ],
                          ),
                          width: 170,
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  print('will load a Wednesday screen');
                                  dynamic outWe = await Navigator.pushNamed(
                                      context, '/wednesday');
                                  _inputExWe(outWe);
                                  _division();
                                  setState(() {});
                                },
                                child: const Text('Wednesday',style: TextStyle(fontSize: 29, color: Colors.white, decoration: TextDecoration.underline, decorationThickness: 2.0),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: FutureBuilder<int>(
                                      future: _exWe,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return const CircularProgressIndicator();
                                          default:
                                            if (snapshot.hasError) {
                                              return const Text('Error');
                                            } else {
                                              return Text('${snapshot.data}',style: TextStyle(fontSize: 40, color: Colors.white),);
                                            }
                                        }
                                      }),
                                ),
                              )

                              //Container(FutureBuilder)
                            ],
                          ),
                        ),
                      ) //Wednesday
                      ,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(5, 5),
                              )
                            ],
                          ),
                          width: 170,
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  print('will load a Thursday screen');
                                  dynamic outTh = await Navigator.pushNamed(
                                      context, '/thursday');
                                  _inputExTh(outTh);
                                  _division();
                                  setState(() {});
                                },
                                child: const Text('Thursday',style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.underline, decorationThickness: 2.0),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: FutureBuilder<int>(
                                      future: _exTh,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return const CircularProgressIndicator();
                                          default:
                                            if (snapshot.hasError) {
                                              return const Text('Error');
                                            } else {
                                              return Text('${snapshot.data}',style: TextStyle(fontSize: 40, color: Colors.white),);
                                            }
                                        }
                                      }),
                                ),
                              )

                              //Container(FutureBuilder)
                            ],
                          ),
                        ),
                      ) //Thursday
                    ],
                  ),
                ), // Wednesday, Thursday
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(5, 5),
                              )
                            ],
                          ),
                          width: 170,
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  print('will load a Friday screen');
                                  dynamic outFr = await Navigator.pushNamed(
                                      context, '/friday');
                                  _inputExFr(outFr);
                                  _division();
                                  setState(() {});
                                },
                                child: const Text('Friday',style: TextStyle(fontSize: 29, color: Colors.white, decoration: TextDecoration.underline, decorationThickness: 2.0),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: FutureBuilder<int>(
                                      future: _exFr,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return const CircularProgressIndicator();
                                          default:
                                            if (snapshot.hasError) {
                                              return const Text('Error');
                                            } else {
                                              return Text('${snapshot.data}',style: TextStyle(fontSize: 40, color: Colors.white),);
                                            }
                                        }
                                      }),
                                ),
                              )

                              //Container(FutureBuilder)
                            ],
                          ),
                        ),
                      ) //Friday
                      ,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(5, 5),
                              )
                            ],
                          ),
                          width: 170,
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              TextButton(
                                onPressed: () async {
                                  print('will load a Saturday screen');
                                  dynamic outSa = await Navigator.pushNamed(
                                      context, '/saturday');
                                  _inputExSa(outSa);
                                  _division();
                                  setState(() {});
                                },
                                child: const Text('Saturday',style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.underline, decorationThickness: 2.0),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: FutureBuilder<int>(
                                      future: _exSa,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return const CircularProgressIndicator();
                                          default:
                                            if (snapshot.hasError) {
                                              return const Text('Error');
                                            } else {
                                              return Text('${snapshot.data}',style: TextStyle(fontSize: 40, color: Colors.white),);
                                            }
                                        }
                                      }),
                                ),
                              )

                              //Container(FutureBuilder)
                            ],
                          ),
                        ),
                      ) //Saturday
                    ],
                  ),
                ), // Friday, Saturday
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: const Offset(5, 5),
                          )
                        ],
                      ),
                      width: 170,
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          TextButton(
                            onPressed: () async {
                              print('will load a Sunday screen');
                              dynamic outSu = await Navigator.pushNamed(
                                  context, '/sunday');
                              _inputExSu(outSu);
                              _division();
                              setState(() {});
                            },
                            child: const Text('Sunday',style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.underline, decorationThickness: 2.0),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: FutureBuilder<int>(
                                  future: _exSu,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<int> snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting:
                                        return const CircularProgressIndicator();
                                      default:
                                        if (snapshot.hasError) {
                                          return const Text('Error');
                                        } else {
                                          return Text('${snapshot.data}',style: TextStyle(fontSize: 40, color: Colors.white),);
                                        }
                                    }
                                  }),
                            ),
                          )

                          //Container(FutureBuilder)
                        ],
                      ),
                    ),
                  ),
                ), // Sunday
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: result >= 0  ? Colors.green : Colors.red,
        child: Center(heightFactor: double.tryParse('2'),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              child: FutureBuilder<int>(
                  future: _result,
                  builder: (BuildContext context,
                      AsyncSnapshot<int> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      default:
                        if (snapshot.hasError) {
                          return const Text('Error');
                        } else {
                          return Text('${snapshot.data}',style: TextStyle(fontSize: 30),);
                        }
                    }
                  }),
            )
          ),
        ),
      ), // Result
    );
  }


}

