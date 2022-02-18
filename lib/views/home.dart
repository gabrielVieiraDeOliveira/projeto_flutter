import 'package:exemplo_projeto_final/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasty cakes',style: GoogleFonts.pacifico(color: Colors.white, fontSize: 30.0)),
        centerTitle: true,
      ),
      drawer: MenuDrawer(),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                //decoration: BoxDecoration(color: Colors.lightBlue),
                child: Expanded(
                  child: Image.asset('images/back_home_tasty.jpg', fit: BoxFit.fitWidth,),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
