// import 'package:flutter/material.dart';
// import 'package:movie_moa/screens/user_view_page/user_view_page.dart';

// class Confirm_Button extends StatelessWidget {
//   //const Confirm_Button({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final data = MediaQuery.of(context);
//     final width = data.size.width;
//     final height = data.size.height;
//     return Center(
//       child: RawMaterialButton(
//         child: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 229, 190, 236),
//             borderRadius: BorderRadius.circular(width * 0.1),
//             //shape: BoxShape.circle,
//           ),
//           margin: EdgeInsets.fromLTRB(width * 0.3, 0, width * 0.3, 0),
//           child: Text('Confirm',
//           style: TextStyle(
//               fontSize: width * 0.033,
//               color: Colors.black,
//             )),
//         ),
//         onPressed: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => User_View_Page())),
//       ),
//     );
//   }
// }
