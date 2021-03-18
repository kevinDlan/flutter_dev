import 'package:flutter/material.dart';
import 'package:angeliq_distr/models/user.dart';
import 'package:dio/dio.dart';


  class UserProvider extends ChangeNotifier{
    String url = 'http://angeliquedistribution.asnumeric.com/api/';
    User _user;

    User getUserInfo(){
      return _user;
    }
    setUserInfo(User user){
      _user = user;
      print(_user.userName);
      notifyListeners();
  }

  Future<dynamic> login(FormData data)async{
      var body = data;
      var loginStatus = {'status':false,'netWorkStatus':false};
        Dio dio = new Dio();
        await dio.post(
          url+'auth',
          data: body,
        ).then(
                (response){
              if(response.statusCode == 200){
                if(response.data['connect']){
                  loginStatus = {'status':true,'netWorkStatus':true};
                  User user = User.fromMap(response.data);
                  user.saveUserData();
                }else{
                  loginStatus = {'status':false,'netWorkStatus':true};
                }
              }
            }
        ).catchError((error) => print(error));

      return loginStatus;
  }

  }