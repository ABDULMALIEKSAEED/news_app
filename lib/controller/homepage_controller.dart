import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/homepagedetailsModel.dart';
import 'package:news_app/view/homepage.dart';

class HomePage_Controller{
    Future<List<HomePageDetailsModel>?> getdetails() async {
    String myUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e485579ab2d6442191bbde150d0f3a21";
    print(myUrl); //MVC MODEL MVVN
    http.Response response = await http.get(Uri.parse(myUrl) );
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['articles'];
      print(response.body);
      try {
        List<HomePageDetailsModel> orders = body
            .map(
              (dynamic item) => HomePageDetailsModel.fromJson(item),
            )
            .toList();
        return orders;
      } catch (error) {
        print(error);

        return null;
      }
    } else {
      print(response.body);
      // throw "Error While getting Properties";
    }
  }


}