import 'package:flutter/material.dart';
import 'animation.dart';

class Ui extends StatefulWidget {
  int i;
  final Function(int, int) notifyParent;
  Ui({Key? key, required this.i, required this.notifyParent}) : super(key: key);

  @override
  _UiState createState() => _UiState();
}

class _UiState extends State<Ui> {
  int selectedRadio = 0;
  int poids = 70;
  final _formKey = GlobalKey<FormState>();
  String weight = "0";

  setRadio(int val) {
    setState(() {
      selectedRadio = val;
      widget.i = val;
      if (_formKey.currentState!.validate()) {
        poids = int.parse(weight);
      } else
        poids = 0;
      widget.notifyParent(val, poids);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                maxLength: 10,
                decoration: InputDecoration(
                  fillColor: Colors.blue.withOpacity(0.8),
                  filled: true,
                  hintText: "Your Weight:",
                  errorStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.red),
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(100)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
                onChanged: (value) => setState(() {
                  weight = value;
                  setRadio(selectedRadio);
                }),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field cannot be empty!';
                  }
                  if (!checkValue(value)) {
                    return 'only digits';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Images(
                        i: 0,
                        x: 70.0,
                        y: 70,
                      ),
                      Radio(
                        value: 0,
                        groupValue: selectedRadio,
                        onChanged: (val) => setState(() {
                          setRadio(val as int);
                        }),
                      ),
                    ],
                  ),
                  Column(children: [
                    const Images(
                      i: 1,
                      x: 70.0,
                      y: 70,
                    ),
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (val) => setState(() {
                        setRadio(val as int);
                      }),
                    ),
                  ]),
                  Column(
                    children: [
                      const Images(
                        i: 2,
                        x: 70.0,
                        y: 70,
                      ),
                      Radio(
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (val) => setState(() {
                          setRadio(val as int);
                        }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Images(
                        i: 3,
                        x: 70.0,
                        y: 70,
                      ),
                      Radio(
                        value: 3,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setState(() {
                            setRadio(val as int);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool checkValue(String value) {
    int? check;

    if (value == null || value.isEmpty) {
      return false;
    }
    if (int.tryParse(value) != null) {
      check = int.tryParse(value);
      if (check! > 0) {
        return true;
      }
    }
    return false;
  }
}
