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
import '../Pages/PhotoPage.dart';
import '../Widgets/AnimalTileWidget.dart';
import '../Services/AnimalService.dart';



/*
* @Description:
*
*/
class HomePage extends StatefulWidget {
  /*[Attributes]*/

  HomePage()
  {

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
    return _HomePage();
  }
}

/*
* @Description:
*
* @param:
*
* @return: void
*/
class _HomePage extends State<HomePage> with WidgetsBindingObserver{
    /*[Attributes]*/
    int _state_id = 0;
    int mainDisplayState = 0;
    Widget _view = Container();
    ThemeAttribute theme_attribute = ThemeAttribute();
    Utility utility = new Utility();
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    bool _isPageLoading = false;
    AnimalService animalService = new AnimalService();
    List _animals = [];
    

    /*[Constructors]*/


    /*
    * @Description: Constructor
    *
    * @param:
    *
    * @return: void
    */
    _HomePage()
    {

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

        this._getAnimals();

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
                                    Container(
                                        padding: EdgeInsets.only(left: 20, right: 20),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              
                                            ],
                                        ),
                                    ),
                                    Container(
                                        height: deviceHeight-220,
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                                Icon(Icons.shopping_cart, color: Colors.grey[600], size: 100),
                                                SizedBox(height: 10),
                                            ],
                                        ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 20, right: 20),
                                        margin: EdgeInsets.only(top: 10, bottom: 10),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                                
                                            ],
                                        ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 20, right: 20),
                                        child: FlatButton(
                                            color: Colors.black,
                                            child: Container(
                                                constraints: BoxConstraints(
                                                    minWidth: deviceWidth-100
                                                ),
                                                margin: EdgeInsets.all(10),
                                                child: Center(
                                                    //child:,
                                                )
                                            ),
                                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                                            onPressed: (){
                                                
                                            },
                                        )
                                    ),
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
                    //child: SingleChildScrollView(
                        child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    this._pageLoader(),
                                    Container(
                                        padding: EdgeInsets.only(left: 20, right: 20),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                                Text('Learn more', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0, color: Colors.black)),
                                                Text('about Jamaican wild life', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24.0, color: Colors.black)),
                                            ],
                                        )
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 25.00, top: 10.00, right: 25.00, bottom: 5.00),
                                        constraints: BoxConstraints(
                                            maxHeight: 70,
                                            minHeight: 70,
                                        ),
                                        child: TextField(
                                            keyboardType: TextInputType.text,
                                            style: new TextStyle(
                                              fontSize: 16.0,
                                              //height: 0.35,
                                              color: Colors.grey                  
                                            ),
                                            decoration: InputDecoration(
                                                labelText: "Search",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                //icon: Icon(Icons.search, color: Colors.grey),
                                                prefixIcon:  Icon(Icons.search, color: Colors.grey),
                                            ),
                                            onSubmitted: (String value){
                                                if(value!="")
                                                {
                                                    //Navigator.pushNamed(context, "/search/"+value);
                                                }
                                            },
                                            onChanged: (String value) {
                                                setState(() {
                                                    //_passwordValue = value;
                                                });
                                            }
                                        ),
                                    ),
                                    SizedBox(
                                        height: 20,
                                    ),
                                    CarouselSlider(
                                        height: deviceHeight - 250,
                                        viewportFraction: 0.7,
                                        initialPage: (this._animals.length/2).round(),
                                        reverse: false,
                                        enlargeCenterPage: true,
                                        enableInfiniteScroll: false,
                                        items: this._animals.map((animalItem) {

                                            return new Builder(
                                                builder: (BuildContext context) {
                                                    Animal animal = new Animal.fromJson(animalItem);
                                                    
                                                    return GestureDetector(
                                                        child: Container(
                                                            margin: EdgeInsets.only(left: 10, right: 10),
                                                            child: new AnimalTileWidget.withData(animal),
                                                        ),
                                                        onTap: (){
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute<bool>(
                                                                    builder: (BuildContext context) => new PhotoPage(animal.id)
                                                                )
                                                            );
                                                        }
                                                    );
                                                },
                                            );
                                        }).toList(),
                                        onPageChanged: (index){},
                                    ),
                                ],
                            ),
                        ),
                    //),
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
    Future<void> _getAnimals() async {
        print("START: _getAnimals");
        //Variables

        setState(() {
            this._isPageLoading = true;
        });
        
        
        this.animalService.getAnimals()
        .then((value) {
            // Run extra code here
            utility.Custom_Print("Function Complete Successfully");
            utility.Custom_Print(value.toString());

            setState(() {
                this._isPageLoading = false;
                this._state_id = 2;
                this.mainDisplayState = 2;
                this._animals = value;
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

        print("STOP: _getAnimals");
    }


    
}