import 'package:exemplo_projeto_final/model/model.dart';
import 'package:exemplo_projeto_final/service/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CepForm extends StatefulWidget {
  @override
  _CepFormState createState() => _CepFormState();
}

class _CepFormState extends State<CepForm> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _cepController = new TextEditingController();

  String _data = "";
  bool _progress = false;

  _rowIcon() {
    return Icon(Icons.home, size: 150, color: Colors.lightBlue);
  }

  _rowCep() {
    return new TextFormField(
        controller: _cepController,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(hintText: "Digite o seu CEP"),
        maxLength: 8,
        validator: (value) {
          if(value!.isEmpty) {
            return 'Digite um cep válido!';
          }
          return null;
        }
    );
  }

  _rowButton(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 100.0, left: 100.0, top: 20.0, bottom: 20.0),
      color: Colors.lightBlueAccent,
      child: TextButton(
          onPressed: () {
            _search(context);
            _resetFields();
          },
          child: Text(
              'BUSCAR',
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

  _rowProgress() {
    return _progress ? CircularProgressIndicator() : Text(''); //cheiro gambiarra....
  }

  _rowResult() {
    return Row(
      children: [
        Expanded(child: Text('Seus dados: $_data', style: GoogleFonts.abel(fontSize: 20.0, color: Colors.lightBlueAccent), textAlign: TextAlign.center,)
        ),
      ],
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

  _rowForm(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          _rowIcon(),
          _rowCep(),
          _rowButton(context),
          _rowProgress(),
          _rowResult(),
          _voltar(context)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _rowForm(context),
    );
  }

  _search(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      var cepService = CepService();

      //antes habilitar a progress
      setState(() {
        _progress = true;
      });

      Cep cep = await cepService.getCEP(CEP: _cepController.text); //vai demorar!!!

      //desabilitar a progress

      //para atualizar a tela
      setState(() {
        _data = cep.toString();
        _progress = false;
      });

    } else {
      print('erro! cep nao digitado...');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Digite o CEP corretamente :-/'))
      );
    }
  }

  _resetFields() => _formKey.currentState!.reset();

}