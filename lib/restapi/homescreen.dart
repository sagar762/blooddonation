//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:blooddonation/api/controller/mycontroller.dart';
//
// class RestApi extends StatelessWidget {
//   const RestApi({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetX<PostsController>(
//       init: PostsController(),
//       builder: (controller) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Posts'),
//           ),
//           body: controller.loading.value? Center(
//             child: CircularProgressIndicator(),
//           ):ListView(
//             children: controller.posts.map<Widget>((user) => ListTile(
//               leading: Text(user.id.toString()),
//               // title: Text(user.firstName.toString()),
//               // subtitle: Text(user.email.toString()),
//               // trailing: Text('User ${user.id}'),
//             )).toList(),
//           ),
//           floatingActionButton: FloatingActionButton(
//             child: Icon(Icons.add),
//             onPressed: (){
//               controller.sendPost();
//             },
//           ),
//         );
//       },
//     );
//   }
// }
