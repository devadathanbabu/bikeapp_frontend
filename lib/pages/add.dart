import 'package:bikeapp/service/bikeservice.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController txt1=new TextEditingController();
  TextEditingController txt2=new TextEditingController();
  TextEditingController txt3=new TextEditingController();
  TextEditingController txt4=new TextEditingController();

  void sendBikeData() async
  {

    final response = await BikeApiService().sendData(
        txt1.text,
        txt2.text,
        txt3.text,
        txt4.text);
    if(response["status"]=="success")
    {
      print("Successfully added");
    }
    else
    {
      print("Error");
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BIKEAPP",style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.white),),
          backgroundColor: Colors.black54.withOpacity(0.9),
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back,color: Colors.white,)
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                TextField(
                  controller:txt1,
                  decoration: InputDecoration(
                      hintText: "Enter  Name",
                      labelText: "Name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(

                  controller: txt2,
                  decoration: InputDecoration(
                      hintText: "Enter Model",
                      labelText: "Model",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: txt3,
                  decoration: InputDecoration(
                      hintText: "Enter Year of Manufacture",
                      labelText: "Year of Manufacture",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txt4,
                  decoration: InputDecoration(
                      hintText: "Enter CC",
                      labelText: "CC",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          )
                      ),
                      onPressed: sendBikeData,
                      child: Text("ADD")),
                )
              ],
            ),
          ),
        ),

      ),

    );
  }
}
