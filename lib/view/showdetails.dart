import 'package:flutter/material.dart';

class ShowDetails extends StatelessWidget {
  final String url;
  final String Desc;
  final String title;
  final String details;
  const ShowDetails({super.key, required this.url, required this.details, required this.title, required this.Desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                  ),
                   Container(
                alignment: Alignment.centerLeft,
                child: IconButton(onPressed: () {
                }, icon: Icon(Icons.menu)),
              ),
                ],
              ),
              
              SizedBox(height: 50,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(title==null?"no data to show":title,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,)),
                SizedBox(height: 15,),
              ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: 
                            url!="null"?Image.network(
                                url,
                                height: 200,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(child: Container(
                                    height: 200,
                                    child: Text('image didnt exist')));
                                },
                            ):Image.asset(
                              Desc!="ABDULMALIEK"? "assets/images.png":"assets/abd.jpeg",
                              height: 200,
                              ),
                        ),
              SizedBox(height: 15,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(details==null?"no data to show":details,style: TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}