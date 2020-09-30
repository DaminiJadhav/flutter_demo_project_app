// To parse this JSON data, do
//
//     final profileUpdateReponse = profileUpdateReponseFromJson(jsonString);

import 'dart:convert';

ProfileUpdateReponse profileUpdateReponseFromJson(String str) => ProfileUpdateReponse.fromJson(json.decode(str));

String profileUpdateReponseToJson(ProfileUpdateReponse data) => json.encode(data.toJson());

class ProfileUpdateReponse {
  ProfileUpdateReponse({
    this.rowsUpdated,
    this.message,
  });

  RowsUpdated rowsUpdated;
  String message;

  factory ProfileUpdateReponse.fromJson(Map<String, dynamic> json) => ProfileUpdateReponse(
    rowsUpdated: RowsUpdated.fromJson(json["RowsUpdated"]),
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "RowsUpdated": rowsUpdated.toJson(),
    "Message": message,
  };
}

class RowsUpdated {
  RowsUpdated({
    this.customerId,
    this.firstName,
    this.lastName,
    this.companyId,
    this.homeAddress,
    this.officeAddress,
    this.fromOfficeTime,
    this.toOfficeTime,
    this.city,
    this.countryId,
    this.postalCode,
    this.phoneNo,
    this.alternativePhoneNo,
    this.birthdate,
    this.email,
    this.addedBy,
    this.addedOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
    this.userId,
    this.panNo,
    this.adharNo,
    this.aspNetUser,
    this.aspNetUser1,
    this.aspNetUser2,
    this.tblMstCompany,
    this.tblMstCountry,
  });

  int customerId;
  String firstName;
  String lastName;
  dynamic companyId;
  dynamic homeAddress;
  dynamic officeAddress;
  dynamic fromOfficeTime;
  dynamic toOfficeTime;
  dynamic city;
  dynamic countryId;
  dynamic postalCode;
  String phoneNo;
  dynamic alternativePhoneNo;
  dynamic birthdate;
  dynamic email;
  dynamic addedBy;
  dynamic addedOn;
  dynamic modifiedBy;
  dynamic modifiedOn;
  bool isActive;
  dynamic userId;
  dynamic panNo;
  dynamic adharNo;
  dynamic aspNetUser;
  dynamic aspNetUser1;
  dynamic aspNetUser2;
  dynamic tblMstCompany;
  dynamic tblMstCountry;

  factory RowsUpdated.fromJson(Map<String, dynamic> json) => RowsUpdated(
    customerId: json["CustomerID"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    companyId: json["CompanyID"],
    homeAddress: json["HomeAddress"],
    officeAddress: json["OfficeAddress"],
    fromOfficeTime: json["FromOfficeTime"],
    toOfficeTime: json["ToOfficeTime"],
    city: json["City"],
    countryId: json["CountryID"],
    postalCode: json["PostalCode"],
    phoneNo: json["PhoneNo"],
    alternativePhoneNo: json["AlternativePhoneNo"],
    birthdate: json["Birthdate"],
    email: json["Email"],
    addedBy: json["AddedBy"],
    addedOn: json["AddedOn"],
    modifiedBy: json["ModifiedBy"],
    modifiedOn: json["ModifiedOn"],
    isActive: json["IsActive"],
    userId: json["UserId"],
    panNo: json["PANNo"],
    adharNo: json["AdharNo"],
    aspNetUser: json["AspNetUser"],
    aspNetUser1: json["AspNetUser1"],
    aspNetUser2: json["AspNetUser2"],
    tblMstCompany: json["tblMstCompany"],
    tblMstCountry: json["tblMstCountry"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerID": customerId,
    "FirstName": firstName,
    "LastName": lastName,
    "CompanyID": companyId,
    "HomeAddress": homeAddress,
    "OfficeAddress": officeAddress,
    "FromOfficeTime": fromOfficeTime,
    "ToOfficeTime": toOfficeTime,
    "City": city,
    "CountryID": countryId,
    "PostalCode": postalCode,
    "PhoneNo": phoneNo,
    "AlternativePhoneNo": alternativePhoneNo,
    "Birthdate": birthdate,
    "Email": email,
    "AddedBy": addedBy,
    "AddedOn": addedOn,
    "ModifiedBy": modifiedBy,
    "ModifiedOn": modifiedOn,
    "IsActive": isActive,
    "UserId": userId,
    "PANNo": panNo,
    "AdharNo": adharNo,
    "AspNetUser": aspNetUser,
    "AspNetUser1": aspNetUser1,
    "AspNetUser2": aspNetUser2,
    "tblMstCompany": tblMstCompany,
    "tblMstCountry": tblMstCountry,
  };
}




//{"RowsUpdated":{"CustomerID":15,"FirstName":"Ankur","LastName":"Shinde","CompanyID":null,"HomeAddress":null,"OfficeAddress":null,"FromOfficeTime":null,"ToOfficeTime":null,"City":null,"CountryID":null,"PostalCode":null,"PhoneNo":"8805078548","AlternativePhoneNo":null,"Birthdate":null,"Email":null,"AddedBy":null,"AddedOn":null,"ModifiedBy":null,"ModifiedOn":null,"IsActive":true,"UserId":null,"PANNo":null,"AdharNo":null,"AspNetUser":null,"AspNetUser1":null,"AspNetUser2":null,"tblMstCompany":null,"tblMstCountry":null},"Message":"1 row Updated"}
