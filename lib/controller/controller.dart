
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roomdemo/model/usermodel.dart';

class GetxTapController extends GetxController {
  Customerdatamodel? alldata;
  final List _customerEstimateFlow = [];
  var isDataLoading = false.obs;

  List get customerEstimateFlow => _customerEstimateFlow;

  @override
  Future<void> onInit() async {
    super.onInit();
    getalldata();
  }

  Future<void> getalldata() async {
  try {
    log("Fetching data...");
    isDataLoading(true);

    final response = await http.get(Uri.parse("http://test.api.boxigo.in/sample-data/"));

    if (response.statusCode == 200) {
      log("Response data: ${response.body}"); // Log the raw response body
      
      // Decode the JSON response into a Map
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      log("Decoded Data: $decodedData");

      // Extract specific key-value pairs
      var customerEstimateFlow = decodedData['Customer_Estimate_Flow'];
      if (customerEstimateFlow != null) {
        for (var element in customerEstimateFlow) {
          _customerEstimateFlow.add(element);
          log("Customer Estimate Flow Element: $element");
        }
      } else {
        log("Customer_Estimate_Flow is null or not found.");
      }

      log("Customer Estimate Flow: $_customerEstimateFlow"); 
    } else {
      log("Error in API: Status Code ${response.statusCode}");
    }
  } catch (e) {
    log("Error in API call: $e");
  } finally {
    isDataLoading(false);
  }
}

}
