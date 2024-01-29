import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kondaas/login/login.dart';
import 'package:kondaas/models/basic_model.dart';


class BasicService{

  Future<BasicModels?> sendRequest(String plantId) async {
    var apiUrl = Uri.parse(
        'https://globalapi.solarmanpv.com/station/v1.0/realTime');
    var requestbody = {
      "stationId": int.parse(plantId)
    };

    var bearerToken = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiI4NjkzMF9rb25kYWFzdXBzQGdtYWlsLmNvbV8yIiwic2NvcGUiOlsiYWxsIl0sImRldGFpbCI6eyJvcmdhbml6YXRpb25JZCI6ODY5MzAsInRvcEdyb3VwSWQiOjYyMzA2LCJncm91cElkIjo2MjMwNiwicm9sZUlkIjoxLCJ1c2VySWQiOjgxOTg3MywidmVyc2lvbiI6MTAwMSwiaWRlbnRpZmllciI6ImtvbmRhYXN1cHNAZ21haWwuY29tIiwiaWRlbnRpdHlUeXBlIjoyLCJtZGMiOiJGT1JFSUdOXzEiLCJhcHBJZCI6IjIwMjMwMTEwODY2OTE5NzQifSwiZXhwIjoxNzA3NjM4OTI3LCJtZGMiOiJGT1JFSUdOXzEiLCJhdXRob3JpdGllcyI6WyJhbGwiXSwianRpIjoiNGI1ZmIxMWUtMzUzYS00ODBhLTkzZTctYTAxYTJmYmZmYzJmIiwiY2xpZW50X2lkIjoidGVzdCJ9.j8AVbjHQzzpChobRERDHlmWxhx78Rvuzlc5uF-4M1463TMjZFuxTvcTUAF4kJXny4fqShNrc8wWFi2s-xRjkIZ5_zkR3AIJ8CR4DWtXp1Oc9jsvmf7NEm_aWS3aymxjDdjxt-Z2MoZDrs2QHAB7dAPlMJGjDkRNDMJ2JCdlR9A71EtgZeTN6QjNDc9bv6liNGo-cfoTjgwD9smcDO_X5kzEfuHVLFuqeS78X8IhSDPCzH1n4oRe7AwEDPnTkymEbuR5pe-I4yS6AjH4a5jyf6IRNnIEix4fkPBVNqOa5wcbpx6d1uedvz0sM_NeQJE00_bMMvXTr-W5bxgr93pmmPA';

    try {
      var response = await http.post(
        apiUrl,
        body: jsonEncode(requestbody),
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print('Response: ${response.body}');

        return BasicModels.fromJson(responseData);
      } else {
        // Request failed
        print('Error: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      // An error occurred
      print('Error: $e');
    }
  }
}