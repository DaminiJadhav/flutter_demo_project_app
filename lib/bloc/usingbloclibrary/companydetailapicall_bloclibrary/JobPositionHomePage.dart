import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/JobPositionMainPage.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/JobPositionRepository.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/companybloc/job_position_bloc.dart';


class JobPositionHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('bloc library'),
      ),
      body:BlocProvider(
        create: (context) => JobPositionBloc(jobPositionRepository: JobPositionRepository()),
        child: JobPositionMainPage(),
      ),
    );
  }
}
