// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/presentation/resources/app_logo.dart';
// import '../../../auth/presentation/screen/login_screen.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //TODO: check for authenticity

//     Future.delayed(const Duration(milliseconds: 2000), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const SigninPage()));
//     }
//     );

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//            // color: primaryColor,
//             height: double.infinity,
//             width: double.infinity,
//             child: Center(
//               child: Builder(
//                 builder: (context) => Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SigninPage()));
//                     },
//                     child: const AppLogo(
//                       aspectRatio: 7,
//                     ),
//                   ),
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }