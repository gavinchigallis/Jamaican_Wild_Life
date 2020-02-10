import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';

import '../Models/ThemeAttribute.dart';
import '../Models/Utility.dart';
import '../Models/Animal.dart';
import '../Widgets/AnimalTileWidget.dart';
import '../Services/AnimalService.dart';



/*
* @Description:
*
*/
class PhotoPage extends StatefulWidget {
  /*[Attributes]*/
  int id;

  PhotoPage(int id)
  {
      this.id = id;
  }

  /*
  * @Description:
  *
  * @param:
  *
  * @return: void
  */
  @override
  State<StatefulWidget> createState() {
    return _PhotoPage(id);
  }
}

/*
* @Description:
*
* @param:
*
* @return: void
*/
class _PhotoPage extends State<PhotoPage> with WidgetsBindingObserver{
    /*[Attributes]*/
    int _state_id = 0;
    int mainDisplayState = 0;
    Widget _view = Container();
    ThemeAttribute theme_attribute = ThemeAttribute();
    Utility utility = new Utility();
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    bool _isPageLoading = false;
    AnimalService animalService = new AnimalService();
    int id;
    Animal _animal;
    

    /*[Constructors]*/


    /*
    * @Description: Constructor
    *
    * @param:
    *
    * @return: void
    */
    _PhotoPage(id)
    {
        this.id = id;
    }

    /*[Live Cycle methods]*/

    /*
    * @Description: 
    *
    * @param:
    *
    * @return: void
    */
    @override
    void initState(){
        WidgetsBinding.instance.addObserver(this);

        this._getAnimal(id);

        super.initState();
    }

    /*@override
    void dispose() {
        super.dispose();
    }*/
    

    /*
    * @Description: 
    *
    * @param:
    *
    * @return: void
    */
    @override
    Widget build(BuildContext context) {
        //Variables
        //final ThemeAttribute theme_attribute = ThemeAttribute();
        final double deviceHeight = MediaQuery.of(context).size.height;
        final double deviceWidth = MediaQuery.of(context).size.width;

        //Set view
        switch(this._state_id)
        {
            case 0:
            {
                this._view = SafeArea(
                    child: Scaffold(
                        key: _scaffoldKey,
                            /*appBar: AppBar(
                                title: Row(
                                    children: <Widget>[
                                        //Image.asset('assets/icon.png'),
                                        SizedBox(width: 20),
                                        Text('Home', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0, color: Colors.grey))
                                    ]
                                ),
                                backgroundColor: Colors.white,
                                elevation: 0.0,
                            ),*/
                            body: Container(
                                //color: Colors.red,
                            ),
                            /*floatingActionButton:Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                    FloatingActionButton(
                                            onPressed: () {
                                                this._search_isLoading = true;
                                                callShowModalBottomSheet(context);
                                                //_showModalBottomSheetCustom(context);
                                            },
                                            child: Icon(Icons.search),
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.blue,
                                      ),
                                  ],
                            )*/
                    )
                );
                break;
            }

            case 1:
            {
                break;
            }

            case 2:
            {
                this._view = SafeArea(
                    child: Scaffold(
                        key: _scaffoldKey,
                        backgroundColor: Colors.grey[200],
                            /*appBar: AppBar(
                                title: Row(
                                    children: <Widget>[
                                        //Image.asset('assets/icon.png'),
                                        SizedBox(width: 20),
                                        Text('Home', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0, color: Colors.grey))
                                    ]
                                ),
                                backgroundColor: Colors.white,
                                elevation: 0.0,
                            ),*/
                            body: _mainDisplay(),
                            /*floatingActionButton:Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                    FloatingActionButton(
                                            onPressed: () {
                                                this._search_isLoading = true;
                                                callShowModalBottomSheet(context);
                                                //_showModalBottomSheetCustom(context);
                                            },
                                            child: Icon(Icons.search),
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.blue,
                                      ),
                                  ],
                            )*/
                    )
                );
                break;
            }


            default:
            {
                this._view = SafeArea(
                    child: Scaffold(
                        key: _scaffoldKey,
                        appBar: AppBar(
                          title: Row(
                              children: <Widget>[
                                  //Image.asset('assets/icon.png'),
                                  SizedBox(width: 20),
                                  Text('Home', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0, color: Colors.grey))
                              ]
                          ),
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                        ),
                        body: Container(),
                          /*floatingActionButton:Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FloatingActionButton(
                                        onPressed: () {
                                            this._search_isLoading = true;
                                            callShowModalBottomSheet(context);
                                            //_showModalBottomSheetCustom(context);
                                        },
                                        child: Icon(Icons.search),
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.blue,
                                  ),
                              ],
                          )*/
                    )
                );
                break;
            }
        }


