import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Exemplos extends StatefulWidget {
  const Exemplos({Key? key}) : super(key: key);

  @override
  _ExemplosState createState() => _ExemplosState();
}

class _ExemplosState extends State<Exemplos> {

  _card_1() {
    return Card(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.only(bottom: 20.0, left: 50.0, right: 50.0, top: 20.0),
      child: Column(
        children: [
          Image.asset('images/bolo1.jpg'),
          Text('BRIGADEIRÃO',
              style: GoogleFonts.abel(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
          Text('Massa: Chocolate'
              '\nRecheio: Brigadeiro'
              '\nTopo: Brigadeiros e Morangos',
              style: GoogleFonts.abel
                (fontSize: 20.0,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }

  _card_2() {
    return Card(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.only(bottom: 20.0, left: 50.0, right: 50.0, top: 20.0),
      child: Column(
        children: [
          Image.asset('images/bolo2.jpg'),
          Text('FLORESTA NEGRA',
              style: GoogleFonts.abel(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
          Text('Massa: Chocolate'
              '\nRecheio: Chantilly e Cerejas'
              '\nTopo: Chantilly, Cerejas Marrasquino e Raspas de Chocolate',
              style: GoogleFonts.abel
                (fontSize: 20.0,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }

  _card_3() {
    return Card(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.only(bottom: 20.0, left: 50.0, right: 50.0, top: 20.0),
      child: Column(
        children: [
          Image.asset('images/bolo3.jpg'),
          Text('PAVLOVA',
              style: GoogleFonts.abel(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
          Text('Massa: Merengue'
              '\nRecheio: Creme de Merengue'
              '\nTopo: Frutas Vermelhas',
              style: GoogleFonts.abel
                (fontSize: 20.0,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }

  _card_4() {
    return Card(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.only(bottom: 20.0, left: 50.0, right: 50.0, top: 20.0),
      child: Column(
        children: [
          Image.asset('images/bolo_4.jpeg'),
          Text('OURO BRANCO',
              style: GoogleFonts.abel(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
          Text('Massa: Baunilha'
              '\nRecheio: Ouro Branco'
              '\nTopo: Creme de Chocolate Branco, Raspas de Chocolate Branco e Ouro Branco Picados',
              style: GoogleFonts.abel
                (fontSize: 20.0,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }

  _card_5() {
    return Card(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.only(bottom: 20.0, left: 50.0, right: 50.0, top: 20.0),
      child: Column(
        children: [
          Image.asset('images/bolo5.jpg'),
          Text('RED VELVET',
              style: GoogleFonts.abel(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
          Text('Massa: Baunilha Pigmentada de Vermelho'
              '\nRecheio: Creme Inglês'
              '\nTopo: Chantilly com Farelos da Massa Vermelha',
              style: GoogleFonts.abel
                (fontSize: 20.0,
                  color: Colors.white),
              textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }

  _voltar(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 100.0, left: 100.0, top: 20.0, bottom: 20.0),
      color: Colors.lightBlueAccent,
      child: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          label: Text(
            'Voltar Para Home',
              style: GoogleFonts.pacifico
                (
                  fontSize: 20.0,
                  color: Colors.white
              ),
              textAlign: TextAlign.center
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplos de Bolos',style: GoogleFonts.pacifico(color: Colors.white, fontSize: 30.0)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _card_1(),
          _card_2(),
          _card_3(),
          _card_4(),
          _card_5(),
          _voltar(context)
        ],
      )
    );
  }
}
