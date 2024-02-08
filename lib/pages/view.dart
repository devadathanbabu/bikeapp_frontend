
import 'package:bikeapp/model/bikemodel.dart';
import 'package:bikeapp/service/bikeservice.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<Bike>> ? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=BikeApiService().getData();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text("BIKEAPP",style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.white),),
          backgroundColor: Colors.black54.withOpacity(0.9),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot)
            {
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (value,index)
                    {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              tileColor: Colors.blueAccent.withOpacity(0.3),
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo.withOpacity(0.5),
                                child: Icon(Icons.directions_bike_rounded),
                              ),
                              title: Text("Name : " +snapshot.data![index].name.toString()),
                              subtitle: Text("Model : "+snapshot.data![index].model.toString()
                                  +"\n"+ "Year : "+snapshot.data![index].yearofmanu.toString()
                                  +"\n"+ "cc : " + snapshot.data![index].cc.toString()),
                            ),
                          ],
                        ),
                      );
                    }
                );
              }
              else
              {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 460,),
                    CircularProgressIndicator(),
                  ],
                );
              }
            }
            ),
      ) ,
    );
  }
}
