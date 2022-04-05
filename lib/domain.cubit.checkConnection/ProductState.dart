import 'package:untitled1/domain.cubit.checkConnection/DataProduct_State.dart';
import 'package:untitled1/models/Order.dart';
import 'package:untitled1/models/Product.dart';

abstract class ProductState{
}


//AddProductStream
class ProductsLoading extends ProductState{}
class ProductsSuccess extends ProductState{
  final List<Product> products;
  ProductsSuccess(this.products);
}

class ProductsFailed extends ProductState {
  final String msg;

  ProductsFailed(this.msg);
}

//AddOrderStream
class OrdersLoading extends ProductState{}
class OrdersSuccess extends ProductState{
  final List<Order> Orders;
  OrdersSuccess(this.Orders);
}

class OrdersFailed extends ProductState {
  final String msg;

  OrdersFailed(this.msg);
}

