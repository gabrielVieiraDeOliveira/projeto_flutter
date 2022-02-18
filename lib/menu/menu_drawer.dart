import 'package:exemplo_projeto_final/constant.dart';
import 'package:exemplo_projeto_final/model/model.dart';
import 'package:exemplo_projeto_final/views/views.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {

  var nameUser = Schedule().name;

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Theme.of(context).primaryColor
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight
        )
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 19.0,
            left: 20.0,
            child: Text(nameUser ?? 'Sem Usuário',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
          ),
          Positioned(
            top: 20.0,
            left: 16.0,
            child: Icon(Icons.person, size: 100,),
          )
        ],
      ),
    );
  }

  Widget _createDrawerIten({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
              padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(context),
          _createDrawerIten(
              icon: Icons.cake,
              text: Constant.menuExemplo,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext contex) => Exemplos()));
              }
          ),
          SizedBox(height: 10.0,),
          Divider(),
          _createDrawerIten(
              icon: Icons.person,
              text: Constant.menuSobre,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Sobre()));
              }
          ),
          SizedBox(height: 10.0,),
          Divider(),
          _createDrawerIten(
              icon: Icons.phone,
              text: Constant.menuEncomenda,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Encomenda()));
              }
          ),
          SizedBox(height: 10.0,),
          Divider(),
          _createDrawerIten(
              icon: Icons.add_to_home_screen_rounded,
              text: Constant.menuAPI,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ConsumoAPI()));
              }
          ),
        ],
      ),
    );
  }

}