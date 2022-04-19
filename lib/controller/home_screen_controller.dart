import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:project_b102/model/JsonHolderData.dart';
import 'package:project_b102/model/PicSumModel.dart';
import 'package:project_b102/model/eshop_model/category_model/EshopCategoryModel.dart';
import 'package:project_b102/model/user.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:project_b102/utils/apis.dart';

class HomeScreenController extends GetxController {
  var myValue = 1.obs;    ///.........................
  var appBarName = 'Home Screen'.obs;
  var cgpa = 0.0.obs;
  var myUserList = [].obs;
  var myMap = {}.obs;
  var isActive = false.obs;
  var userModel = <UserModel> [].obs;
  List<String> listString= [];
  var name = <String>['s'].obs;
  var number = <int>[1,2].obs;


  var postList = <JsonHolderData>[].obs;
  var picSumModelList = <PicSumModel>[].obs;

  ///    Eshop categories all data collection by this get x mixin model creating
  RxObjectMixin<EshopCategoryModel> myEshopCategoryData = EshopCategoryModel().obs;

  var isLoading = false.obs;


  void getMyValue(int i){
    myValue.value = i;
  }
  void increment(){
    myValue.value++;
    myUserList.add('item-${myValue.value}');
  }

  void removeItem(int index){
    myUserList.removeAt(index);
  }

  void updateItem(int i){
    myUserList[i] = 'Abir';
  }



  @override
  void onInit() {   // kind of initState
    print('onInite methode called');
    //_fetchPostData();
    //_postDataToJsonHolder();
    //_putDataToJsonHolder();
    //_patchDataToJsonHolder();
    //_deleteDataToJsonHolder();
    //getPaginationData(pageNo: 1);
    getEshopCategories();
    super.onInit();
  }




