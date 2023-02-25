import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaturdayScreen extends StatefulWidget {
  const SaturdayScreen({Key? key}) : super(key: key);
  @override
  State<SaturdayScreen> createState() => SaturdayScreenState();
}

class SaturdayScreenState extends State<SaturdayScreen> {
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int result = 0;
  late Future<int> _exSa;
  final textController = TextEditingController();
  String inputtext = '';
  int outTh = 0;

  Future<void> _inputBudget(String inputtext) async {
    final SharedPreferences prefs = await _prefs;
    int help = int.parse(inputtext);
    final int newCounter = help;
    prefs.setInt('exSa', newCounter);
    _exSa = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exSa') ?? 0;
    });
    mainoutput();
  }

  Future<void> _plusBudget(String inputtext) async {
    final SharedPreferences prefs = await _prefs;
    int input = int.parse(inputtext);
    final int help = input;
    int? exSa = prefs.getInt('exSa') ?? 0;
    result = help + exSa;
    prefs.setInt('exSa', result);
    _exSa = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exSa') ?? 0;
    });
    mainoutput();
  }

  Future<void> _minusBudget(String inputtext) async {
    final SharedPreferences prefs = await _prefs;
    int input = int.parse(inputtext);
    final int help = input;
    int? exSa = prefs.getInt('exSa') ?? 0;
    result = exSa - help;
    prefs.setInt('exSa', result);
    _exSa = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exSa') ?? 0;
    });
    mainoutput();
  }

  Future<void> mainoutput() async {
    final SharedPreferences prefs = await _prefs;
    outTh = prefs.getInt('exSa')!;
  }

  @override
  void initState() {
    super.initState();
    _exSa = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('exSa') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  Navigator.pop(context, outTh);
                });
              }),
          backgroundColor: Colors.amber.shade600,
          title: const Text('Saturday Expenditures'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Colors.amberAccent,
                Colors.grey,
              ],
            ),
          ),
          child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      keyboardType: TextInputType.number,
                      controller: textController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(200, 21, 21, 21),
                          border: OutlineInputBorder(),
                          hintText: 'Please enter your expenditure',
                          hintStyle: TextStyle(color: Colors.white54, fontSize: 20),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _inputBudget(inputtext = textController.text);
                                });
                              },
                              icon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Icon(
                                  Icons.arrow_circle_right_sharp,
                                  color: Colors.white,
                                  size: double.tryParse('40'),
                                ),
                              ))),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 50, 8),
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(150, 21, 21, 21),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _plusBudget(inputtext = textController.text);
                                  });
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.greenAccent.shade700),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(150, 21, 21, 21),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _minusBudget(inputtext = textController.text);
                                    });
                                  },
                                  child: Text('-',
                                      style: TextStyle(
                                          fontSize: 100,
                                          color: Colors.redAccent.shade700))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0, 1),
                        colors: <Color>[Colors.orange, Colors.grey],
                      ),
                    ),
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
                                    return Text(
                                      '${snapshot.data}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 40, color: Colors.white),
                                    );
                                  }
                              }
                            })),
                  ),
                ],
              )),
        ));
  }
}
