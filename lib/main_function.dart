import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemoprojectapp/api/HttpGetApi.dart';
import 'package:flutterdemoprojectapp/bloc/CounterBloc.dart';
import 'package:flutterdemoprojectapp/bloc/callApiUsingBloc/WeatherApi/WeatherWidget.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/CounterBlocUsingLibrary.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/CounterBlocUsingLibraryExample.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/JobPositionRepository.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/companydetailapicall_bloclibrary/companybloc/job_position_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/usingbloclibrary/src/pages/home_page_bloc.dart';
import 'package:flutterdemoprojectapp/bloc/validation/validationUsingBlocLibrary/loginform/LoginFormHomePage.dart';
import 'package:flutterdemoprojectapp/colors/MyColors.dart';
import 'package:flutterdemoprojectapp/menu_items/menuItemApp_Icon.dart';
import 'package:flutterdemoprojectapp/pagination/StudentPaginationList.dart';
import 'package:flutterdemoprojectapp/pagination/paginationusingprovider/DataLoaderpagination.dart';
import 'package:flutterdemoprojectapp/sharedpreferencesdata/GetSharedPreferenceDataString.dart';
import 'package:flutterdemoprojectapp/shimmer/ShimmerApp.dart';
import 'package:flutterdemoprojectapp/shimmer/ShimmerListviewLayout.dart';
import 'package:flutterdemoprojectapp/shimmer/shimmer_list_loading.dart';
import 'package:flutterdemoprojectapp/widgets/BottomAppBarFloating.dart';
import 'package:flutterdemoprojectapp/widgets/BottomSheetCheckBox.dart';
import 'package:flutterdemoprojectapp/widgets/CarouselImageSlider.dart';
import 'package:flutterdemoprojectapp/widgets/CheckAllPermission.dart';
import 'package:flutterdemoprojectapp/widgets/CheckPermissions.dart';
import 'package:flutterdemoprojectapp/widgets/CountDownTimerApp.dart';
import 'package:flutterdemoprojectapp/widgets/CustomStickyHeader.dart';
import 'package:flutterdemoprojectapp/widgets/DateTimePickerApp.dart';
import 'package:flutterdemoprojectapp/widgets/DropDownApp.dart';
import 'package:flutterdemoprojectapp/widgets/DynamicLinkApp.dart';
import 'package:flutterdemoprojectapp/widgets/Expandable&StickyListApp.dart';
import 'package:flutterdemoprojectapp/widgets/FacebookAndroidLoginApp.dart';
import 'package:flutterdemoprojectapp/widgets/GoogleLoginApp.dart';
import 'package:flutterdemoprojectapp/widgets/ImagePickerApp.dart';
import 'package:flutterdemoprojectapp/widgets/JsonStringValues.dart';
import 'package:flutterdemoprojectapp/widgets/LaunchUrlApp.dart';
import 'package:flutterdemoprojectapp/widgets/NotificationApp.dart';
import 'package:flutterdemoprojectapp/widgets/PaginationListViewData.dart';
import 'package:flutterdemoprojectapp/widgets/PaginationRestApi.dart';
import 'package:flutterdemoprojectapp/widgets/ProgressIndicatorApp.dart';
import 'package:flutterdemoprojectapp/widgets/ProgressIndicatorTimerApp.dart';
import 'package:flutterdemoprojectapp/widgets/RoundedBottomAppBar.dart';
import 'package:flutterdemoprojectapp/widgets/RoundedShadowBottomAppBar.dart';
import 'package:flutterdemoprojectapp/widgets/SearchViewApp_Delegate.dart';
import 'package:flutterdemoprojectapp/widgets/SharedPreferenceLoadImage.dart';
import 'package:flutterdemoprojectapp/widgets/SharedPreferencesApp.dart';
import 'package:flutterdemoprojectapp/widgets/SilverAppBarExample.dart';
import 'package:flutterdemoprojectapp/widgets/SilverBorderAppBar.dart';
import 'package:flutterdemoprojectapp/widgets/SilverFlexibleSpace.dart';
import 'package:flutterdemoprojectapp/widgets/SliverGridApp.dart';
import 'package:flutterdemoprojectapp/widgets/TabBarApp.dart';
import 'package:flutterdemoprojectapp/widgets/TabbedAppBarSample.dart';
import 'package:flutterdemoprojectapp/widgets/TableApp.dart';
import 'package:flutterdemoprojectapp/widgets/TablePaginatedApp.dart';
import 'package:flutterdemoprojectapp/widgets/TextFieldOutline.dart';
import 'package:flutterdemoprojectapp/widgets/VisibilityApp.dart';
import 'package:flutterdemoprojectapp/widgets/formapp.dart';
import 'api/HttpGetApiWithParameter.dart';
import 'api/HttpPostApi.dart';
import 'api/PaginationApi/Repository/HomeStudentData.dart';
import 'api/jsonparseing/HttpGetApiJsonParsing.dart';
import 'bloc/BlocCounterExample.dart';
import 'bloc/blocsupervisor/statemanagementfood/FoodFormHomePage.dart';
import 'bloc/blocsupervisor/statemanagementfood/FoodFormMainPage.dart';
import 'bloc/blocsupervisor/statemanagementfood/food_bloc_delegate.dart';
import 'bloc/callApiUsingBloc/RandomUser/UserMainWidget.dart';
import 'bloc/callApiUsingBloc/RandomUser/UserWidget.dart';
import 'bloc/usingbloclibrary/WeatherBloclibrary/WeatherHomePage.dart';
import 'bloc/usingbloclibrary/WeatherConditionBlocLibrary/WeatherConditionMain.dart';
import 'bloc/usingbloclibrary/WeatherConditionBlocLibrary/services/WeatherApiClient.dart';
import 'bloc/usingbloclibrary/WeatherConditionBlocLibrary/services/WeatherRepository.dart';
import 'bloc/usingbloclibrary/companydetailapicall_bloclibrary/JobPositionHomePage.dart';
import 'bloc/usingbloclibrary/companydetailapicall_bloclibrary/JobPositionMainPage.dart';
import 'bloc/usingbloclibrary/src/pages/home_page.dart';
import 'bloc/validation/BlocLoginValidation.dart';
import 'bloc/validation/validationUsingBlocLibrary/checkEmptyField/FormHomeScreen.dart';
import 'bloc/validation/validationUsingBlocLibrary/loginform/LoginFormMainPage.dart';
import 'designs/DatingLoginApp.dart';
import 'designs/FacebookAppBarDesign.dart';
import 'dioApi/pagination/PaginationDioApi.dart';
import 'file:///D:/flutter/MyApp/flutter_demo_project_app/lib/menu_items/menuItemApp.dart';
import 'ios/CupertinoAlertDialogApp.dart';
import 'ios/CupertinoContextMenuApp.dart';
import 'ios/CupertinoDatapickerApp.dart';
import 'menu_items/menuItem_Divider&Check.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

void main() {

//  BlocSupervisor().delegate=simpleBloc();
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
//        home: WeatherConditionMain(weatherRepository: weatherRepository,),
        home:ProgressIndicatorTimerApp(),
//      home: BlocProvider<HomePageBloc>(
//        create: (BuildContext context){
//          return HomePageBloc();
//        },
//          child:HomePage() ,
//    ),
//      home: JobPositionMainPage(),

//      home:CounterBlocUsingLibraryExample() ,
//      home: BlocProvider<CounterBlocUsingLibrary>(
//        create: (BuildContext context){
//          return CounterBlocUsingLibrary();
//        },
//        child:CounterBlocUsingLibraryExample() ,
//
//      ) ,
        theme: ThemeData(
            brightness: Brightness.light,
//          primaryColor: Colors.lightBlue,
            primaryColor: MyColors.myPrimaryColor,
//          primaryColor: MyColors.myColors[50],

            primaryColorDark: Colors.grey,
//        accentColor: Colors.deepPurpleAccent,
//          primarySwatch: Colors.red,
//        fontFamily: "IndieFlower"
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            )
//        primaryIconTheme: IconThemeData(color: Colors.grey)

        ),
      )

  );
}
