import 'dart:convert';

import 'package:flutter_medical_management_project/config.dart';
import 'package:flutter_medical_management_project/models/doctorOrder.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class InventoryService {
  Future<List<DoctorOrderModel>> getAllInventory() async {
    final response = await http.get(Uri.parse('$BASE_URL/api/doctorOder'));
    if (response.statusCode == 200) {
      Map jsonResponse = jsonDecode(response.body);
      List<dynamic> parsedListJson = jsonResponse["doctorOders"];
      List<DoctorOrderModel> result = List<DoctorOrderModel>.from(parsedListJson
          .map<DoctorOrderModel>((dynamic i) => DoctorOrderModel.fromJson(i)));
      return result;
    } else {
      throw Exception(response.body);
    }
  }
}
