// To parse this JSON data, do
//
//     final postProfileRequest = postProfileRequestFromJson(jsonString);

import 'dart:convert';

PostProfileRequest postProfileRequestFromJson(String str) => PostProfileRequest.fromJson(json.decode(str));

String postProfileRequestToJson(PostProfileRequest data) => json.encode(data.toJson());

class PostProfileRequest {
  PostProfileRequest({
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
    this.companyName,
    this.countryName,
  });

  String firstName;
  dynamic lastName;
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
  dynamic companyName;
  dynamic countryName;

  factory PostProfileRequest.fromJson(Map<String, dynamic> json) => PostProfileRequest(
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
    companyName: json["CompanyName"],
    countryName: json["CountryName"],
  );

  Map<String, dynamic> toJson() => {
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
    "CompanyName": companyName,
    "CountryName": countryName,
  };
}
