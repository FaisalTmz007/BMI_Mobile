import 'package:flutter/material.dart';

class TextFieldSignin extends StatelessWidget {
  const TextFieldSignin(
      {super.key,
      required this.kontrol,
      required this.hintText,
      this.isNumber = false});

  final TextEditingController kontrol;
  final String hintText;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    TextInputType tipe = TextInputType.text;
    if (isNumber) {
      tipe = TextInputType.number;
    }

    return TextField(
      keyboardType: tipe,
      controller: kontrol,
      cursorColor: Color(0xFF7972E6),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple)),
        hintStyle: TextStyle(fontWeight: FontWeight.w400),
        hintText: hintText,
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({
    super.key,
    required this.password,
  });

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: password,
        cursorColor: Color(0xFF7972E6),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
          hintStyle: TextStyle(fontWeight: FontWeight.w400),
          hintText: 'Password',
        ));
  }
}

class FieldTextProduct extends StatelessWidget {
  const FieldTextProduct(
      {super.key, required this.contoller, required this.hintText, this.besar});

  final TextEditingController contoller;
  final String hintText;
  final String? besar;

  String get _besar => besar != null ? besar! : "kecil";

  @override
  Widget build(BuildContext context) {
    int minLines = 1;
    int maxLines = 1;
    if (besar == "besar") {
      minLines = 3;
      maxLines = 4;
    }
    return TextField(
        controller: contoller,
        cursorColor: Color(0xFF7972E6),
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          label: Text(hintText),
          hintText: hintText,
        ));
  }
}

class FieldAddTextProduct extends StatelessWidget {
  const FieldAddTextProduct(
      {super.key,
      required this.hintText,
      this.besar = "kecil",
      this.tipe = "Text"});

  final String hintText;
  final String? besar;
  final String tipe;

  @override
  Widget build(BuildContext context) {
    int minLines = 1;
    int maxLines = 1;
    if (besar == "besar") {
      minLines = 3;
      maxLines = 4;
    }
    return TextField(
        readOnly: true,
        cursorColor: Color(0xFF7972E6),
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          label: Text(hintText),
          hintText: hintText,
        ));
  }
}

class TextJudul extends StatelessWidget {
  const TextJudul({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  Color get _color => color != null ? color! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _color),
    );
  }
}

void TheScaffold({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.deepPurple,
    content: Row(children: [
      Expanded(child: Text(message)),
      Icon(color: Colors.white, Icons.warning_rounded)
    ]),
    behavior: SnackBarBehavior.floating,
  ));
}
