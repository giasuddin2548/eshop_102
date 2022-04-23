import 'package:final_project/models/hiveEntities/cart_model.dart';
import 'package:final_project/views/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_controller.dart';
import '../controllers/cart_controller.dart';

//ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  static const String routeName='/cart_screen';

  CartController controller=Get.put(CartController());

  CartScreen({Key? key}) : super(key: key);


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
          child: SingleChildScrollView(
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
                                  child:  Center(
                                    child: Obx(()=> Text(
                                      '${controller.cartData.length}',
                                      style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),)),
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
                  child: Obx(()=>controller.cartData.isNotEmpty?ListView.builder(
                      itemCount: controller.cartData.length,
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
                                  borderRadius: BorderRadius.circular(10),
                                  // image: DecorationImage(
                                  //   image: NetworkImage(url)
                                  // )
                                ),
                                child:  Image(
                                  image: NetworkImage(controller.cartData[index].productImage??'', ),
                                  fit: BoxFit.cover,
                                  height: height * 0.10,
                                  width: 80,
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
                                    children:  [
                                      Text(
                                        controller.cartData[index].productName??'',
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const Padding(
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
                                        "\$${controller.cartData[index].productPrice}X${controller.cartData[index].productQuantity}=${controller.calculateTotal(controller.cartData[index].productQuantity, controller.cartData[index].productPrice)}",
                                        style: const TextStyle(fontWeight: FontWeight.bold),
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
                                        onTap: (){
                                          controller.deleteDataByIndex(index);
                                        },
                                        child: const Icon(
                                            Icons.clear, size: 15
                                        ),
                                      ),
                                    ),
                                    const SizedBox(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all()
                                              //color: Color(0xFFe0f2f1)
                                            ),
                                            child: const Icon(Icons.remove, size: 18,),
                                          ),
                                          onTap: (){

                                            if(controller.cartData[index].productQuantity!>1){
                                              controller.updateCartItemByIndex(index, CartModel(
                                                productQuantity:controller.cartData[index].productQuantity!-1,
                                                productName: controller.cartData[index].productName!,
                                                productId: controller.cartData[index].productId!,
                                                productPrice: controller.cartData[index].productPrice!,
                                                productImage: controller.cartData[index].productImage!,
                                              ));
                                            }else{
                                              print('Can not remove');
                                            }


                                          },
                                        ),
                                        const SizedBox(width: 5,),
                                        Text("${controller.cartData[index].productQuantity}", style: const TextStyle(fontWeight: FontWeight.bold),),
                                        const SizedBox(width: 5,),
                                        InkWell(
                                          onTap: (){
                                            controller.updateCartItemByIndex(index, CartModel(
                                              productQuantity:controller.cartData[index].productQuantity!+1,
                                              productName: controller.cartData[index].productName!,
                                              productId: controller.cartData[index].productId!,
                                              productPrice: controller.cartData[index].productPrice!,
                                              productImage: controller.cartData[index].productImage!,
                                            ));
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black
                                            ),
                                            child: const Icon(Icons.add, size: 18, color: Colors.white,),
                                            // child: Center(child: Text('-')),
                                          ),
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
                  ):Container(
                      margin: const EdgeInsets.all(5),

                      height: height  * 0.40,
                      width: double.infinity,
                      color: Colors.white,
                      child: const Center(child: Text('No Cart Data')))),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Obx(()=>Text(
                          '${controller.selectedPromoName.value}(\$${controller.selectedPromoPrice.value})',
                          style: const TextStyle(color: Color(0xffDEDEDE)),
                        )),
                      ),
                      const SizedBox(),
                      InkWell(
                        onTap: (){
                          showBottomSheet(context);
                        },
                        child: Container(
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
                              children:  [
                                Obx(()=>Text('\$${controller.totalCartPrice.value}', style: const TextStyle(fontWeight: FontWeight.bold),)),

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
                            Text(
                              'Shipping',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children:  [
                                Obx(()=>Text('\$${controller.shppingCost.value}', style: const TextStyle(fontWeight: FontWeight.bold),)),

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
                              'Discount',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children:  [
                                Obx(()=>Text('\$${controller.selectedPromoPrice.value}', style: const TextStyle(fontWeight: FontWeight.bold),)),

                                const SizedBox(width: 2,),
                                const Text(
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
                              children:  [
                                Obx(()=>Text('(${controller.cartData.length} items)', style: const TextStyle(fontWeight: FontWeight.normal),)),
                                const SizedBox(width: 12,),
                                Obx(()=>Text('\$${controller.grandTotal.value}', style: const TextStyle(fontWeight: FontWeight.bold),)),
                                const SizedBox(width: 2,),
                                const Text(
                                  'USD',
                                  style: TextStyle(color: Color(0xffABAAB1), fontSize: 8),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(color: Colors.white,),
                      SizedBox(
                        height: height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Payable',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children:  [
                                Obx(()=>Text('\$${controller.payableAmount.value}', style: const TextStyle(fontWeight: FontWeight.bold),)),

                                const SizedBox(width: 2,),
                                const Text(
                                  'USD',
                                  style: TextStyle(color: Color(0xffABAAB1), fontSize: 8),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(color: Colors.white,),
                      InkWell(
                        onTap: (){
                          bool exist=Get.put(LoginController()).userIsLoginIn.value;

                          if(exist==false){
                            Get.toNamed(LoginScreen.routeName);
                          }else{
                            Get.toNamed(CheckOutScreen.routeName);
                          }
                        },

                        child: Container(
                          height: height * 0.09,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(child: Text('Proceed To Checkout', style: TextStyle(color: Colors.white),)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void showBottomSheet(BuildContext context) async {
    controller.getPromoCodes();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      builder: (context)=>Container(
        margin: const EdgeInsets.only(top: 100),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),

        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                // color: Colors.deepOrange,
                height: 60,
                width: Get.size.width,
                child: const Center(child: Text('Special Promo for you', style: TextStyle(fontSize: 20),)),),
              const Divider(height: 1,),
              Obx(()=>ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.promoList.length,
                itemBuilder: (c,i)=>ListTile(
                  onTap: (){
                    controller.selectedPromoPrice.value=controller.promoList[i].promoPrice;
                    controller.selectedPromoName.value=controller.promoList[i].promoCode;

                    controller.payableAmount.value=controller.grandTotal.value-double.parse(controller.selectedPromoPrice.value);

                    Get.back();
                  },
                  title: Text(controller.promoList[i].promoCode),
                  leading: Image.network(controller.promoList[i].promoImage, height: 80,width: 80,),
                  subtitle: const Text('22 april to 25 april'),
                ),

              )),

            ],
          ),
        ),

      ),

    );
  }
}


