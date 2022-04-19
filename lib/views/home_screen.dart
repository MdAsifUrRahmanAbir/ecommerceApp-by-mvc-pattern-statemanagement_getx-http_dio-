import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project_b102/controller/home_screen_controller.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  //final HomeScreenController _controller = HomeScreenController();
  final HomeScreenController _controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    //_controller.getEshopCategories();
    print('Build Method Called');
    return _mySecondScaffold(context);

  }



  _mySecondScaffold(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.6),
      //drawer: Drawer(),
      body: Obx( ()=> _controller.isLoading == false? _shimmerEffect(context): _shimmerEffect(context) )
    );
  }




  _customeScrollView(BuildContext context) {
    return CustomScrollView(

      slivers: [
        SliverAppBar(
          title: Text('EShop'),
          centerTitle: true,
          //pinned: true,
          floating: true,
          actions: [
            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),

        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            height: 200,
            color: Colors.white,
            child: Text('SLIDER'),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.bottomLeft,
              height: 30,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Categories', style: TextStyle(fontSize: 18), textAlign: TextAlign.start,),
                  Text('View All', style: TextStyle(fontSize: 14), textAlign: TextAlign.start,),
                ],
              )
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 120,
            //color: Colors.red,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,item) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 3),
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),

                    child: Text('${item+1}'),
                  );
                }
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.bottomLeft,
              height: 30,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('New Arrival', style: TextStyle(fontSize: 18), textAlign: TextAlign.start,),
                  Visibility(
                    visible: false,
                    child: Text('View All', style: TextStyle(fontSize: 14), textAlign: TextAlign.start,),)
                ],
              )
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 220,
            //color: Colors.red,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,item) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 3),
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),

                    child: Text('${item+1}'),
                  );
                }
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.bottomLeft,
              height: 30,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Popular Product', style: TextStyle(fontSize: 18), textAlign: TextAlign.start,),
                  Visibility(
                    visible: false,
                    child: Text('View All', style: TextStyle(fontSize: 14), textAlign: TextAlign.start,),)
                ],
              )
          ),
        ),
        SliverToBoxAdapter(

            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.white,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,item) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 5, right: 5, top: 3),
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(5),
                        ),

                        child: Text('${item+1}'),
                      );
                    }
                ),

              ),
            )

        ),

        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        )
      ],
    );
  }

  /*
  child: Shimmer.fromColors(
              child: Text('SLIDER', style: TextStyle(fontSize: 30),),
              baseColor: Colors.white,
              highlightColor: Colors.grey,

            ),
   */

  _shimmerEffect(BuildContext context) {
    return CustomScrollView(

      slivers: [
        SliverAppBar(
          title: Text('EShop'),
          centerTitle: true,
          //pinned: true,
          floating: true,
          actions: [
            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),

        SliverToBoxAdapter(
          child: Shimmer.fromColors(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                color: Colors.grey.withOpacity(.1),
                child: Shimmer.fromColors(
                  child: const Text('SLIDER', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                  baseColor: Colors.blue,
                  highlightColor: Colors.orangeAccent,

                ),
              ),
              baseColor: Colors.grey.withOpacity(.3),
              highlightColor: Colors.white.withOpacity(.3)
          )
        ),
        SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.centerLeft,
              height: 30,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: const Text('Categories', style: TextStyle(fontSize: 18), textAlign: TextAlign.start,)),

                  Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Text('View All', style: TextStyle(fontSize: 14), textAlign: TextAlign.start,),)
                ],
              ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 120,
            //color: Colors.red,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,item) {
                  return Shimmer.fromColors(
                    highlightColor: Colors.grey,
                    baseColor: Colors.white,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 3),
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(5),
                      ),

                    ),
                  );
                }
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.bottomLeft,
              height: 30,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.white,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: const Text('New Arrival', style: TextStyle(fontSize: 18), textAlign: TextAlign.start,)),

                Visibility(
                  visible: false,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Text('View All', style: TextStyle(fontSize: 14), textAlign: TextAlign.start,),),
                )
              ],
            ),

          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 220,
            //color: Colors.red,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,item) {
                  return Shimmer.fromColors(
                    highlightColor: Colors.grey,
                    baseColor: Colors.white,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 3),
                      height: 220,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(5),
                      ),

                    ),
                  );
                }
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.bottomLeft,
              height: 30,
              margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.white,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: const Text('Popular Product', style: TextStyle(fontSize: 18), textAlign: TextAlign.start,)),

                Visibility(
                  visible: false,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Text('View All', style: TextStyle(fontSize: 14), textAlign: TextAlign.start,),),
                )
              ],
            ),

          ),
        ),
        SliverToBoxAdapter(

            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              color: Colors.white,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,item) {
                      return Shimmer.fromColors(
                        highlightColor: Colors.grey,
                        baseColor: Colors.white,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 5, right: 5, top: 3),
                          height: 200,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(5),
                          ),

                        ),
                      );
                    }
                ),

              ),
            )

        ),

        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        )
      ],
    );
  }







  /// http data collections
  _myFirstScaffold(BuildContext context){
    return Scaffold(
          appBar: AppBar(
            title: Obx(
                  () => Text('Page No: ${_controller.myValue}'),
            ),
            centerTitle: true,

            // actions: [
            //   IconButton(onPressed: () {
            //     _controller.increment();
            //   }, icon: Obx(
            //         () => Text('${_controller.myValue}'),
            //   ),)
            // ],
          ),

          body: Obx( () => ListView.builder(
            itemCount: _controller.picSumModelList.length,
            itemBuilder: (c, i) {
              return  ListTile(
                  title: Text('${i+1} :  ${_controller.picSumModelList[i].id.toString()}'),
                  subtitle: Text(_controller.picSumModelList[i].author.toString()),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('${_controller.picSumModelList[i].downloadUrl}'),
                  ),
              );
            },

          ),),

          bottomNavigationBar: Container(
            height: 50,
            color: Colors.transparent,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (c,i) {
                return InkWell(
                    onTap: (){
                      _controller.getMyValue(i+1);
                      _controller.getPaginationData(pageNo: i+1);
                      EasyLoading.showToast('Page: ${i+1}', duration: const Duration(seconds: 3), toastPosition: EasyLoadingToastPosition.bottom);
                    },
                    child: Chip(label: Text('${i+1}')));
                }
            ),
          ),
        );
  }

}
