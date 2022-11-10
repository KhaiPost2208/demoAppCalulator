import 'package:flutter/material.dart';
import 'dart:math';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int Sodau = 0;
  int Sosau = 0;
  String opp = "" ;
  String ketqua ="0";
  String Hienthi ="" ;
  buttonPress(String Click){
    if (Click == "C"){
      ketqua = "";
      Sodau = 0;
      Sosau = 0;
      Hienthi = "";
    }
    else if (Click == "+" || Click == "-" || Click == "X" || Click == "/" || Click == ".") {
      Sodau = int.parse(Hienthi);
      ketqua = "";
      opp = Click;
    }
    else if (Click == "<=") {
      ketqua = Hienthi.substring(0, Hienthi.length - 1);
    }
    else if (Click == "."){
      if (ketqua.contains(".")){
        return;
      }
      else{
        ketqua = ketqua + Click;
      }
    }
    else if (Click == "=") {
      Sosau = int.parse(Hienthi);
      if(opp == "+"){
        ketqua = (Sodau + Sosau).toString();
      }
      else if (opp == "-") {
        ketqua = (Sodau - Sosau).toString();
      }
      else if (opp == "X") {
        ketqua = (Sodau * Sosau).toString();
      }
      else if (opp == "/") {
        ketqua = (Sodau / Sosau).toString();
      }
    }
    else {
      ketqua = int.parse(Hienthi + Click).toString();
    }

    setState(() {
      Hienthi = ketqua;
    });

  }
  Widget Button2(String Click, Color Clickcolor, Color txtcolor){
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          fixedSize: Size(160, 80),
          primary: Clickcolor,
        ),
        onPressed: () => buttonPress(Click),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 12, 90, 12),
          child: Text(Click,
            style: TextStyle(fontSize: 30, color: txtcolor),
          ),
        ),
      ),
    );
  }

  Widget Button(String Click, Color Clickcolor, Color txtcolor){
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          fixedSize: Size(80, 80),
          primary: Clickcolor,
        ),
        onPressed: () => buttonPress(Click),
        child: Text(Click,
          style: TextStyle(fontSize: 30, color: txtcolor),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Máy Tính"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(10),
                  child: Text(Hienthi,
                    //textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button2("C", Colors.grey, Colors.black),
                Button("<=", Colors.grey, Colors.black),
                Button("/", Colors.orangeAccent, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button("7", Colors.grey, Colors.black),
                Button("8", Colors.grey, Colors.black),
                Button("9", Colors.grey, Colors.black),
                Button("X", Colors.orangeAccent, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button("4", Colors.grey, Colors.black),
                Button("5", Colors.grey, Colors.black),
                Button("6", Colors.grey, Colors.black),
                Button("-", Colors.orangeAccent, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button("1", Colors.grey, Colors.black),
                Button("2", Colors.grey, Colors.black),
                Button("3", Colors.grey, Colors.black),
                Button("+", Colors.orangeAccent, Colors.white),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button2("0", Colors.grey, Colors.black),
                Button(".", Colors.grey, Colors.black),
                Button("=", Colors.orangeAccent, Colors.white),
            ],
            ),

          ],
        ),
      ),
    );
  }
}
