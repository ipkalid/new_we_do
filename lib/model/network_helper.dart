import 'package:http/http.dart' as http;
import 'dart:convert';

// TODO: check whether what you did with the queries is working properly or not (the if statements in the constructor AND the normal query).
// TODO: solve the headers problem and make sure that normal requests with headers are working.
// TODO: test all combination of requests.
// TODO: when we implement provider we should fix the methods that requires the current user info...we will make it to take the needed info by default from the provider
class NetworkHelper {
  Uri url;
  String server = "15.184.68.150";
  int port = 3000;

  NetworkHelper({Uri url, String query}) {
    if (query == null) {
      print("is null");
      this.url = Uri(scheme: "http", host: server, port: port, path: url.path);
    } else {
      this.url = Uri(
          scheme: "http",
          host: server,
          port: port,
          path: url.path,
          query: query);
    }
  }

  Future getData(Map<String, String> header) async {
    http.Response response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      String data = response.body;
      debugPrintURL(response);

      return jsonDecode(data);
    } else {
      debugPrintURL(response);
      return "Error occurred: ${response.statusCode}";
    }
  }

  Future postDataTemp(Map<String, String> body) async {
    http.Response response = await http.post(url, body: body);
    debugPrintURL(response);
    if (response.statusCode == 200) {
      String data = response.body;
      debugPrintURL(response);

      return jsonDecode(data);
    } else {
      debugPrintURL(response);
      return "Error occurred: ${response.statusCode}";
    }
  }

  Future<String> postData(Map<String, dynamic> body) async {
    print("object");
    http.Response response = await http.post(url, body: body);
    debugPrintURL(response);
    if (response.statusCode == 200) {
      return "success";
    } else {
      debugPrintURL(response);
      return "Error occurred: ${response.statusCode}";
    }
  }

  Future<String> putData(Map<String, dynamic> body) async {
    http.Response response = await http.put(url, body: body);
    debugPrintURL(response);
    if (response.statusCode == 200) {
      return "success";
    } else {
      debugPrintURL(response);
      return "Error occurred: ${response.statusCode}";
    }
  }

  debugPrintURL(http.Response response) {
    print(response.request);
    print(response.statusCode);
    print(response.body);
  }
}
