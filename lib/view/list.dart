import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/controller/channelscontroller.dart';
import 'package:news_app/controller/homepage_controller.dart';
import 'package:news_app/model/channelmodel.dart';
import 'package:news_app/model/homepagedetailsModel.dart';
import 'package:news_app/view/searchpage.dart';
import 'package:news_app/view/showdetails.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}
late List <ChannelModel> mychannel;
ChannelsController _channelsController=ChannelsController();
bool isloading=false;
TextEditingController searchtextcontroller=TextEditingController();
class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    _channelsController.getdetails().then((value) {
      mychannel=value!;
      setState(() {
        isloading=true;
      });
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              
              textform(searchtextcontroller,"Search an every thing", TextInputType.text,context),
             
              isloading?
              Container(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                height:500,
                 child: GridView.builder(
                   // shrinkWrap: true,
                   itemCount: mychannel.length,
                   itemBuilder: (ctx, i) {
                     return InkWell(
                       onTap: () {
                        //  Navigator.push(context,
                        //       MaterialPageRoute(builder: (BuildContext context) {
                        //       return pages[i];
                        //      }));
                         
                       },
                       child: Container(
                         height: 200,
                         color: Colors.grey[200],
                         margin: EdgeInsets.all(5),
                         padding: EdgeInsets.all(5),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Container(
                               alignment: Alignment.center,
                               child: Image.asset("assets/cnn.png")),
                              
                             Container(
                               alignment: Alignment.center,
                               child: Text(mychannel[i].name,style: TextStyle(fontSize: 7),)),
                           Container(
                            height: 25,
                             child: MaterialButton(
                              color: Colors.black,
                              child: Text("ok",style: TextStyle(color: Colors.white),),
                              onPressed: () {
                               
                             },),
                           )
                           ],
                         )
                       ),
                     );
                   },
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                     childAspectRatio: 1.2,
                     crossAxisSpacing: 15,
                     mainAxisSpacing: 10,
                     mainAxisExtent: 120,
                   ),
                 ),
               ):CircularProgressIndicator(),




            ],
          ),
        ),
      ),
    );
  }
}





Container textform(controllerText, String Title, TextInputType type,context) {

    return Container(
      height: 60,
      child: TextFormField(
        // textAlign: TextAlign.center,
       
        keyboardType: type,
        cursorColor: Colors.black,
        controller: controllerText,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: InkWell(
            onTap: () {
          // Navigator.push(context,
          //               MaterialPageRoute(builder: (BuildContext context) {
          //             return SearchPage(text: controllerText.text,data:mydata);
          //           }));
              },
            child: Container(
              padding: EdgeInsets.all(3),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Icon(Icons.search)),
            ),
          ),
          enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: const Color.fromARGB(255, 235, 233, 233))),
          filled: true,
          fillColor: Colors.grey[200],
          
          hintText: Title,
          hintStyle:
              TextStyle(color: Color(0xff8c9289), fontFamily: 'Cobe',fontSize: 14),
        ),
      ),
    );
  }