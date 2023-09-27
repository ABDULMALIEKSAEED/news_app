import 'package:flutter/material.dart';
import 'package:news_app/model/homepagedetailsModel.dart';
import 'package:news_app/view/homepage.dart';
import 'package:news_app/view/showdetails.dart';

class SearchPage extends StatefulWidget {
  final List <HomePageDetailsModel> data;
  final String text;
  const SearchPage({super.key, required this.text, required this.data});

  @override
  State<SearchPage> createState() => _SearchPageState();
}
TextEditingController searchtextcontroller=TextEditingController();
 List <HomePageDetailsModel> filterddata=[];
bool isloading=false;
class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    filterddata=[];
    for (var i = 0; i < widget.data.length; i++) {
      print("done");
      if (widget.data[i].title.contains(widget.text)) {
        
        filterddata.add(widget.data[i]);
        
      }
      if (i==widget.data.length-1) {
          setState(() {
            isloading=true;
            print(filterddata);
          });
        }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                  ),
                   textform(searchtextcontroller,"Search an every thing", TextInputType.text,context,
                   () {
                 filterddata=[];
                      for (var i = 0; i < widget.data.length; i++) {
                        print("_________________");
                        print("done");
                        if (widget.data[i].title.contains(searchtextcontroller.text)) {
                          print("first");
                          filterddata.add(widget.data[i]);
                          
                        }
                        if (i==widget.data.length-1) {
                          print("arrive");
                            setState(() {
                              isloading=true;
                            });
                          }
                      }
              }
                   ),
             
                  Container(
                alignment: Alignment.centerLeft,
                child: Text("Result:",style: TextStyle(color: Colors.black,fontSize: 25),)),
              SizedBox(height: 5,),
            isloading?
              Container(
              height: 200,
              child: ListView.builder(
                itemCount: filterddata.length,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return ShowDetails(url:filterddata[index].urlToImage.toString() ,
                          details: filterddata[index].description,
                          title: filterddata[index].title,
                          Desc: filterddata[index].description,
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
                          child: Text(filterddata[index].title,style: TextStyle(fontSize: 10),)),

                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: 
                            filterddata[index].urlToImage!=null?Image.network(
                                filterddata[index].urlToImage,
                                height: 50,
                            ):Image.asset(
                              filterddata[index].description!="ABDULMALIEK"? "assets/images.png":"assets/abd.jpeg",
                              height: 50,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },),
             ):CircularProgressIndicator(),
          ]),
        ),
      ),
    );
  }
}







Container textform(controllerText, String Title, TextInputType type,context, void Function()? onTap) {

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
            onTap:onTap,
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