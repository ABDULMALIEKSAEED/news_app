import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/controller/homepage_controller.dart';
import 'package:news_app/model/homepagedetailsModel.dart';
import 'package:news_app/view/searchpage.dart';
import 'package:news_app/view/showdetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
bool isloading=false;
late List <HomePageDetailsModel> mydata;
HomePage_Controller _page_controller=HomePage_Controller();
String currentindex="all";
List <String> myitem=["all","business","gaming","techno"];
TextEditingController searchtextcontroller=TextEditingController();
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _page_controller.getdetails().then((value) {
      mydata=value!;
      mydata.insert(0,HomePageDetailsModel(source: "2d",
       title: "Welcome ABDULMALIEK ALSHAHRANI To the team we wish  you good luck with us",
        description: "ABDULMALIEK",
         urlToImage: null));
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
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("HeadLine",style: TextStyle(color: Colors.green,fontSize: 25),)),
              SizedBox(height: 5,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("today,february,23rd",style: TextStyle(color: Colors.grey,fontSize: 15),)),
              SizedBox(height: 20,),

              textform(searchtextcontroller,"Search an every thing", TextInputType.text,context),
             

             Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                    currentindex=myitem[index];
                    });
                  },
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color:currentindex!=myitem[index]?const Color.fromARGB(255, 232, 229, 229):Colors.black ,
                      ),
                    margin: EdgeInsets.symmetric(vertical:20,horizontal: 6),
                    padding: EdgeInsets.all(5),
                    child: Center(child: Text(myitem[index],style: TextStyle(color: currentindex==myitem[index]?Colors.white:Colors.grey[700]),)),
                  ),
                );
              },),
             ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Trending",style: TextStyle(fontSize: 25),)),
              SizedBox(height: 10,),


             isloading?
              Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ShowDetails(url:mydata[index].urlToImage.toString() ,
                      details: mydata[index].description,
                      title: mydata[index].title,
                        Desc: mydata[index].description,
                      );
                    }));
                    
                  },
                  child: Container(
                    decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                         ),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    
                    width:200,
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: 
                            mydata[index].urlToImage!=null?Image.network(
                                mydata[index].urlToImage,
                                height: 100,
                            ):Image.asset(
                              fit: BoxFit.cover,
                              mydata[index].description!="ABDULMALIEK"? "assets/images.png":"assets/abd.jpeg",
                              height: 100,
                              ),
                        ),
                        Text(mydata[index].title,style: TextStyle(fontSize: 10),)
                      ],
                    ),
                  ),
                );
              },),
             ):CircularProgressIndicator(),






             Container(
                alignment: Alignment.centerLeft,
                child: Text("Latest",style: TextStyle(fontSize: 25),)),
              SizedBox(height: 10,),


             isloading?
              Container(
              height: 200,
              child: ListView.builder(
                itemCount: mydata.length,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ShowDetails(url:mydata[index].urlToImage.toString() ,
                      details: mydata[index].description,
                      title: mydata[index].title,
                        Desc: mydata[index].description,
                      );
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                         ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    
                    width:200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Container(
                          width: 150,
                          child: Text(mydata[index].title,style: TextStyle(fontSize: 10),)),

                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: 
                            mydata[index].urlToImage!=null?Image.network(
                                mydata[index].urlToImage,
                                height: 50,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(child: Text('image didnt exist'));
                                },
                            ):Image.asset(
                              mydata[index].description!="ABDULMALIEK"? "assets/images.png":"assets/abd.jpeg",
                              height: 50,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },),
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
          Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SearchPage(text: controllerText.text,data:mydata);
                    }));
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