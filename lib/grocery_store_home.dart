import 'package:flutter/material.dart';
import 'package:grocery_store_app/grocery_store_bloc.dart';
import 'package:grocery_store_app/grocery_provider.dart';

import 'package:grocery_store_app/grocery_store_list.dart';

import 'grocery_store_cart.dart';

const backgroundColor = Color(0XFFF6F5F2);
const cartBarHeight = 100.0;
const _panelTransition = Duration(milliseconds: 500);

class GroceryStoreHome extends StatefulWidget {
  const GroceryStoreHome({super.key});

  @override
  State<GroceryStoreHome> createState() => _GroceryStoreHomeState();
}

class _GroceryStoreHomeState extends State<GroceryStoreHome> {
  final bloc = GroceryStoreBLoC();

  void _onVerticalGesture(DragUpdateDetails details) {
    print(details.primaryDelta);
    if (details.primaryDelta! < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta! > 12) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return 0.0;
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
    return 0.0;
  }

  double _getTopForAppBar(GroceryState state) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, _) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  AnimatedPositioned(
                    curve: Curves.decelerate,
                    duration: _panelTransition,
                    left: 0,
                    right: 0,
                    top: _getTopForWhitePanel(bloc.groceryState, size),
                    height: size.height - kToolbarHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          30,
                        ),
                        bottomRight: Radius.circular(
                          30,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: GroceryStoreList(),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.decelerate,
                    duration: _panelTransition,
                    left: 0,
                    right: 0,
                    top: _getTopForBlackPanel(bloc.groceryState, size),
                    height: size.height - kToolbarHeight,
                    child: GestureDetector(
                      onVerticalDragUpdate: _onVerticalGesture,
                      child: Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: AnimatedSwitcher(
                                  duration: _panelTransition,
                                  child: SizedBox(
                                    height: kToolbarHeight,
                                    child:
                                        bloc.groceryState == GroceryState.normal
                                            ? Row(
                                                children: [
                                                  Text(
                                                    'Cart',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Row(
                                                          children:
                                                              List.generate(
                                                            bloc.cart.length,
                                                            (index) => Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                              child: Stack(
                                                                children: [
                                                                  Hero(
                                                                    tag:
                                                                        'list_${bloc.cart[index].product.name}details',
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor: Color.fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          0.8),
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                        bloc
                                                                            .cart[index]
                                                                            .product
                                                                            .image,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    right: 0,
                                                                    child:
                                                                        CircleAvatar(
                                                                      radius:
                                                                          10,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      child:
                                                                          Text(
                                                                        bloc.cart[index]
                                                                            .quantity
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        const Color(0xFFF4C459),
                                                    child: Text(
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                      bloc
                                                          .totalCartElements()
                                                          .toString(),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : const SizedBox.shrink(),
                                  ),
                                ),
                              ),
                              Expanded(child: GroceryStoreCart()),
                            ],
                          )),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.decelerate,
                    duration: _panelTransition,
                    left: 0,
                    right: 0,
                    top: _getTopForAppBar(bloc.groceryState),
                    child: _AppBarGrocery(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  const _AppBarGrocery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: backgroundColor,
      child: Row(
        children: [
          const BackButton(
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Fruits and Vegetables',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
    );
  }
}
