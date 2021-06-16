import 'package:flutter/material.dart';
import 'package:getxapi/controller/productController.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ProductController controller =Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Obx(() {
        if (controller.isloading.value) {
          return Center(child: CircularProgressIndicator(),);
        }else{
          return ListView.separated(itemCount: controller.productlist.length,itemBuilder: (_,index){
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(controller.productlist[index].imageLink.toString()),
              ),
              title: Text(controller.productlist[index].name.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              subtitle: Text(controller.productlist[index].description.toString(),),
            );
          }, separatorBuilder: (BuildContext context, int index) { return Divider(); },);
        }
      }),
    );
  }
}
