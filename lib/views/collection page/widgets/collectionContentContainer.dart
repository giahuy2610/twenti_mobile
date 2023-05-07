// import 'package:flutter/material.dart';
//
// class CollectionContentContainer extends StatefulWidget {
//   const CollectionContentContainer({Key? key}) : super(key: key);
//
//   @override
//   State<CollectionContentContainer> createState() => _CollectionContentContainerState();
// }
//
// class _CollectionContentContainerState extends State<CollectionContentContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ColoredBox(
//           color:
//           Theme.of(context).own().defaultContainerColor,
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   // borderRadius: BorderRadius.circular(10),
//                   boxShadow: <BoxShadow>[
//                     BoxShadow(
//                       color:
//                       Colors.black45.withOpacity(0.3),
//                       blurRadius: 2,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 clipBehavior: Clip.hardEdge,
//                 child: Image.network(data.wallPaperPath!),
//               ),
//               if (data.logoImagePath != null)
//                 Align(
//                   child: Column(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context)
//                             .size
//                             .width *
//                             0.3,
//                         height: MediaQuery.of(context)
//                             .size
//                             .width *
//                             0.3,
//                         decoration: BoxDecoration(
//                           borderRadius:
//                           BorderRadius.circular(20),
//                           boxShadow: <BoxShadow>[
//                             BoxShadow(
//                               color: Colors.black45
//                                   .withOpacity(0.3),
//                               blurRadius: 2,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         transform:
//                         Matrix4.translationValues(
//                             0.0,
//                             -MediaQuery.of(context)
//                                 .size
//                                 .width *
//                                 0.15,
//                             0.0),
//                         child: Image.network(
//                           data.logoImagePath!,
//                         ),
//                       ),
//                       Text(
//                         data.nameCollection,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 28,
//                             letterSpacing: 5),
//                       ),
//                     ],
//                   ),
//                 ),
//               if (data.description != null)
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: Theme.of(context)
//                           .own()
//                           .defaultVerticalPaddingOfScreen),
//                   child: description(data.description!),
//                 ),
//             ],
//           ),
//         ),
//         productListView(data.products, isGridView)
//       ],
//     );
//   }
// }
