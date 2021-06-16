import 'package:getxapi/model/productmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var https = http.Client();

  static Future<List<Product>?> fetchprodeuct() async {
    var response = await https.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));
    if (response.statusCode == 200) {
      var jsonbody = response.body;
      print(jsonbody);
      return productFromJson(jsonbody);
    }
  }
}
