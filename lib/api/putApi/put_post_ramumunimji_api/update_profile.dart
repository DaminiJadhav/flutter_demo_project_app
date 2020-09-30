import 'package:flutter/material.dart';

import 'PostProfileRequest.dart';
import 'ProfileUpload.dart';
import 'ProfileUploadRepo.dart';

class UpdateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Call"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Put Profile"),
            onPressed: _ApiCallMethod,
          ),
          RaisedButton(
            child: Text("Post Profile"),
            onPressed: _PostProileApiCallMethod,
          ),
        ],
      ),
    );
  }

  void _ApiCallMethod() async {
    ProfileUploadRepo profileUploadRepo = new ProfileUploadRepo();
    await profileUploadRepo.putProfile(ProfileUpload(
      customerId: 15,
      firstName: "Dhammapal",
      lastName: "Kamble",
/*      companyId: null,
      homeAddress: null,
      officeAddress: null,
      fromOfficeTime: null,
      city: null,
      countryId: null,
      postalCode: null,
      phoneNo: "8805078548",
      alternativePhoneNo: null,
      birthdate: null,
      email: null,
      addedBy: null,
      addedOn: null,
      modifiedBy: null,
      modifiedOn: null,
      companyName: null,
      countryName: null,
      toOfficeTime: null,*/
    ));
    // await profileUploadRepo.makePostRequest();
  }

  void _PostProileApiCallMethod() async{
    ProfileUploadRepo profileUploadRepo = new ProfileUploadRepo();
    profileUploadRepo.postProfile(PostProfileRequest(
        firstName: "Ankur",
        lastName: "Shinde",
        companyName: "Sdaemon"
    ));
  }
}
