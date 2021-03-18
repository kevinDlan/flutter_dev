import 'package:shared_preferences/shared_preferences.dart';
class User{
final int id;
final String userName;
final int businessId;

  User({
    this.id,
    this.userName,
    this.businessId
  });

  factory User.fromMap(Map<String,dynamic> map){
    if(map==null) return null;

    return User(
      id: map['user_id'],
      userName: map['username'],
      businessId: map['business_id']
    );
  }

  saveUserData() async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('userId', this.id );
    sharedPreferences.setString('userName', this.userName);
    sharedPreferences.setInt('businessId',this.businessId);
  }



}
