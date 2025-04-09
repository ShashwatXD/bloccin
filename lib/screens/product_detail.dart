// import 'package:blocbase/screens/productscreen.dart';
// import 'package:flutter/material.dart';

// class ProductDetailScreen extends StatelessWidget {
//   const ProductDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final product = ModalRoute.of(context)!.settings.arguments as Product;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('📦 ${product.title.split(" ").take(2).join(" ")}'),
//         backgroundColor: Colors.blueGrey.shade700,
//         foregroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.blueGrey.shade50,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Image.network(
//                 product.image,
//                 height: 250,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               product.title,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 12),
//             const Divider(),
//             const SizedBox(height: 8),
//             Text(
//               'This is a sample description. You can extend the Product model to include more details like price, rating, etc.',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey.shade800,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
