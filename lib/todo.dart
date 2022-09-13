import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Todo extends StatefulWidget {

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override

  List<dynamic> lst=[""];
  var out = "";

  Widget build(BuildContext context) {

    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
//==============================Appbar=========================================================
      
      
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context, index)
        {

//==============================ClipPath=========================================================

          return SafeArea(
            child: Column(
        children: [
          SizedBox(height: _h*0.01,),
//==============================List=========================================================
Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(_h*0.04)
              ),      
              height: _h*0.11,
              child: ListTile(           
                title: Text("${lst[index]}"),          
                trailing: Container(
                padding: const EdgeInsets.only(top: 10),
                 width: _w*0.15,
                 child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context, 
                        builder: (context){
                          return AlertDialog(
                            title: TextField(
                              onChanged: (value)
                              {
                                out = value;
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                  setState(() {   
                                    lst.replaceRange(index, index+1, {out});                      
                                             });
                                },
                                child: Text("Edit"),)
                            ],
                          );
                        });
                      },
                      child: FaIcon(FontAwesomeIcons.pencil,size: _h*0.04),  
                    ),
                    SizedBox(width: _w*0.02,),
                    GestureDetector(
                      onTap: (){
                        setState(() {   
                          lst.removeAt(index);
                               });
                      },
                      child: FaIcon(FontAwesomeIcons.eraser,size: _h*0.04),         
                    ),
                  ],
                 ),

                ),
              ),
            ),
        ],
      ),
             
          );
        }
        ),

//==============================Floatin Action Button====================================================

        floatingActionButton: FloatingActionButton(onPressed:(){
                    showDialog(context: context, 
                    builder: (context)
                    { return AlertDialog(
                      title: TextField(
                        onChanged: (value){
                          out = value;
                        },
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                            setState(() {
                                         lst.add(out);                 
                                                        });
                          },
                          child: Text("Add"))
                      ],
                    );
                   });
                  },
                  child: FaIcon(FontAwesomeIcons.circlePlus,size: _h*0.04), 
                  ),
    );
   }
}