  void getEshopCategories() async{

    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrlEshop,
      headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjIwMDE3OTAyMDUsImlhdCI6MTY0MTc5MDIwNSwiaXNzIjoiZXNob3AifQ.pMhVWFe_ql39Pdt4jh0D3v-_cQsO0XgqDUVlUSwEb6E'
      },
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());
    try{

      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{

        isLoading.value=true;
        print('Internet Connected');
        //EasyLoading.show(status: 'loading...');

        var response=await dio.post(Apis.eshopCategories);

        if(response.statusCode==200){
          EasyLoading.showToast('Successfully Data Loading...', toastPosition: EasyLoadingToastPosition.bottom, duration: Duration(seconds: 3));
          var myReceivedData = response.data;

          print('HTTP Mehtod: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');

          myEshopCategoryData.value=EshopCategoryModel.fromJson(myReceivedData);

          print('My Popular Data List length from Model ${myEshopCategoryData.value.popularCategories?.length??0}');
          print('My Data List length from Model ${myEshopCategoryData.value.data?.length??0}');


          // var myPopularData=myReceivedData['popular_categories'] as List;
          // var myDataList=myReceivedData['data'] as List;
          //
          // print('My Popular Data List length ${myPopularData.length}');
          // print('My Popular Data List:  $myPopularData');
          // print('My Data List length ${myDataList.length}');
          // print('My Data List : $myDataList');


        }else{
          EasyLoading.showToast('Failed Data Loading...!', toastPosition: EasyLoadingToastPosition.bottom, duration: Duration(seconds: 3));
          print('Failed to load data');
        }
      }
    }catch(e){
      EasyLoading.showToast(e.toString(), toastPosition: EasyLoadingToastPosition.bottom, duration: Duration(seconds: 3));

      print('Error occurred: $e');
      //EasyLoading.showError('Failed to Load data');
    }finally{
      isLoading.value = false;
      //EasyLoading.dismiss();

    }
  }


  Future<void> _fetchPostData() async {

    Dio dio = Dio(BaseOptions(
        baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

    try{
      EasyLoading.show(status: 'Loading');

      if (connectivityResult == ConnectivityResult.none) {

        print('No Internet connection');
        EasyLoading.showToast('Need Internet Connection', duration: const Duration(seconds: 3), toastPosition: EasyLoadingToastPosition.bottom);

      } else  {

        var response = await dio.get(Apis.getJsonHolderPostData);
        if(response.statusCode == 200){
          EasyLoading.showSuccess('Data Loaded');
          //
          // print('HTTP Method: ${response.requestOptions.method}');
          // print('HTTP URL: ${response.requestOptions.baseUrl}');
          // print('HTTP Path: ${response.requestOptions.path}');
          // print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');

          var myPostData = response.data as List;
          var newList = myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          postList.addAll(newList);
          print('After Add List: ${postList.length}');

        }else{
          print('Failed to read Data');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');
        }
      }
    }catch(e){
      EasyLoading.showError('Failed to Load Data $e');
      print('ERROR: $e');
    }finally{
      EasyLoading.dismiss();
    }
  }

  Future<void> _postDataToJsonHolder() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

    try{
      EasyLoading.show(status: 'Loading');

      if (connectivityResult == ConnectivityResult.none) {

        print('No Internet connection');
        EasyLoading.showToast('Need Internet Connection', duration: const Duration(seconds: 3), toastPosition: EasyLoadingToastPosition.bottom);

      } else  {

        var response = await dio.post(Apis.getJsonHolderPostData, data: {
          'userId': '11',
          'title': 'My Title',
          'body': 'My HTTP Body'
        });
        if(response.statusCode == 201){
          EasyLoading.showSuccess('Data Loaded');

          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP URL: ${response.requestOptions.baseUrl}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');


          var myPostData = response.data;
          print('HTTP Data: ${response.requestOptions.data}');
          print('HTTP Data: ${myPostData['id']}');
          // var newList = myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          // postList.addAll(newList);
          //print('After Add List: ${postList.length}');

        }else{
          print('Failed to load Data');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');
        }
      }
    }catch(e){
      EasyLoading.showError('Failed to Load Data $e');
      print('ERROR: $e');
    }finally{
      EasyLoading.dismiss();
    }
  }

  Future<void> _putDataToJsonHolder() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

    try{
      EasyLoading.show(status: 'Loading');

      if (connectivityResult == ConnectivityResult.none) {

        print('No Internet connection');
        EasyLoading.showToast('Need Internet Connection', duration: const Duration(seconds: 3), toastPosition: EasyLoadingToastPosition.bottom);

      } else  {

        var response = await dio.put(Apis.getJsonHolderPostDataByPostId+'100', data: {
          'userId': '11',
          'title': 'My Title',
          'body': 'My HTTP Body'
        });
        if(response.statusCode == 200){
          EasyLoading.showSuccess('Update Succesfully');

          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP URL: ${response.requestOptions.baseUrl}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');


          var myPostData = response.data;
          print('HTTP Data: ${response.requestOptions.data}');
          print('HTTP Data: ${myPostData['id']}');
          // var newList = myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          // postList.addAll(newList);
          //print('After Add List: ${postList.length}');

        }else{
          print('Failed to load Data');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');
        }
      }
    }catch(e){
      EasyLoading.showError('Failed to Load Data $e');
      print('ERROR: $e');
    }finally{
      EasyLoading.dismiss();
    }
  }

  Future<void> _patchDataToJsonHolder() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

    try{
      EasyLoading.show(status: 'Loading');

      if (connectivityResult == ConnectivityResult.none) {

        print('No Internet connection');
        EasyLoading.showToast('Need Internet Connection', duration: const Duration(seconds: 3), toastPosition: EasyLoadingToastPosition.bottom);

      } else  {

        var response = await dio.put(Apis.getJsonHolderPostDataByPostId+'100', data: {
          'userId': '11',
          'title': 'My Title',
          'body': 'My HTTP Body'
        });
        if(response.statusCode == 200){
          EasyLoading.showSuccess('Update Succesfully');

          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP URL: ${response.requestOptions.baseUrl}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');


          var myPostData = response.data;
          print('HTTP Data: ${response.requestOptions.data}');
          print('HTTP Data: ${myPostData['id']}');
          // var newList = myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          // postList.addAll(newList);
          //print('After Add List: ${postList.length}');

        }else{
          print('Failed to load Data');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');
        }
      }
    }catch(e){
      EasyLoading.showError('Failed to Load Data $e');
      print('ERROR: $e');
    }finally{
      EasyLoading.dismiss();
    }
  }

  Future<void> _deleteDataToJsonHolder() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

    try{
      EasyLoading.show(status: 'Loading');

      if (connectivityResult == ConnectivityResult.none) {

        print('No Internet connection');
        EasyLoading.showToast('Need Internet Connection', duration: const Duration(seconds: 3), toastPosition: EasyLoadingToastPosition.bottom);

      } else  {

        var response = await dio.delete(Apis.getJsonHolderPostDataByPostId+'1');
        if(response.statusCode == 200){
          EasyLoading.showSuccess('Deleted Succesfully');

          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP URL: ${response.requestOptions.baseUrl}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');


          var myPostData = response.data;
          print('HTTP Data: ${response.requestOptions.data}');
          print('HTTP Data: ${myPostData['id']}');
          // var newList = myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          // postList.addAll(newList);
          //print('After Add List: ${postList.length}');

        }else{
          print('Failed to load Data');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');
        }
      }
    }catch(e){
      EasyLoading.showError('Failed to Load Data $e');
      print('ERROR: $e');
    }finally{
      EasyLoading.dismiss();
    }
  }

  void getPaginationData({required int pageNo}) async {

    var url = 'https://picsum.photos/v2/list?page=1&limit=20';

    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://picsum.photos',
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());

    try{
      EasyLoading.show(status: 'Loading');

      if (connectivityResult == ConnectivityResult.none) {

        print('No Internet connection');
        EasyLoading.showToast('Need Internet Connection', duration: const Duration(seconds: 3), toastPosition: EasyLoadingToastPosition.bottom);

      } else  {

        var response = await dio.get('/v2/list', queryParameters: {
          'page':pageNo,
          'limit':'10'
        });
        if(response.statusCode == 200){
          EasyLoading.showSuccess('Data Loaded');

          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP URL: ${response.requestOptions.baseUrl}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');

          picSumModelList.clear();
          var myPostData = response.data as List;
          var newList = myPostData.map((e) => PicSumModel.fromJson(e)).toList();
          //print('Data ${response.data}');
          picSumModelList.addAll(newList);
          print('After Add List: ${picSumModelList.length}');

        }else{
          print('Failed to read Data');
          print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');
        }
      }
    }catch(e){
      EasyLoading.showError('Failed to Load Data $e');
      print('ERROR: $e');
    }finally{
      EasyLoading.dismiss();
    }
  }

}