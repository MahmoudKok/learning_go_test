// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_launcher/url_launcher.dart';

// extension LinksExtension on String {
//   Widget toClickableLink(TextStyle? style) {
//     return InkWell(
//       splashColor: Colors.transparent,
//       onTap: () async {
//         if (await canLaunchUrl(Uri.parse(this))) {
//           await launchUrl(Uri.parse(this));
//         }
//       },
//       child: Text(
//         this,
//         style: style != null
//             ? style.copyWith(
//                 decoration: TextDecoration.underline,
//               )
//             : TextStyle(
//                 color: Colors.blue.shade600,
//                 fontSize: 12.sp,
//                 decoration: TextDecoration.underline,
//               ),
//       ),
//     );
//   }
// }
