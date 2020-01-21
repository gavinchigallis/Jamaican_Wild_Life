import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Utility
{
    //Attributes
    final String _App_Name = 'Jamaica Wild Life App';
    final String _App_Version = "1.0.0";
    final String _App_Version_name = 'Jamaica Wild Life App';
    final int _App_Build_Number = 1;
    final String _App_URL = 'http://example.com/';
	  final String _App_API_URL = 'http://example.com/API/';
    final String _App_STORAGE_URL = 'http://example.com/storage/app/public/';
    final String _Content_Type = "application/json";
    final _AllowDebugging = true;
    final _DebugWithIDOnly = false;
    bool _Debug = false;
    int _Debug_Print_ID = 0;

    //Constructure
   Utility();

    //Methods
    String get App_Name{
        return _App_Name;
    }


    String get App_Version{
        return _App_Version;
    }

    int get App_Build_Number{
        return _App_Build_Number;
    }

    String get App_Version_name{
        return _App_Version_name;
    }


    String get App_URL{
        return _App_URL;
    }


    String get App_API_URL{
        return _App_API_URL;
    }


    String get App_STORAGE_URL{
        return _App_STORAGE_URL;
    }


    bool get Debug{
        return _Debug;
    }

    set Set_Debug(bool debugStatus){
        this._Debug=debugStatus;
    }

    int get Debug_Print_ID{
        return _Debug_Print_ID;
    }

    set Set_Debug_Print_ID(int debugPrintID){
        this._Debug_Print_ID=debugPrintID;
    }

    String get Content_Type{
        return _Content_Type;
    }

    /*
    * @Description: Allow for printing on the console if debug is on
    *               and for a print id.
    *
    * @param:
    *
    * @return: void
    */
    void Custom_Print(String message,{int print_id})
    {
        if(this._AllowDebugging)
        {
            if(this._DebugWithIDOnly)
            {
                if(this._Debug)
                {
                    if(print_id!=null)
                    {
                        if(print_id==this._Debug_Print_ID)
                        {
                            print(message);
                        }
                    }
                }
            }
            else
            {
                if(this._Debug)
                {
                    print(message);
                }
            }
        }
    }

    /*
    * @Description: Format large number to summarize
    *               eg. 1,000,000 becomes 1M
    *
    * @param:
    *
    * @return: void
    */
    String Large_Number_Formatter(int number)
    {
        if(number > 999999999999) //1T and Over
        {
            return (number/1000000000000).toStringAsFixed(1)+"T";
        }
        else if(number > 9999999999) //10B and Over
        {
            return (number/1000000000).toStringAsFixed(1)+"T";
        }
        else if(number > 999999999) //1B and Over
        {
            return (number/1000000000).toStringAsFixed(1)+"B";
        }
        else if(number > 99999999) //10M and Over
        {
            return (number/1000000000).toStringAsFixed(1)+"B";
        }
        else if(number > 999999) //1M and Over
        {
            return (number/1000000).floor().toString()+"M";
        }
        else if(number > 9999) //10K and Over
        {
            return (number/1000000).toStringAsFixed(1)+"M";
        }
        else if(number > 999) //1K and Over
        {
            return (number/1000).floor().toString()+"K";
        }
        else
        {
            return number.toString();
        }
    }


    /*
    * @Description: Formats the data base time
    *
    * @param:
    *
    * @return: String
    */
    String dateFormatter(String datevalue){
        /*final f = new DateFormat('hh:mm aaa MMMM dd, yyyy');
        var parsedDate = DateTime.parse(datevalue);*/

        return "";//f.format(parsedDate);
    }


    /*
    * @Description: Formats the data base time
    *
    * @param:
    *
    * @return: String
    */
    String getStringFixedLength(String value, {int length = 25}){
        if(value.length<25)
        {
            return value;
        }
        else
        {
            return value.substring(0,length-5)+"...";
        }
    }


    /*
    * @Description: 
    *
    * @param:
    *
    * @return: String
    */
    String getFirstLetterCapitalized(String value) {
        String s = 'this is a string';
        return "${value[0].toUpperCase()}${value.substring(1)}";
    }
}