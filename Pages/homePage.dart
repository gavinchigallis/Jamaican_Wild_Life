import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../Models/ThemeAttribute.dart';
import '../Models/Utility.dart';



/*
* @Description:
*
*/
class cartPage extends StatefulWidget {
  /*[Attributes]*/

  cartPage()
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
    return _cartPage();
  }
}

/*
* @Description:
*
* @param:
*
* @return: void
*/
class _cartPage extends State<cartPage> with WidgetsBindingObserver{
    /*[Attributes]*/
    int _state_id=2;
    int mainDisplayState = 0;
    Widget _view = Container();
    ThemeAttribute theme_attribute = ThemeAttribute();
    Utility utility = new Utility();
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    List _new_products = [1,2,3];
    

    /*[Constructors]*/


    /*
    * @Description: Constructor
    *
    * @param:
    *
    * @return: void
    */
    _cartPage()
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

        this._getShoppingCart();

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
                                color: Colors.red,
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

        if(false)
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
                                        child: SingleChildScrollView(
                                            child:  Column(
                                                    //children: this._shoppingCartItems_widgets,
                                                ),
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
                                                    
                                                )
                                            ),
                                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                                            onPressed: (){
                                                Navigator.pushNamed(context, '/checkout');
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
    Future<void> _getShoppingCart() async {
        print("START: _getShoppingCart");
        //Variables

        setState(() {
            //this._shoppingCartIsLoading = true;
        });
        
        
        /*this.shoppingCartService.getShoppingCart()
        .then((value) {
            // Run extra code here
            utility.Custom_Print("Function Complete Successfully");
            utility.Custom_Print(value.toString());

            setState(() {
                this._shoppingCartIsLoading = false;
                this._shoppingCartItems = value;
            });
            
            this._buildShoppingCartList(this._shoppingCartItems);
        },
        onError: (error) {
            utility.Custom_Print("Future returned Error");
            utility.Custom_Print(error.toString());
            //Toast.show(error['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

            setState(() {
                this._shoppingCartIsLoading = false;
            });
        })
        .catchError((error){
            utility.Custom_Print("Please try again later");
            utility.Custom_Print(error.toString());
            //Toast.show("Please try again later", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

            setState(() {
                this._shoppingCartIsLoading = false;
            });
        });*/

        print("STOP: _getShoppingCart");
    }


    /*
    * @Description: 
    *
    * @param:
    *
    * @return: void
    */
    void _buildShoppingCartList(product){
        print("START: _buildShoppingCartList");
        //Variables
        final double deviceHeight = MediaQuery.of(context).size.height;
        final double deviceWidth = MediaQuery.of(context).size.width;
        int shoppingCartIndexer = 1;


        //Remove any existing chld items in this widget
        //this._shoppingCartItems_widgets.clear();
        //this._subTotal = 0;

        /*if( this._shoppingCartItems.length==0)
        {
            setState(() {
                this.mainDisplayState = 0;
            });

            return;
        }

        
        this._shoppingCartItems.forEach((dynamic shoppingCartItemsObject){
            CartItem cart_item = CartItem.fromJson(shoppingCartItemsObject);

            shoppingCartWidget shoppingCartWidgetObject = new shoppingCartWidget.withData(cart_item);

            Widget shoppingCartDismissible = new Dismissible(
                key: new ValueKey(shoppingCartIndexer),
                child: shoppingCartWidgetObject,
                background: Container(
                    color: Colors.red,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(right: 50),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        Text(this.utility.getFirstLetterCapitalized(Provider.of<LocaleObject>(context, listen: false).translate("remove")), style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                                        Icon(Icons.delete, size: 30, color: Colors.white,)
                                    ],
                                ),
                            )
                        ],
                    ),
                ),
                onDismissed: (direction) async {
                    setState(() {
                        this._shoppingCartItems_widgets.clear();
                        this._shoppingCartItems.clear();
                        this._subTotal = 0;
                        this._shoppingCartItems.length;
                    });
                    
                    this._getShoppingCart();
                    //this.dispose();
                },
                confirmDismiss: (direction) async {
                    await this._removeFromCart(cart_item.getID);
                    return true;
                },
            );

            Widget shoppingCartLineItemWidget = GestureDetector(
                child: shoppingCartDismissible,
                onTap: (){
                    Navigator.of(context).pushNamed('/product/'+cart_item.getProduct.id.toString());
                },
            );

            this._shoppingCartItems_widgets.add(shoppingCartLineItemWidget);

            //Increase Total count
            this._subTotal += (cart_item.getProduct.getPrice * cart_item.getAmount);

            shoppingCartIndexer += 1;
        });

        //Set to to trigger rebuild
        //if (!mounted) return;

        setState(() {
            this.mainDisplayState = 2;
            this._subTotal = this._subTotal;
        });*/

        print("STOP: _buildShoppingCartList");
    }


    Future<bool> _removeFromCart(int cart_id) async
    {
        utility.Custom_Print("START: _removeFromCart");
        //Variables
        //bool is_signed_in = await utility.Get_Login_Status();
        bool result = false;

        //Validate
        /*if(!is_signed_in){
            Navigator.pushNamed(context, '/login');
            return false;
        }


        setState(() {
            //this._isLoading = true;
        });
        
        this.shoppingCartService.postRemoveFromCart(cart_id)
        .then((value) async {

            setState(() {
                //this._isLoading = false;
            });

            //Run extra code here
            utility.Custom_Print("Function Complete Successfully");

            utility.Custom_Print(value.toString());

            Toast.show(this.utility.getFirstLetterCapitalized(Provider.of<LocaleObject>(context, listen: false).translate("removed")), context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        },
        onError: (error) {
            setState(() {
                //this._isLoading = false;
            });

            utility.Custom_Print("Future returned Error");
            utility.Custom_Print(error.toString());
            
            SnackBar snackBar = SnackBar(
                content: Text(error['Error']),
                action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                                  // Some code to undo the change.
                    },
                ),
            );

            _scaffoldKey.currentState.showSnackBar(snackBar);
        })
        .catchError((error){
            setState(() {
                //this._isLoading = false;
            });

            utility.Custom_Print("Please try again later");
            utility.Custom_Print(error.toString());
            throw(error);
            //Toast.show("Please try again later", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        });

        utility.Custom_Print("STOP: _removeFromCart");*/
        return result;
    }
}