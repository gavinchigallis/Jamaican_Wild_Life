import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';

import '../Models/ThemeAttribute.dart';
import '../Models/Utility.dart';
import '../Models/Animal.dart';

class AnimalTileWidget extends StatefulWidget {
  int _state_id=0;
  Animal widgetDataObject;

  /*
  * @Description: Constructor
  *
  * @param:
  *
  * @return: void
  */
  AnimalTileWidget();

  /*
  * @Description: Constructor
  *
  * @param:
  *
  * @return: void
  */
  AnimalTileWidget.withData(Animal animalObject){
      this._state_id = 2;
      this.widgetDataObject = animalObject;
  }

  @override
  State<StatefulWidget> createState() {
      switch(this._state_id)
      {
            case 2:
            {
                return _AnimalTileWidget._withData(this._state_id, this.widgetDataObject);
                break;
            }

            default:
            {
                return _AnimalTileWidget();
                break;
            }
      }
    }
}

class _AnimalTileWidget extends State<AnimalTileWidget> {
    /*[Attributes]*/
    int _state_id=0;
    Animal widgetDataObject;
    Widget _view = Container();
    ThemeAttribute theme_attribute = ThemeAttribute();
    Utility utility = Utility();
    List<Widget> _productWidgets = [];
    bool _showProducts = false;
    int _contentIndex = 0;


    _AnimalTileWidget();

    /*
    * @Description: Constructor
    *
    * @param:
    *
    * @return: void
    */
    _AnimalTileWidget._withData(int state_id, Animal animalObject)
    {
        this._state_id = state_id;
        this.widgetDataObject = animalObject;
    }


    /*[Live Cycle]*/

    @override
    void initState(){
        super.initState();

        //this._buildProductWidgetList(this.widgetDataObject.products);
    }
    

    @override
    Widget build(BuildContext context) {
        final double deviceHeight = MediaQuery.of(context).size.height;
        final double deviceWidth = MediaQuery.of(context).size.width;

        //Set view
        switch(this._state_id)
        {
            case 0:
            {
                this._view = Container();
                break;
            }

            case 1:
            {
                break;
            }

            case 2:
            {
                this._view = Container(
                    //color: Colors.blue,
                    //height: 450,
                    width: deviceWidth,
                    margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                    child: GestureDetector(
                        child: Card(
                            child: _likeButton(),
                        ),
                        onTap: (){
                            //Navigator.pushNamed(context, "/product/"+widgetDataObject.product.id.toString());
                        },
                    )
                );
                break;
            }

            default:
            {
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
    Widget _likeButton()
    {
        final double deviceHeight = MediaQuery.of(context).size.height;
        final double deviceWidth = MediaQuery.of(context).size.width;

        //if(this.widgetDataObject.user_likes.length>0)
        if(false)
        {
            return Icon(
                Icons.favorite,
                color: Colors.red,
                size: 25,
            );
        }
        else
        {
            return Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 25,
            );
        }
    }


    void _postAddProductPostLikes(int product_posts_id) async
    {
        utility.Custom_Print("START: _postAddProductPostLikes");
        //Variables
        /*bool is_signed_in = await utility.Get_Login_Status();

        //Validate
        if(!is_signed_in){
            Navigator.pushNamed(context, '/login');
            return;
        }

        setState(() {
            //this._isAddingToCart = true;
        });
        
        this.productService.postAddProductPostsLike(product_posts_id)
        .then((value) async {

            setState(() {
                //this._isAddingToCart = false;
            });

            this._getProductPostsByID(product_posts_id);

            //Run extra code here
            utility.Custom_Print("Function Complete Successfully");

            utility.Custom_Print(value.toString());
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

            //_scaffoldKey.currentState.showSnackBar(snackBar);
        })
        .catchError((error){
            setState(() {
                //this._isLoading = false;
            });

            utility.Custom_Print("Please try again later");
            utility.Custom_Print(error.toString());
            throw(error);
            //Toast.show("Please try again later", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        });*/

        utility.Custom_Print("STOP: _postAddProductPostLikes");
    }


    void _postRemoveProductPostLikes(int product_posts_id) async
    {
        utility.Custom_Print("START: _postRemoveProductPostLikes");
        //Variables
        /*bool is_signed_in = await utility.Get_Login_Status();

        //Validate
        if(!is_signed_in){
            Navigator.pushNamed(context, '/login');
            return;
        }

        setState(() {
            //this._isAddingToCart = true;
        });
        
        this.productService.postRemoveProductPostsLike(product_posts_id)
        .then((value) async {

            setState(() {
                //this._isAddingToCart = false;
            });

            this._getProductPostsByID(product_posts_id);

            //Run extra code here
            utility.Custom_Print("Function Complete Successfully");

            utility.Custom_Print(value.toString());
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

            //_scaffoldKey.currentState.showSnackBar(snackBar);
        })
        .catchError((error){
            setState(() {
                //this._isLoading = false;
            });

            utility.Custom_Print("Please try again later");
            utility.Custom_Print(error.toString());
            throw(error);
            //Toast.show("Please try again later", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        });*/

        utility.Custom_Print("STOP: _postRemoveProductPostLikes");
    }
}