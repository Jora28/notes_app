
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  static String textKey = "ISLOGGEDIN";
  // static String sharedPreferenceuUserNameKey = "USERNAMEKEY";
  // static String sharedPreferenceUserEmailKey = "USEREMAILKEY";

  static Future<bool> saveText(List<String> text)async{
    SharedPreferences pref  = await SharedPreferences.getInstance();
    return await pref.setStringList(textKey, text);
  }
  // static Future<bool> saveUserSharedPreference(String userName)async{
  //   SharedPreferences pref  = await SharedPreferences.getInstance();
  //   return await pref.setString(sharedPreferenceuUserNameKey, userName);
  // }

  //  static Future<bool> saveUserEmailSharedPreference(String userEmail)async{
  //   SharedPreferences pref  = await SharedPreferences.getInstance();
  //   return await pref.setString(sharedPreferenceUserEmailKey, userEmail);
  // }

  static Future<List<String>> getListTexts()async{
    SharedPreferences pref  = await SharedPreferences.getInstance();
    return  pref.getStringList(textKey);
  }
  // static Future<String> getUserNameSharedPreference()async{
  //   SharedPreferences pref  = await SharedPreferences.getInstance();
  //   return  pref.getString(sharedPreferenceuUserNameKey);
  // }
  // static Future<String> getUserEmailSharedPreference()async{
  //   SharedPreferences pref  = await SharedPreferences.getInstance();
  //   return  pref.getString(sharedPreferenceUserEmailKey);
  // }
}