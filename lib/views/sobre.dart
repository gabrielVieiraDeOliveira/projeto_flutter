import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {

  _tab_1(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          child: Column(
            children: [
              Image.asset('images/img_fachada.jpeg', fit: BoxFit.fitWidth,),
              Text(
                  'CONTATOS',
                  style: GoogleFonts.abel(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center
              ),
              Text(
                  '(51) 3443-4343'
                    '\n@Tasty.CakesOFC'
                    '\ntastycakes.confeitaria@gmail.com',
                  style: GoogleFonts.abel
                    (fontSize: 20.0,
                      color: Colors.white),
                  textAlign: TextAlign.center
              ),
              SizedBox(height: 10.0,),
              Text(
                  'Nossa confeitaria inclui a fabricação de bolos, tortas e doces.'
                      '\nExercemos muita dedicação, amor,'
                      '\ne resposabilidade para efetuar nossos produtos.'
                      '\nTemos conhecimentos de culinária '
                      '\ne bom relacionamento interpessoal para lidar com os clientes.',
                  style: GoogleFonts.abel
                    (fontSize: 20.0,
                      color: Colors.white),
                  textAlign: TextAlign.center
              ),
            ],
          ),
        )
      ],
    );
  }

  _tab_2(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.blue,
          child: Row(
            children: [
              Expanded(
                child: Image.asset('images/img_gabriel.jpeg',fit: BoxFit.cover),
              ),
              Expanded(
                child: Image.asset('images/img_lucas1.jpg',fit: BoxFit.cover),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Column(
              children: [
                Text(
                  'EMAILS',
                    style: GoogleFonts.abel(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center
                ),
                Text(
                  'vieiradeoliveira.gabriel2@gmail.com'
                      '\nnuneslucas.1212.com@gmail.com',
                    style: GoogleFonts.abel
                      (fontSize: 20.0,
                        color: Colors.white),
                    textAlign: TextAlign.center
                ),
                Text(
                  'Sobre a Disciplina',
                   style: GoogleFonts.abel(
                       fontSize: 25.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.white),
                    textAlign: TextAlign.center
                  ),
                Text(
                  'Por mais que esteja sendo bem complexa, por conta de ser nosso primeiro contato com programação, está sendo bem interessante e ao mesmo tempo desafiador.'
                      '\nPois desde sempre, ambos tivemos bastante interesse em aprender criação de aplicativos.',
                    style: GoogleFonts.abel
                      (fontSize: 20.0,
                        color: Colors.white),
                    textAlign: TextAlign.center
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sobre',style: GoogleFonts.pacifico(color: Colors.white, fontSize: 30.0)),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home, color: Colors.white),),
                Tab(icon: Icon(Icons.people,color: Colors.white),),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _tab_1(context),
              _tab_2(context),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.white,),
            tooltip: 'Back to Home',
          ),
        ),
    );
  }
}
