import 'package:flutter/material.dart';

List<String>signs=[
  'you should take this medicine','itis okay, be calm',
  'hope you treat well','thanks','have a nice day',
  'hi','my name is mohamed','iam 18 years old',
  'is it bumped'
];
// ignore: non_constant_identifier_names
CreateAlertDialog(BuildContext context,index){
    return showDialog(context: context,builder:(context){
    return AlertDialog(
    
      title: Text('reply',style: TextStyle(
        color:Colors.white,
       
      ),),
      content:Image.asset('assets/${signs[index]}.gif')
                  
    );
    });
  }

class Reply extends StatefulWidget {
  @override
  _ReplyState createState() => _ReplyState();
}

class _ReplyState extends State<Reply> {
  
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
     appBar: AppBar(
       title:Text('Reply'),
       centerTitle:true,
       actions:<Widget>[
         IconButton(
           onPressed: (){
             Navigator.pushReplacementNamed(context, 'home');
           },
           icon: Icon(Icons.east),
           )
       ],
     ),
     body:ListView.builder(
       itemCount: signs.length,
       itemBuilder: (context,index){
         return Padding(
           padding:  const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
           child: Card(
             child:ListTile(
               title: Text(signs[index]),
               onTap:(){
                 CreateAlertDialog(context, index);
               },
             ),
           ),
           );
       }
       ),
    );
  }
}


