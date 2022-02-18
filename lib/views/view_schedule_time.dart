import 'package:exemplo_projeto_final/model/model.dart';
import 'package:exemplo_projeto_final/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewScheduleTime extends StatefulWidget {
  const ViewScheduleTime({Key? key}) : super(key: key);

  @override
  _ViewScheduleTimeState createState() => _ViewScheduleTimeState();
}

class _ViewScheduleTimeState extends State<ViewScheduleTime> {

  final ScheduleRepository _repository = ScheduleRepository();

  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _hourController = TextEditingController();

  var _service = ['Selecione o Produto', 'Bolo', 'Torta', 'Outro Doce'];
  var _serviceSelected = 'Selecione o Produto';

  _rowIcon() {
    return Icon(Icons.people, size: 150, color: Colors.blue,);
  }

  _rowName() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: 'Nome Completo Do Cliente'),
      maxLength: 50,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Digite um Nome Válido';
        }
        return null;
      },
    );
  }

  _rowPhone() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(hintText: 'Telefone Para Contato'),
      maxLength: 14,
      validator: (value) {
        if(value!.length < 8) {
          return 'Digite Um telefone Válido';
        }
        return null;
      },
    );
  }

  _rowDate() {
    return TextFormField(
      controller: _dateController,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(hintText: 'Data de Entrega'),
      maxLength: 11,
      validator: (value) {
        if(value!.length < 9) {
          return 'Digite uma Data Válida';
        }
        return null;
      },
    );
  }

  _rowHour() {
    return TextFormField(
      controller: _hourController,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(hintText: 'Horário de Entrega'),
      maxLength: 8,
      validator: (value) {
        if(value!.length < 4) {
          return 'Digite um Horário Válido';
        }
        return null;
      },
    );
  }

  _rowServiceDropdownButton() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _serviceSelected,
      items: _service.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
    }).toList(),
      hint: Text('Selecione o Produto'),
      onChanged: (newValue) {
        setState(() {
          _serviceSelected = newValue!;
        });
      },
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _register(context);
        _resetField();
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(20.0),
        backgroundColor: Theme.of(context).primaryColor
      ),
      label:Text('Agendar Horário'),
      icon: Icon(Icons.add),
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        _rowName(),
        _rowPhone(),
        _rowDate(),
        _rowHour(),
        _rowServiceDropdownButton(),
        _rowButton(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encomendar',
            style: GoogleFonts.pacifico(color: Colors.white, fontSize: 30.0)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: _formUI(context),
        ),
      ),
    );
  }

  _register(BuildContext context) {
    print('validou o formulário: ${_formKey.currentState!.validate()}');

    if(_formKey.currentState!.validate()) {
      if(_serviceSelected == 'Selecione o Produto') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Escolha um Produto'),)
        );
      } else {
        final schedule = Schedule(
            name: _nameController.text,
            phone: _phoneController.text,
            date: _dateController.text,
            hour: _hourController.text,
            kindOfService: _serviceSelected
        );

          _repository.save(schedule);

          setState(() {
            Navigator.pop(context, true);
          });
      }
    } else {
      print('Digite os campos corretamente');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite os Campos Corretamente'),)
      );
    }
  }

  _resetField() => _formKey.currentState!.reset();
}
