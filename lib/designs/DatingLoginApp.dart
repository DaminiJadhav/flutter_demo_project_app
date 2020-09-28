
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatingLoginApp extends StatefulWidget{
  @override
  _DatingLoginAppState createState() => _DatingLoginAppState();
}

class _DatingLoginAppState extends State<DatingLoginApp> {
  List<Color> color=[Color(0xFFFB9245),Color(0XFFF54E68)];
   int _index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,

        child: Container(
          decoration: BoxDecoration(gradient:
            LinearGradient(colors: color,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),

          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/laptop.jpg',width: 200,),
                  Tabs(context),
//                _index==0 ? login(context) : SignUp(context)

                AnimatedCrossFade(
                  duration: Duration(milliseconds: 150),
                  firstChild: login(context),
                  secondChild: SignUp(context),
                  crossFadeState: _index==0 ? CrossFadeState.showFirst :CrossFadeState.showSecond,
                )
                ],
              ),
            )
          ),

        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget Tabs(BuildContext context){
    return Padding(
        padding: const EdgeInsets.only(top:30.0,left: 15,right: 15),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.12),
          borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(color: _index==0 ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(25)),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Existing',style:TextStyle(color: _index==0 ? Colors.black : Colors.white,fontSize: 15,fontWeight: _index==0 ? FontWeight.bold :FontWeight.normal),),
                      )
                      )
                  ),
                  onTap: (){
                    setState(() {
                      _index=0;
                    });
                  },
                ),
              ),

              Expanded(
                child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(color: _index==1 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('New',style:TextStyle(color: _index==1 ? Colors.black : Colors.white,fontSize: 15,fontWeight:  _index==1 ? FontWeight.bold :FontWeight.normal),),
                      ))),
                  onTap: (){
                    setState(() {
                      _index=1;

                    });
                  },
                ),

              )


            ],
          ),
        ),

    );
  }

  Widget login(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:20,left: 15,right: 15,),
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(top:10,left: 15,right: 15,bottom: 20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,color: Colors.grey,),
                        labelText: 'Enter your email',
                        labelStyle:TextStyle(color: Colors.black87) ,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                        )
                      ),
                    ),
                    Divider(color: Colors.grey,height: 8,),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                          labelText: 'Enter your password',
                          labelStyle:TextStyle(color: Colors.black87) ,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          )
                      ),
                    ),
                    Divider(color: Colors.grey,height: 8,)
                  ],
                ),
              ),
            ),

              Positioned(
                top: 130,
                child: Center(
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width-100,
                      decoration: BoxDecoration(gradient: LinearGradient(colors: color),
                      borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Center(child: Text('Log in',style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:  FontWeight.bold),)),
                      ),

                    ),
                  ),
                ),
              )
    ]
          ),

          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: GestureDetector(
              child: Container(
                child: Center(child: Text('Forget password ?',style: TextStyle(color: Colors.white,fontSize: 16),)),
              ),
              onTap: (){

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 55,height: 1,color: Colors.grey,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(child: Text('Or',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),
                  Container(width: 55,height: 1,color: Colors.grey,),


                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    decoration:BoxDecoration(color: Colors.white,
                    shape: BoxShape.circle),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Image.asset('assets/google.png'),

                    ),
                  ),
                  onTap: (){

                  },
                ),
                Container(width: 55,),
                GestureDetector(
                  child: Container(
                    decoration:BoxDecoration(color: Colors.white,
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Image.asset('assets/facebook.png'),

                    ),
                  ),
                  onTap: (){

                  },
                )
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget SignUp(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:20,left: 15,right: 15,),
      child: Column(
        children: <Widget>[
          Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(top:10,left: 15,right: 15,bottom: 20),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email,color: Colors.grey,),
                              labelText: 'Enter your email',
                              labelStyle:TextStyle(color: Colors.black87) ,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              )
                          ),
                        ),
                        Divider(color: Colors.grey,height: 8,),
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                              labelText: 'Enter your password',
                              labelStyle:TextStyle(color: Colors.black87) ,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              )
                          ),
                        ),
                        Divider(color: Colors.grey,height: 8,),
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email,color: Colors.grey,),
                              labelText: 'Re - enter',
                              labelStyle:TextStyle(color: Colors.black87) ,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              )
                          ),
                        ),
                        Divider(color: Colors.grey,height: 8,),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 210,
                  child: Center(
                    child: GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width-100,
                        decoration: BoxDecoration(gradient: LinearGradient(colors: color),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Center(child: Text('SignUp',style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:  FontWeight.bold),)),
                        ),

                      ),
                    ),
                  ),
                )
              ]
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 55,height: 1,color: Colors.grey,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(child: Text('Or',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),
                  Container(width: 55,height: 1,color: Colors.grey,),


                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    decoration:BoxDecoration(color: Colors.white,
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Image.asset('assets/google.png'),

                    ),
                  ),
                  onTap: (){

                  },
                ),
                Container(width: 55,),
                GestureDetector(
                  child: Container(
                    decoration:BoxDecoration(color: Colors.white,
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Image.asset('assets/facebook.png'),

                    ),
                  ),
                  onTap: (){

                  },
                )
              ],
            ),
          ),
        ],
      ),

    );
  }

}