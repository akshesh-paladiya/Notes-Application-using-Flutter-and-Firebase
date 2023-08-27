import 'package:crud_operation/database_service.dart';
import 'package:flutter/material.dart';

class editData extends StatelessWidget {

  String id;
  String title;
  String detail;

  editData({Key? key, required this.title,required this.detail,required this.id}):super(key: key);

  TextEditingController titleC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notes App"),
        backgroundColor: Colors.black,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleC,
                    validator: (v){
                      if(v!.isEmpty){
                        return "Please Enter Detail";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "$title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: detailC,
                    validator: (v){
                      if(v!.isEmpty){
                        return "Please Enter Detail";
                      }
                      return null;
                    },
                    maxLines: 8,
                    minLines: 1,
                    decoration: InputDecoration(
                        labelText: "$detail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),

                  const SizedBox(height: 20,),

                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          minimumSize: MaterialStateProperty.all(Size(double.infinity, 40))
                      ),
                      onPressed: (){
                        if(formkey.currentState!.validate()){
                          DataBaseServices.updateData(id!,titleC.text, detailC.text,);
                        }
                      },
                      child: const Text("UPDATE")
                  )
                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}
