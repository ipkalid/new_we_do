import 'package:hive/hive.dart';
import 'dart:async';

var globalUserId;
var globalDriverId;
var globalWalletId;
var globalPhoneNumber;

class HiveEditor {
//   Future<void> saveUser(Account account) async {
//     var box = await Hive.openBox('Data');
//     box.put('avatar', account.avatar);
//     box.put('firstName', account.firstName);
//     box.put('lastName', account.lastName);
//     box.put('email', account.email);
//     box.put('mobileNumber', account.mobileNumber);
//     box.put('mobileNumberCounteryId', account.mobileNumberCounteryId);
//     box.put('isoCode', account.isoCode);
//     box.put('code', account.code);
//     box.put('birthday', account.birthday);
//     box.put('gender', account.gender);
//     box.put('cityAr', account.cityAr);
//     box.put('cityEn', account.cityEn);
//     box.put('cityId', account.cityId);
//     box.put('counteryEn', account.counteryEn);
//     box.put('counteryAr', account.counteryAr);
//     box.put('counteryId', account.counteryId);
//   }

//   Future<void> saveToken(Account account) async {
//     var box = await Hive.openBox('Data');
//     box.put('token', account.token);
//   }

//   Future<Account> getUser() async {
//     var box = await Hive.openBox('Data');

//     print(box.get('mobileNumber'));
//     return Account(
//       avatar: box.get('avatar'),
//       firstName: box.get('firstName'),
//       lastName: box.get('lastName'),
//       email: box.get('email'),
//       mobileNumber: box.get('mobileNumber'),
//       mobileNumberCounteryId: box.get('mobileNumberCounteryId'),
//       gender: box.get('gender'),
//       birthday: box.get('birthday'),
//       cityAr: box.get('cityAr'),
//       cityEn: box.get('cityEn'),
//       cityId: box.get('cityId'),
//       counteryAr: box.get('counteryAr'),
//       counteryEn: box.get('counteryEn'),
//       counteryId: box.get('counteryId'),
//       code: box.get('code'),
//       isoCode: box.get('isoCode'),
//     );
//   }

//   void updateImage(String photo) async {}

//   void removeUser() async {
//     var box = await Hive.openBox('Data');
//     box.delete('token');
//     box.delete('avatar');
//     box.delete('firstName');
//     box.delete('lastName');
//     box.delete('email');
//     box.delete('mobileNumber');
//     box.delete('mobileNumberCounteryId');
//     box.delete('isoCode');
//     box.delete('code');
//     box.delete('birthday');
//     box.delete('gender');
//     box.delete('cityAr');
//     box.delete('cityEn');
//     box.delete('cityId');
//     box.delete('counteryEn');
//     box.delete('counteryAr');
//     box.delete('counteryId');
//   }

  Future<void> getUserID() async {
    var box = await Hive.openBox('currentUser');
    globalUserId = box.get("customerID");
  }

  Future<void> getDriverID() async {
    var box = await Hive.openBox('currentUser');
    globalUserId = box.get("driverID");
  }

  Future<void> getWalletID() async {
    var box = await Hive.openBox('currentUser');
    globalUserId = box.get("walletID");
  }
}
