import 'dart:convert';
import 'package:exemplo_projeto_final/constant.dart';
import 'package:exemplo_projeto_final/model/model.dart';
import 'package:http/http.dart' as http;

class CepService {

  Future<Cep> getCEP({required String CEP}) async {

    print("Cep ${CEP.toString()}");

    var url = Uri.https(Constant.baseURL, Constant.cepEndPoint + "$CEP");

    final response = await http.Client().get(url);

    if(response.statusCode != 200)
      throw Exception();

    print("body: ${response.body}");

    //decode......
    return parsedJson(response.body);
  }

  Cep parsedJson(final response) {
    final jsonDecode = json.decode(response);
    return Cep.fromJson(jsonDecode); //transforma o json de entrada em um objeto do tipo CEP
  }

}