import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.data});

  static const routeName = '/homepage';

  final Map data;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 170.0;
  double _weight = 75.0;
  int _bmi = 0;

  String _condition = 'BMI Kamu';

  @override
  Widget build(BuildContext context) {
    Map? _data;
    if (widget.data != null) {
      _data = widget.data;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          Container(
            height: size.height * 0.40,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 10.0),
            decoration: new BoxDecoration(color: Colors.deepPurple),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Selamat Datang,",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "${_data?['name']}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Text(
                    "$_bmi",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 100.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "$_condition",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "Masukkan Data",
                  style: TextStyle(
                      color: Color(0xFF403f3d),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                RichText(
                  text: TextSpan(
                      text: "Tinggi Badan : ",
                      style:
                          TextStyle(color: Color(0xFF403f3d), fontSize: 20.0),
                      children: [
                        TextSpan(
                          text: "$_height cm",
                          style: TextStyle(
                              color: Color(0xFF403f3d),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Slider(
                  value: _height,
                  min: 0,
                  max: 250,
                  onChanged: (height) {
                    setState(() {
                      _height = height;
                    });
                  },
                  divisions: 250,
                  label: "$_height",
                  activeColor: Colors.deepPurple,
                  inactiveColor: Colors.grey,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RichText(
                  text: TextSpan(
                      text: "Berat Badan : ",
                      style:
                          TextStyle(color: Color(0xFF403f3d), fontSize: 20.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: "$_weight kg",
                          style: TextStyle(
                              color: Color(0xFF403f3d),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Slider(
                  value: _weight,
                  min: 0,
                  max: 300,
                  onChanged: (weight) {
                    setState(() {
                      _weight = weight;
                    });
                  },
                  divisions: 300,
                  label: "$_weight",
                  activeColor: Colors.deepPurple,
                  inactiveColor: Colors.grey,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.8,
                  height: 50,
                  child: ClipRRect(
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      onPressed: () {
                        setState(() {
                          //18.5 - 25 Healthy 25-30 Overweight >30 Obesity
                          _bmi = (_weight / ((_height / 100) * (_height / 100)))
                              .round()
                              .toInt();
                          if (_bmi >= 18.5 && _bmi <= 25) {
                            _condition = " Normal";
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _condition = " Overweight";
                          } else if (_bmi > 30) {
                            _condition = " Obesity";
                          } else {
                            _condition = " Underweight";
                          }
                        });
                      },
                      child: Text(
                        "Hitung BMI",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ))),
    );
  }
}
