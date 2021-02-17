import 'package:flutter/material.dart';
import '../views/user/http_post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Center(
        //     child: Text(
        //       "Saachiwears",
        //       style: TextStyle(color: Colors.black),
        //     ),
        //   ),
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back_outlined,
        //       color: Colors.black,
        //     ),
        //     onPressed: () => Get.back(),
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: Icon(
        //         Icons.person,
        //         color: Colors.black,
        //       ),
        //       onPressed: () => Get.to(RegistrationPage()),
        //     ),
        //   ],
        // ),
        body: SendDataHttpPost(),
        // Column(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.all(16),
        //       child: Row(
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(
        //               right: 30,
        //             ),
        //             child: IconButton(
        //               icon: Icon(
        //                 Icons.person,
        //                 color: Colors.black,
        //               ),
        //               onPressed: () => Get.to(RegistrationPage()),
        //             ),
        //           ),
        //           Expanded(
        //               child: Text(
        //             "Saachiwears.com",
        //             style: TextStyle(
        //                 fontSize: 22.0,
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.bold),
        //           )),
        //           IconButton(
        //               icon: Icon(
        //                 Icons.view_list,
        //                 color: Colors.black,
        //               ),
        //               onPressed: null),
        //           IconButton(
        //               icon: Icon(
        //                 Icons.grid_view,
        //                 color: Colors.black,
        //               ),
        //               onPressed: null),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       child: Obx(() {
        //         if (productController.isLoading.value) {
        //           return Center(
        //             child: CircularPercentIndicator(
        //               radius: 50.0,
        //               lineWidth: 5.0,
        //               animation: true,
        //               percent: 0.7,
        //               circularStrokeCap: CircularStrokeCap.round,
        //               progressColor: Colors.purple,
        //             ),
        //           );
        //         } else {
        //           return StaggeredGridView.countBuilder(
        //               crossAxisCount: 2,
        //               crossAxisSpacing: 5.0,
        //               mainAxisSpacing: 5.0,
        //               itemBuilder: (context, index) {
        //                 return ProductTile(
        //                     productController.productList[index]);

        //                 // Container(
        //                 //   height: 200,
        //                 //   width: 200,
        //                 //   color: Colors.blueAccent,
        //                 // );
        //               },
        //               staggeredTileBuilder: (index) => StaggeredTile.fit(1));
        //         }
        //       }),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
