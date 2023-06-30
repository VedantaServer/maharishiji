// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [log_in_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LogInModel extends Equatable {
  LogInModel copyWith() {
    return LogInModel();
  }

  @override
  List<Object?> get props => [];
}

class MaharishiLogin {
  MaharishiLogin({
    required this.msg,
    required this.isError,
    required this.code,
    required this.data,
  });
  late final String msg;
  late final String isError;
  late final int code;
  late final Data data;

  MaharishiLogin.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    isError = json['isError'];
    code = json['code'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['isError'] = isError;
    _data['code'] = code;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.fullName,
    required this.userStatus,
    required this.password,
    required this.email,
    required this.contactNumber,
    required this.stateName,
    this.countryName,
    required this.cityName,
    this.image,
    required this.subscriptionPayment,
    required this.roles,
  });
  late final String fullName;
  late final String userStatus;
  late final String password;
  late final String email;
  late final String contactNumber;
  late final String stateName;
  late final Null countryName;
  late final String cityName;
  late final Null image;
  late final List<SubscriptionPayment> subscriptionPayment;
  late final List<Roles> roles;

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    userStatus = json['userStatus'];
    password = json['password'];
    email = json['email'];
    contactNumber = json['contactNumber'];
    stateName = json['stateName'];
    countryName = null;
    cityName = json['cityName'];
    image = null;
    subscriptionPayment = List.from(json['subscriptionPayment'])
        .map((e) => SubscriptionPayment.fromJson(e))
        .toList();
    roles = List.from(json['roles']).map((e) => Roles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['userStatus'] = userStatus;
    _data['password'] = password;
    _data['email'] = email;
    _data['contactNumber'] = contactNumber;
    _data['stateName'] = stateName;
    _data['countryName'] = countryName;
    _data['cityName'] = cityName;
    _data['image'] = image;
    _data['subscriptionPayment'] =
        subscriptionPayment.map((e) => e.toJson()).toList();
    _data['roles'] = roles.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SubscriptionPayment {
  SubscriptionPayment({
    required this.id,
    required this.user,
    required this.subscriptionPlan,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
    required this.amount,
    required this.txnNumber,
    required this.postTxnNumber,
    required this.txnStatus,
    required this.recieptNumber,
    required this.updationDate,
    required this.isActive,
    required this.plateform,
  });
  late final int id;
  late final User user;
  late final SubscriptionPlan subscriptionPlan;
  late final List<int> subscriptionStartDate;
  late final List<int> subscriptionEndDate;
  late final int amount;
  late final String txnNumber;
  late final String postTxnNumber;
  late final String txnStatus;
  late final String recieptNumber;
  late final String updationDate;
  late final bool isActive;
  late final String plateform;

  SubscriptionPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = User.fromJson(json['user']);
    subscriptionPlan = SubscriptionPlan.fromJson(json['subscriptionPlan']);
    if (json['subscriptionStartDate'] != null)
      subscriptionStartDate =
          List.castFrom<dynamic, int>(json['subscriptionStartDate']);
    if (json['subscriptionEndDate'] != null)
      subscriptionEndDate =
          List.castFrom<dynamic, int>(json['subscriptionEndDate']);
    amount = json['amount'];
    txnNumber = json['txnNumber'];
    if (json['postTxnNumber'] != null) postTxnNumber = json['postTxnNumber'];
    if (json['txnStatus'] != null) txnStatus = json['txnStatus'];
    recieptNumber = json['recieptNumber'];
    if (json['updationDate'] != null) updationDate = json['updationDate'];
    isActive = json['isActive'];
    plateform = json['plateform'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user'] = user.toJson();
    _data['subscriptionPlan'] = subscriptionPlan.toJson();
    _data['subscriptionStartDate'] = subscriptionStartDate;
    _data['subscriptionEndDate'] = subscriptionEndDate;
    _data['amount'] = amount;
    _data['txnNumber'] = txnNumber;
    _data['postTxnNumber'] = postTxnNumber;
    _data['txnStatus'] = txnStatus;
    _data['recieptNumber'] = recieptNumber;
    _data['updationDate'] = updationDate;
    _data['isActive'] = isActive;
    _data['plateform'] = plateform;
    return _data;
  }
}

class User {
  User({
    required this.fullName,
    required this.userStatus,
    required this.password,
    required this.email,
    required this.contactNumber,
    required this.stateName,
    this.countryName,
    required this.cityName,
    this.image,
    required this.subscriptionPayment,
    required this.roles,
  });
  late final String fullName;
  late final String userStatus;
  late final String password;
  late final String email;
  late final String contactNumber;
  late final String stateName;
  late final Null countryName;
  late final String cityName;
  late final Null image;
  late final List<int> subscriptionPayment;
  late final List<Roles> roles;

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    userStatus = json['userStatus'];
    password = json['password'];
    email = json['email'];
    contactNumber = json['contactNumber'];
    stateName = json['stateName'];
    if (json['cityName'] != null) countryName = json['countryName'];
    if (json['cityName'] != null) cityName = json['cityName'];
    image = null;
    subscriptionPayment =
        List.castFrom<dynamic, int>(json['subscriptionPayment']);
    roles = List.from(json['roles']).map((e) => Roles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['userStatus'] = userStatus;
    _data['password'] = password;
    _data['email'] = email;
    _data['contactNumber'] = contactNumber;
    _data['stateName'] = stateName;
    _data['countryName'] = countryName;
    _data['cityName'] = cityName;
    _data['image'] = image;
    _data['subscriptionPayment'] = subscriptionPayment;
    _data['roles'] = roles.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Roles {
  Roles({
    required this.name,
  });
  late final String name;

  Roles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

class SubscriptionPlan {
  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.href,
    required this.duration,
    this.description,
    required this.price,
    required this.image,
    required this.isIndian,
    required this.androidProductId,
    required this.iosProductId,
    required this.androidKey,
    required this.androidKeyValue,
    required this.iosKey,
    required this.iosKeyValue,
    required this.updationDate,
  });
  late final int id;
  late final String name;
  late final String href;
  late final int duration;
  late final Null description;
  late final int price;
  late final String image;
  late final bool isIndian;
  late final String androidProductId;
  late final String iosProductId;
  late final String androidKey;
  late final String androidKeyValue;
  late final String iosKey;
  late final String iosKeyValue;
  late final String updationDate;

  SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    href = json['href'];
    duration = json['duration'];
    description = null;
    price = json['price'];
    image = json['image'];
    isIndian = json['isIndian'];
    androidProductId = json['androidProductId'];
    iosProductId = json['iosProductId'];
    androidKey = json['androidKey'];
    androidKeyValue = json['androidKeyValue'];
    iosKey = json['iosKey'];
    iosKeyValue = json['iosKeyValue'];
    updationDate = json['updationDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['href'] = href;
    _data['duration'] = duration;
    _data['description'] = description;
    _data['price'] = price;
    _data['image'] = image;
    _data['isIndian'] = isIndian;
    _data['androidProductId'] = androidProductId;
    _data['iosProductId'] = iosProductId;
    _data['androidKey'] = androidKey;
    _data['androidKeyValue'] = androidKeyValue;
    _data['iosKey'] = iosKey;
    _data['iosKeyValue'] = iosKeyValue;
    _data['updationDate'] = updationDate;
    return _data;
  }
}
