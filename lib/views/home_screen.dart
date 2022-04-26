
import 'package:badges/badges.dart';
import 'package:final_project/controllers/all_controller.dart';
import 'package:final_project/models/hiveEntities/cart_model.dart';
import 'package:final_project/utils/apis.dart';
import 'package:final_project/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

///https://stackoverflow.com/questions/60068435/what-is-null-safety-in-dart
class HomeScreen extends StatelessWidget {
  static const routeName='/home_screen';

  final HomeScreenController _controller=Get.put(HomeScreenController());
  final CartController _cartController=Get.put(CartController());




  // String name2=null;
  String? name1;
  late String name3;


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: _customScrollView(context),




    );
  }

  _customScrollView(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          title: const Text('Eshop'),

          actions: [
              IconButton(onPressed: (){

                Get.toNamed(CartScreen.routeName);

              }, icon: Obx(()=>Badge(
                  badgeContent:  Text(_cartController.cartData.length.toString(), style: const TextStyle(fontSize: 12),),
                  badgeColor: Colors.white,
                  showBadge: _cartController.cartData.isNotEmpty?true:false,
                  child: const Icon(Icons.add_shopping_cart)) )),

              GetBuilder<ThemeController>(builder: (theme) {
              return IconButton(onPressed: (){
                theme.changeMyTheme();
              }, icon: theme.isDark==false?const Icon(Icons.dark_mode_outlined):const Icon(Icons.light_mode_outlined));

            } ,)




          ],

        ),
        SliverToBoxAdapter(

          child: Container(
            child: _sliderWidget(context),
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
          ),
          
    
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 30,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Categories', style: TextStyle(fontSize: 18),),
                Text('View All', style: TextStyle(fontSize: 14),)
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            height: 120,
            child: Obx(()=>ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _controller.categoryList.length,
                itemBuilder: (c, i)=>Container(

                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                    // image: DecorationImage(image: NetworkImage(_controller.myEshopCategoryData.value.data![i].image??'Name not found'))
                  ),
                  height: 120,
                  width: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 100,

                        decoration: BoxDecoration(
                           image: DecorationImage(image: NetworkImage('${Apis.categoryImageUrl}${_controller.categoryList[i].image??'Name not found'}'))
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 100,

                        child: Center(child: Text(_controller.categoryList[i].name??'Name not found')),
                      ),
                      // Center(child: Text(_controller.myEshopCategoryData.value.data![i].name??'Name not found'))
                    ],
                  ),
                  // child: Center(child: Text(name1!)),
                  // child: Center(child: Text(name1??'username not found')),

                ))),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 30,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  const [
                Text('New Arrival', style: TextStyle(fontSize: 18),),
                Visibility(
                    visible: false,
                    child: Text('View All', style: TextStyle(fontSize: 14),))
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            height: 220,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (c, i)=>InkWell(
                  onTap: (){

                 Get.find<CartController>().insertCartData(CartModel(productId: '$i', productImage: 'https://static.toiimg.com/photo/msid-87930581/87930581.jpg?211826', productName: 'Item-1', productQuantity: 1, productPrice: 10.5, ));



                  },
                  child: Container(

                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 220,
                    width: 180,
                    child: Center(child: Text('$i')),

                  ),
                )),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 30,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  const [
                Text('Popular Products', style: TextStyle(fontSize: 18),),
                Visibility(
                    visible: false,
                    child: Text('View All', style: TextStyle(fontSize: 14),))
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(bottom: 5),
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Obx(()=>GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.categoryList.length,
                    itemBuilder: (c, i)=>Container(

                      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 220,
                      width: 180,
                      //child: Center(child: Text('$i')),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            width: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage('${Apis.categoryImageUrl}${_controller.categoryList[i].image??'Name not found'}'))
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 50,
                            child: Center(child: Text(_controller.categoryList[i].name??'Name not found')),
                          )
                        ],
                      ),

                    )))),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(height: 5,),
        ),

      ],
    );
  }

  _shimmerEffect(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          title: const Text('Eshop'),
          actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart))],

        ),
        SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Shimmer.fromColors(child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
                baseColor: Colors.grey,
                highlightColor: Colors.white

            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 30,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
            child: Shimmer.fromColors(child: Container(

              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),

                baseColor: Colors.grey,
                highlightColor: Colors.white
            ),

          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            height: 120,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (c, i)=>Shimmer.fromColors(

                  child: Container(

                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 120,
                    width: 100,


                  ),

                    baseColor: Colors.grey,
                    highlightColor: Colors.white
                )),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 30,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
            child: Shimmer.fromColors(child: Container(

              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),

                baseColor: Colors.grey,
                highlightColor: Colors.white
            ),

          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            height: 220,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (c, i)=>Shimmer.fromColors(
                  child: Container(

                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 220,
                    width: 180,


                  ),

                    baseColor: Colors.grey,
                    highlightColor: Colors.white
                )),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 30,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
            child: Shimmer.fromColors(child: Container(

              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),

                baseColor: Colors.grey,
                highlightColor: Colors.white
            ),

          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(bottom: 5),
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (c, i)=>Shimmer.fromColors(
                      child: Container(

                        margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 220,
                        width: 180,


                      ),
                        baseColor: Colors.grey,
                        highlightColor: Colors.white
                    ))),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(height: 5,),
        ),

      ],
    );
  }


  Widget _sliderWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Obx(()=>_controller.isLoading==true?Container(): CarouselSlider.builder(

            itemCount: _controller.bannerData.value.banners?.length??0,
            itemBuilder: (context, index, realIndex) => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/3,
              child: Image.network('${Apis.bannerImageUrl}${_controller.bannerData.value.banners![index].image??''}',fit: BoxFit.cover, ),
            ),

            options: CarouselOptions(
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.width/3,
                viewportFraction: 1,
                disableCenter: true,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (index, reason) {
                  _controller.sliderCurrentPosition.value=index;

                  // setState(() {
                  //   sliderCurrentIndex = index;
                  // });

                  // print(index);
                  // print(reason);
                }
            ),

          )),
          Positioned(
              bottom: 10,
              left: (MediaQuery.of(context).size.width-25)/2,
              child: Obx(()=>_controller.isLoading==true?Container(): Row(
                children: _controller.bannerData.value.banners!.map((e) {
                  var currentIndex=_controller.bannerData.value.banners?.indexOf(e);
                  return Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 10,
                    width: 10,
                    decoration:  BoxDecoration(
                        color: _controller.sliderCurrentPosition.value==currentIndex?Colors.amber:Colors.black,
                        borderRadius: const BorderRadius.all(Radius.circular(10))

                    ),

                  );
                }).toList(),
              ))

          )
        ],
      ),
    );
  }



}

