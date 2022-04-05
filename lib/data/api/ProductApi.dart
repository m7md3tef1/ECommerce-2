import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/models/Order.dart';
import 'package:untitled1/models/Product.dart';

class ProductApi {
  const ProductApi();
  Stream<List<Product>> getProduct() {
    final ref = FirebaseFirestore.instance.collection('Product');

    return ref.snapshots().map((event) {
      final products = <Product>[];
      for (var doc in event.docs) {
        final product = Product.fromJson(doc.data());
        products.add(product);
      }
      return products;
    });
  }
}
class OrderApi {
  const OrderApi();
  Stream<List<Order>> getOrders() {
    final ref = FirebaseFirestore.instance.collection('Order');

    return ref.snapshots().map((event) {
      final orders = <Order>[];
      for (var doc in event.docs) {
        final order = Order.fromJson(doc.data());
        orders.add(order);
      }
      return orders;
    });
  }
}
