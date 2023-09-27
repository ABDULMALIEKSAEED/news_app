import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/channelmodel.dart';
import 'package:news_app/model/homepagedetailsModel.dart';
import 'package:news_app/view/homepage.dart';

class ChannelsController{
    Future<List<ChannelModel>?> getdetails() async {
    String myUrl = "https://newsapi.org/v2/top-headlines/sources?apiKey=e485579ab2d6442191bbde150d0f3a21";
    print(myUrl);
    http.Response response = await http.get(Uri.parse(myUrl) );
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['sources'];
      print(response.body);
      try {
        List<ChannelModel> orders = body
            .map(
              (dynamic item) => ChannelModel.fromJson(item),
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