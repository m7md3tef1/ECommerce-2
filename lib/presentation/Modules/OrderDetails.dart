import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/domain.cubit.checkConnection/ProductCubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/ProductState.dart';
import 'package:untitled1/models/Product.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';

import '../../models/Order.dart';
import '../../models/Order.dart';

class OrderDetails extends StatefulWidget {
  Product? product;
  OrderDetails({Key? key, this.product}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  List<Product> product = [
    Product(
      imgurl: 'images/grill.png',
      name: 'mix seafood',
      price: '115',
    ),
    Product(
      imgurl: 'images/Seafood.png',
      name: 'mix grill',
      price: '115',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
              child: SafeArea
                (
                child: InkWell(
                  onTap: (){
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: const Icon(
                                Icons.question_mark_outlined,
                                color: Colors.black,
                              ),
                              prefixIcon: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.west,
                                    color: Colors.black,
                                    size: 20,
                                  )),
                              label: const Center(
                                child: Text(
                                  'Order Details',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'Heaven\'s Food',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.timer_outlined,
                                  color: Colors.lightGreen,
                                  size: 30,
                                ),
                                Text(
                                  '  Delivery / As Soon As Possible',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_on_sharp,
                                  color: Colors.lightGreen,
                                  size: 30,
                                ),
                                Text(
                                  '  Hay Elgamaa Mansoura Egypt',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 350,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4.0, 4, 4, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Your Order',
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              if (state is OrdersSuccess)
                                Column(
                                  children: [
                                    Container(
                                      height: 210,
                                      width: double.infinity,
                                      child: ListView.builder(
                                          itemCount: state.Orders.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            final Order = state.Orders[index];
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Badge(
                                                position: const BadgePosition(top: -10, end: -1),
                                                badgeColor: Colors.red,
                                                borderRadius: BorderRadius.circular(2),
                                                badgeContent: InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return SimpleDialog(
                                                            title: const Text('Sure Delete'),
                                                            children: [
                                                              SimpleDialogOption(
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: const Text('Cancel')),
                                                              ),
                                                              SimpleDialogOption(
                                                                child: InkWell(
                                                                    onTap: () async {
                                                                      await FirebaseFirestore
                                                                          .instance
                                                                          .collection('Order')
                                                                          .doc(Order.id)
                                                                          .delete();
                                                                      Navigator.pop(context);
                                                                      showToast(
                                                                          msg: '${Order.name}'
                                                                              ' '
                                                                              'تم حذف المنتج',
                                                                          state: ToastedStates
                                                                              .SUCCESS);
                                                                    },
                                                                    child: const Text('Delete')),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.fromLTRB(
                                                                  10, 5, 10, 5),
                                                          child: Container(
                                                              height: 80,
                                                              width: 80,
                                                              child: Image.network(
                                                                Order.imgurl,
                                                                fit: BoxFit.cover,
                                                              )),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              Order.name.toString() ,
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight.bold),
                                                            ),
                                                            Text(
                                                              Order.price.toString() ,
                                                              style: const TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Icon(
                                                          Icons.indeterminate_check_box,
                                                          size: 22,
                                                          color: Colors.grey[600],
                                                        ),
                                                        const Text(
                                                          ' 1 ',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        const Icon(
                                                          Icons.add_box,
                                                          size: 22,
                                                          color: Colors.lightGreen,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            showDialog(
                                                                context: context,
                                                                builder: (context) {
                                                                  return SimpleDialog(
                                                                    title: const Text('Sure Delete'),
                                                                    children: [
                                                                      SimpleDialogOption(
                                                                        child: InkWell(
                                                                            onTap: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: const Text('Cancel')),
                                                                      ),
                                                                      SimpleDialogOption(
                                                                        child: InkWell(
                                                                            onTap: () async {
                                                                              await FirebaseFirestore
                                                                                  .instance
                                                                                  .collection('Order')
                                                                                  .doc(Order.id)
                                                                                  .delete()
                                                                                  .then((value) async {
                                                                                state.Orders[index];showToast(msg: 'Done', state: ToastedStates.SUCCESS);
                                                                              }).catchError((onError) {
                                                                                showToast(msg: onError.toString(), state: ToastedStates.ERROR);
                                                                              });
                                                                              Navigator.pop(context);
                                                                              showToast(msg: '${Order.name}' '  ''تم حذف المنتج', state: ToastedStates.SUCCESS);

                                                                            },
                                                                            child: const Text('Delete')),
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          child: Icon(
                                                            Icons.delete,
                                                            size: 30,
                                                            color: Colors.grey[600],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Subtotal',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  '230 EGP',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Delivery',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 21,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: const Center(
                                                    child: Text(
                                                  'free',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Total',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  '230 EGP',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              else if (state is OrdersFailed)
                                Center(
                                  child: Text(state.msg),
                                )
                              else if (state is OrdersLoading)
                                Container(
                                  height: 210,
                                  width: double.infinity,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              //else
                              //  const Center(child: Text('No Order'))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: TextButton1(
                          name: 'Place Order',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
