import 'package:crud_operation/crud.dart';
import 'package:flutter/material.dart';
import 'database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'edit_screen.dart';


class showData extends StatelessWidget {
  const showData({super.key});

  navigation(BuildContext context, Widget next){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> next));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          Route route = MaterialPageRoute(builder: (context) =>  crud());
          Navigator.push(context, route);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("All Data"),
      ),
      body: StreamBuilder(
        stream: firebaseFirestore.collection('notes').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot ){
          if(snapshot.hasData)
          {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index){
                  final res = snapshot.data!.docs[index];

                  return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.red,
                      ),
                      onDismissed: (v){
                        DataBaseServices.delete(res.id);
                      },
                      child: Card(
                        child: ExpansionTile(
                          title: Text("${res['title']}",

                          ),

                          children: [
                            Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Detail : ${res['detail']}"
                                )
                            ),
                          ],

                          leading: IconButton(
                            onPressed: (){
                              // Route route = MaterialPageRoute(builder: (context) =>  editData(id: res.id, title: res['title'], detail: res['detail'],));
                              // Navigator.push(context, route);
                              navigation(context,editData(title: res['title'], detail: res['detail'], id: res.id,));


                            },

                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ),
                  );
                }
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );

          }

        },
      ),
    );
  }
}
