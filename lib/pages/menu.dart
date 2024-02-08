import 'package:bikeapp/pages/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BIKEAPP",style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.white),),
          backgroundColor: Colors.black54.withOpacity(0.9),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Menu",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
            SizedBox(width: 20,),
            Container(
              height: 390,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.redAccent.withOpacity(0.4),
              ),

              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Icon(Icons.directions_bike_outlined,size: 40,),
                      TextButton(
                          onPressed: (){

                          }, child: Text("Bike Entry",
                        style: TextStyle(fontSize: 20,
                            color: Colors.black87),
                      ))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 17,),
                      Icon(CupertinoIcons.eye_fill,size: 40,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=>ViewPage()));
                      },
                          child: Text("Bike Details",
                            style: TextStyle(fontSize: 20,
                                color: Colors.black87),))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 17,),
                      Icon(CupertinoIcons.search,size: 40,),
                      TextButton(onPressed: (){

                      },
                          child: Text("Bike Search",
                            style: TextStyle(fontSize: 20,
                                color: Colors.black87),))
                    ],
                  )

                ],
              ),
            ),
          ],
        )

    );
  }
}
