// To parse this JSON data, do
//
//     final profileUpload = profileUploadFromJson(jsonString);

import 'dart:convert';

ProfileUpload profileUploadFromJson(String str) => ProfileUpload.fromJson(json.decode(str));

String profileUploadToJson(ProfileUpload data) => json.encode(data.toJson());

class ProfileUpload {
  ProfileUpload({
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
    this.companyName,
    this.countryName,
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
  dynamic companyName;
  dynamic countryName;

  factory ProfileUpload.fromJson(Map<String, dynamic> json) => ProfileUpload(
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
    companyName: json["CompanyName"],
    countryName: json["CountryName"],
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
    "CompanyName": companyName,
    "CountryName": countryName,
  };
}
