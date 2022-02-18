import 'package:exemplo_projeto_final/model/model.dart';
import 'package:exemplo_projeto_final/repository/repository.dart';
import 'package:exemplo_projeto_final/views/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Encomenda extends StatefulWidget {
  const Encomenda({Key? key}) : super(key: key);

  @override
  _EncomendaState createState() => _EncomendaState();
}

class _EncomendaState extends State<Encomenda> {

  late ScheduleRepository _repository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository = ScheduleRepository();
  }

  _message() => Center(child: Text('Sem dados'),);

  _progress() => Center(child: CircularProgressIndicator());
  
  _title(Schedule schedule) {
    Row(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Código ${schedule.id} - ${schedule.name}\nTelefone ${schedule.phone}'),
            )
          ],
        )
      ],
    );
  }
  
  _subTitle(Schedule schedule) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Icon(Icons.calendar_today),
          Text(schedule.date.toString()),
          Icon(Icons.schedule),
          Text(schedule.hour.toString()),
        ],
      ),
    );
  }

  _card(BuildContext context, Schedule schedule) {
    return Card(
      child: ListTile(
        title: _title(schedule),
        subtitle: _subTitle(schedule),
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        trailing: GestureDetector(
          onTap: () {
            print('Clicou para excluir');
          },
          child: Icon(Icons.delete),
        ),
        onTap: () {
          print('voce escolheu ${schedule.toString()}');
        },
      ),
    );
  }

  _listSchedules(BuildContext context, List<Schedule>? schedules) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: schedules!.length,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.delete_forever),
            ),
            key: ValueKey<int>(schedules.elementAt(index).id!),
            onDismissed: (DismissDirection direction) async {
              print('td que vai ser excluido: ${schedules.elementAt(index).id!}');
              await _repository.delete(schedules.elementAt(index).id!);
              setState(() {

              });
            },
            child: _card(context, schedules.elementAt(index)),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encomende seu Bolo',style: GoogleFonts.pacifico(color: Colors.white, fontSize: 30.0)),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _repository.fetchAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Schedule>> snapshot) {
          if(snapshot.hasData) {
            if(snapshot.data!.isEmpty) {
              return _message();
            }
            List<Schedule>? schedules = snapshot.data;
            print('${schedules.toString()}');
            return  _listSchedules(context, schedules);
          }
          return _progress();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final reloadPage = await Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => ViewScheduleTime())
          );

          if(reloadPage) {
            setState(() {
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
