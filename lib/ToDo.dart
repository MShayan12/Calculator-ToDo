import "package:flutter/material.dart";

  class Todo extends StatefulWidget {
    
  
    @override
    _TodoState createState() => _TodoState();
  }
  
  class _TodoState extends State<Todo> {
    var output = "";
    List<dynamic> lst = [1,2,3];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context,index){
            return Container(
              height: 50,color: Colors.orange,margin: EdgeInsets.only(top:10),
              child: ListTile(title: Text("${lst[index]}"),
              trailing: Container(
                width: 50,
                child: Row(
                  children: [
                    GestureDetector(onTap: (){
                      setState(() {
                        lst.removeAt(index);
                      });
                    },child: Icon(Icons.delete)),
                    GestureDetector(onTap: (){

                      showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Edit Item"),
              
              content: TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: 'Text here',
                ),
                onChanged: (value){
                  output = value;
                },
                
                
                ),
                
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                 setState(() {
                   lst.replaceRange(index, index+1, {output});
                 });
                }, child: Text("Edit Item"))
              ],
              
            );
          });
                    },child: Icon(Icons.edit)),
                  ],
                ),
              ),
              )
              );
          }),
        floatingActionButton: FloatingActionButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Add New Item"),
              
              content: TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: 'Text here',
                ),
                onChanged: (value){
                  output = value;
                },
                
                
                ),
                
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                 setState(() {
                   lst.add(output);
                 });
                }, child: Text("Add Item"))
              ],
              
            );
          });
        }, child: Text("Add"),),
      );
    }
  }
