import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/data/api/ProductApi.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_State.dart';
import 'package:untitled1/domain.cubit.checkConnection/ProductState.dart';
import 'package:untitled1/models/Order.dart';
import 'package:untitled1/models/Product.dart';

class ProductCubit extends Cubit<ProductState>{
  late StreamSubscription<List<Product>> subscription;
  ProductCubit() : super(ProductsLoading()){
    subscription=ProductApi().getProduct().listen((p) {
      emit(ProductsSuccess(p));
    })..onError((e){
      emit(ProductsFailed(e));
    });
  }
   @override
   Future<void> close()async
   {
     await subscription.cancel();
     super.close();
    }
}

class OrderCubit extends Cubit<ProductState>{
  late StreamSubscription<List<Order>> subscription;
  OrderCubit() : super(OrdersLoading()){
    subscription=OrderApi().getOrders().listen((O) {
      emit(OrdersSuccess(O));
    })..onError((e){
      emit(OrdersFailed(e));
    });
  }
  @override
  Future<void> close()async{
    await subscription.cancel();
    super.close();
  }
}
