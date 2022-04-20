import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName='/cart_screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - kToolbarHeight;
    return Scaffold(
      //appBar: AppBar(title: const Text('Cart Item'),),

      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(5),
          // color: Color(0xffEBEAEF),
          decoration: BoxDecoration(
            color: const Color(0xffEBEAEF),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              SizedBox(
                //color: Colors.blue,
                height: height  * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)
                    ),
                    const Text(
                      'Shopping Bag',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(
                                Icons.shopping_bag
                            ),
                          ),
                          Positioned(
                              top:.1,
                              //bottom: 0,
                              right: .1,
                              // left: ,
                              child: Container(
                                height: 17,
                                width: 17,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: const Center(
                                  child: Text(
                                    '4',
                                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                //color: Colors.red,
                height: height  * 0.40,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 22),
                        height: height * 0.10,
                        //color: Colors.red,
                        child: Row(
                          children: [
                            Container(
                              height: height * 0.10,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Image(
                                  image: NetworkImage('https://t3.ftcdn.net/jpg/03/86/56/16/360_F_386561618_OuKaHRDxoD4iZ6pGqvabHEE8bYjfGENV.jpg')
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: height * 0.10,
                              width: MediaQuery.of(context).size.width * 0.33,
                              //color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2.0, bottom: 3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Facial Cleanser',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        'Size: 7.60 fl oz / 225ml',
                                        style: TextStyle(
                                            color: Color(0xffC6C5CB),
                                            fontSize: 9
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "\$19.98",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.10,
                              width: MediaQuery.of(context).size.width * 0.26,
                              //color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: const Icon(
                                          Icons.clear, size: 15
                                      ),
                                    ),
                                  ),
                                  const SizedBox(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all()
                                          //color: Color(0xFFe0f2f1)
                                        ),
                                        child: const Icon(Icons.remove, size: 18,),
                                      ),
                                      const SizedBox(width: 5,),
                                      const Text('02', style: TextStyle(fontWeight: FontWeight.bold),),
                                      const SizedBox(width: 5,),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black
                                        ),
                                        child: const Icon(Icons.add, size: 18, color: Colors.white,),
                                        // child: Center(child: Text('-')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                ),
              ),

              const SizedBox(height: 10,),

              Container(
                //color: Colors.grey,
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: height  * 0.09,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Promo Code',
                        style: TextStyle(color: Color(0xffDEDEDE)),
                      ),
                    ),
                    const SizedBox(),
                    Container(
                      height: height * 0.06,
                      width: 85,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20,),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                //color: Colors.brown,
                //height: height  * 0.25,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subtotal',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: const [
                              Text('\$45.99', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 2,),
                              Text(
                                'USD',
                                style: TextStyle(color: Color(0xffABAAB1), fontSize: 8),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white,),
                    SizedBox(
                      height: height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Shipping',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: const [
                              Text('\$4.99', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 2,),
                              Text(
                                'USD',
                                style: TextStyle(color: Color(0xffABAAB1), fontSize: 8),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white,),
                    SizedBox(
                      height: height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Bag Total',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: const [
                              Text('(4 items)'),
                              SizedBox(width: 12,),
                              Text('\$45.99', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 2,),
                              Text(
                                'USD',
                                style: TextStyle(color: Color(0xffABAAB1), fontSize: 8),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(child: Text('Proceed To Checkout', style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


