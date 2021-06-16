import 'package:get/get.dart';
import 'package:getxapi/model/productmodel.dart';
import 'package:getxapi/util/apiService.dart';

class ProductController extends GetxController {
  var isloading = true.obs;
  var productlist = <Product>[].obs;

  @override
  void onInit() {
    fetchapidata();
    print(productlist);
    super.onInit();
  }

  void fetchapidata() async {
    try {
      isloading(true);
      print('here');
      var products = await ApiService.fetchprodeuct();
      if (products != null) {
        productlist.assignAll(products);
      }
    } finally {
      isloading(false);
    }
  }
}