        return this._view;
    }


    /*[Methods]*/

    /*
    * @Description: 
    *
    * @param:
    *
    * @return: void
    */
    Widget _pageLoader()
    {
        //final ThemeAttribute theme_attribute = ThemeAttribute();
        Utility utility = new Utility();
        final double deviceHeight = MediaQuery.of(context).size.height;
        final double deviceWidth = MediaQuery.of(context).size.width;

        if(this._isPageLoading)
        {
            return Container(
                height: 3,
                margin: EdgeInsets.only(bottom: 5),
                child: LinearProgressIndicator(
                    backgroundColor: Colors.black,
                ),
            );
        }
        else
        {
            return Container(
                height: 3,
                margin: EdgeInsets.only(bottom: 5)
            );
        }
    }

    /*
    * @Description: 
    *
    * @param:
    *
    * @return: void
    */
    Widget _mainDisplay() {
        //Variables
        //final ThemeAttribute theme_attribute = ThemeAttribute();
        Utility utility = new Utility();
        final double deviceHeight = MediaQuery.of(context).size.height;
        final double deviceWidth = MediaQuery.of(context).size.width;

        

        switch(this.mainDisplayState)
        {
            case 0:
            {
                return Container(
                    width: deviceWidth,
                    height: deviceHeight,
                    //color: Colors.blue,
                    //child: SingleChildScrollView(
                        child: Container(
                            child: Column(
                                children: <Widget>[
                                    this._pageLoader(),
                                ],
                            ),
                        ),
                    //),
                );
                break;
            }

            case 1:
            {
                return Container();
                break;
            }

            case 2:
            {
                return Container(
                    width: deviceWidth,
                    height: deviceHeight,
                    //color: Colors.blue,
                    child: Stack(
                        children: <Widget>[
                            Container(
                                width: deviceWidth,
                                height: deviceHeight,
                                //color: Colors.red,
                                child: Image.network(
                                    this._animal.image,
                                    //width: 100,
                                    //height: deviceHeight * 0.45,
                                    fit: BoxFit.fill
                                ),
                            ),
                            Positioned(
                                left: 30,
                                top: 30,
                                child: GestureDetector(
                                    child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 20,
                                    ),
                                    onTap: (){
                                        Navigator.pop(context);
                                    },
                                )
                            ),
                            Positioned(
                                right: 0,
                                child: Container(
                                    width: 60,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                        ),
                                    ),
                                    child: Icon(
                                        Icons.more_vert,
                                        color: Colors.black,
                                        size: 20,
                                    ), 
                                ),
                            ),
                            Positioned(
                                left: (deviceWidth/10),
                                bottom: 40,
                                child: Container(
                                    width: deviceWidth * 0.8,
                                    height: 80,
                                    padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)
                                        ),
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                            ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                child: Image.network(
                                                    this._animal.image,
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.fill,
                                                ),
                                            ),
                                            Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                    Text('Bird', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12.0, color: Colors.grey)),
                                                    SizedBox(
                                                        height: 5,
                                                    ),
                                                    Text(this._animal.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black)),
                                                ],
                                            ),
                                            Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                ),
                                                child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 20,
                                                ), 
                                            )
                                        ],
                                    ), 
                                ),
                            )  
                        ],
                    )
                );
                break;
            }

            default:
            {
                return Container();
                break;
            }

        }
    }
    
   
    /*
    * @Description: 
    *
    * @param:
    *
    * @return: void
    */
    Future<void> _getAnimal(id) async {
        print("START: _getAnimal");
        //Variables

        setState(() {
            this._isPageLoading = true;
        });
        
        
        this.animalService.getAnimal(id)
        .then((value) {
            // Run extra code here
            utility.Custom_Print("Function Complete Successfully");
            utility.Custom_Print(value.toString());

            setState(() {
                this._animal = new Animal.fromJson(value);
                this._isPageLoading = false;
                this._state_id = 2;
                this.mainDisplayState = 2;
            });
        },
        onError: (error) {
            utility.Custom_Print("Future returned Error");
            utility.Custom_Print(error.toString());
            //Toast.show(error['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

            setState(() {
                this._isPageLoading = false;
            });

            switch(error.runtimeType) { 

                case SocketException: {

                    SnackBar snackBar = SnackBar(
                        content: Text("Could not login at this time"),
                        action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                                // Some code to undo the change.
                            },
                        ),
                    );
                    
                    //_scaffoldKey.currentState.showSnackBar(snackBar);

                    Toast.show("Could not login at this time", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    break;
                }


                default: {

                    SnackBar snackBar =  SnackBar(
                        content: Text(error['error']),
                        action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                                // Some code to undo the change.
                            },
                        ),
                    );
                    
                    //_scaffoldKey.currentState.showSnackBar(snackBar);

                    Toast.show(error['error'].toString(), context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                }
            }
        })
        .catchError((error){
            utility.Custom_Print("Please try again later");
            utility.Custom_Print(error.toString());
            //Toast.show("Please try again later", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

            setState(() {
                this._isPageLoading = false;
            });
        });

        print("STOP: _getAnimal");
    }


    
}