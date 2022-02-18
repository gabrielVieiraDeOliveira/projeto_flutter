import 'package:exemplo_projeto_final/views/views.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConsumoAPI extends StatefulWidget {
  const ConsumoAPI({Key? key}) : super(key: key);

  @override
  _ConsumoAPIState createState() => _ConsumoAPIState();
}

class _ConsumoAPIState extends State<ConsumoAPI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de API',style: GoogleFonts.pacifico(color: Colors.white, fontSize: 30.0)),
        centerTitle: true,
      ),
      body: CepForm(),
    );
  }
}
