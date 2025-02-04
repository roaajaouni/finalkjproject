import 'package:dio/dio.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/model/error/error_model.dart';
import 'package:flutter_childhood/model/mother_app_model/location_model.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MotherLocaionService extends BaseService{
  Future sendMtherLocation(int id,MotherLocationModel moherLocationModel )async{
    var response =await dio.post("${baseUrl}sendlocation/$id/",data:moherLocationModel.toMap() ,
    options: Options(
      headers: { 
        "Authorization": "Bearer ${getIt.get<SharedPreferences>().getString('token')}",
      }
    )
    
    );
      if (response.statusCode == 200) {
      MotherLocationModel newLocation = MotherLocationModel.fromMap(response.data);
      return  newLocation;
    }
    else{
      ErrorModel(errorMessage: 'there is a problem');
    }
  }

// ! fetch child location
Future fetchMotherLocation(int id)async{
  var response = await dio.get("${baseUrl}location/$id/",
  options: Options(
    headers: {
      "Authorization": "Bearer ${getIt.get<SharedPreferences>().getString('token')}"
    }
  )
  );

  if (response.statusCode==200){
    return response.data;
  }
  else{
ErrorModel(errorMessage: 'the server failure');
  }
}


}