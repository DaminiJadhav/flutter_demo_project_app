import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/RandomUser/UserResponse.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/RandomUser/userbloc/UserBloc.dart';

class UserWidget extends StatefulWidget {
  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  final userbloc=UserBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userbloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<UserResponse>(
        stream: userbloc.subjectresponse.stream,
        builder: (context,AsyncSnapshot<UserResponse> snapshot){
          if(snapshot.hasData){
             if(snapshot.data.error!=null && snapshot.data.error.length > 0){
               return _buildErrorWidget(snapshot.data.error);
             }
             return _buildUserWidget(snapshot.data);
          }else if(snapshot.hasError){
              return _buildErrorWidget(snapshot.error);
          }else{
            return _buildLoadingWidget();
          }
        },
      );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget _buildUserWidget(UserResponse data) {
    User user=data.results[0];
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: NetworkImage(user.picture.large),),
            Text(user.name.first),
            Text(user.email, style: Theme.of(context).textTheme.subtitle),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Text(user.location.city, style: Theme.of(context).textTheme.body1),
          ],
        ));
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading data from API..."), CircularProgressIndicator()],
        ));
  }
}
