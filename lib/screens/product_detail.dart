import 'package:blocbase/models/productmodel.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    
    final primaryTeal = Color(0xFF3BA09D);
    final darkTeal = Color(0xFF2A7A77);   
    final lightTeal = Color(0xFFE6F4F3); 
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('${product.title.split(" ").take(2).join(" ")}'),
        backgroundColor: Colors.white.withOpacity(0.9),
        foregroundColor: darkTeal,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, color: darkTeal),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.favorite_border, color: darkTeal),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to wishlist'),
                  backgroundColor: primaryTeal,
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            color: lightTeal.withOpacity(0.5),
            child: Stack(
              children: [
                Center(
                  child: Hero(
                    tag: 'product-${product.id}',
                    child: Image.network(
                      product.image,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text(
                            product.category.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          backgroundColor: primaryTeal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: lightTeal,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "₹ ${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: darkTeal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.8),
                        height: 1.3,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    
                    const SizedBox(height: 24),
                    
                    Text(
                      "Product Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darkTeal,
                      ),
                    ),
                    
                    const SizedBox(height: 1),
                    Divider(color: lightTeal),
                    const SizedBox(height: 1),
                                        Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.7),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    
                    const SizedBox(height: 16),
                                        ExpansionTile(
                      title: Text(
                        "Shipping Information",
                        style: TextStyle(
                          color: darkTeal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      collapsedIconColor: primaryTeal,
                      iconColor: primaryTeal,
                      childrenPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        ListTile(
                          leading: Icon(Icons.local_shipping, color: primaryTeal),
                          title: Text("Free shipping available"),
                          subtitle: Text("Delivery within 3-5 business days"),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                    
                    ExpansionTile(
                      title: Text(
                        "Return Policy",
                        style: TextStyle(
                          color: darkTeal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      collapsedIconColor: primaryTeal,
                      iconColor: primaryTeal,
                      childrenPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        ListTile(
                          leading: Icon(Icons.replay, color: primaryTeal),
                          title: Text("30-day return policy"),
                          subtitle: Text("Full refund available on unused items"),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
            bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: lightTeal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.share,
                color: primaryTeal,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Coming soon!'),
                      backgroundColor: primaryTeal,
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryTeal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}