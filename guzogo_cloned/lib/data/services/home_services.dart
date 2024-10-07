import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeServices extends GetxService{
  final dio = Dio();

  Future<Map<String,dynamic>> getAirPorts()async{
    try{
    final response = await dio.get("https://api.aviationstack.com/v1/airports?access_key=b2e5827a27fe2814c9793ef7643fcf0a");
  //   if(response.data.isBlank){
  //  return {"message": "Nothing found"};
  //   }
   return response.data;
    }catch(e){
      return {"message":e};
    }
  }

  Future<Map<String,dynamic>> getCities()async{
    try{
    final response = await dio.get("https://api.aviationstack.com/v1/airports?access_key=b2e5827a27fe2814c9793ef7643fcf0a");
   return response.data;
    }catch(e){
      return {"message":e};
    }
  }
}