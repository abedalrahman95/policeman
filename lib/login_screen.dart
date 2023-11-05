

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poleceapp/Main_screen.dart';
 bool hasbeen=false;

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
  
}

class _LoginscreenState extends State<Loginscreen> {

   TextEditingController emailcont = TextEditingController(text: "abed");
    TextEditingController passcont = TextEditingController(text: "123");

  
   bool passwordVisible=false; 
  @override
    
  void initState() {
    
   
    const onesec=Duration(seconds: 1);
    Timer.periodic(onesec, (Timer timer) { 
       hasbeen=!hasbeen;
           setState(() {
             
           });
    });super.initState();
   
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body:
      SafeArea(
      
       child: Column(
        children: [
          Center(
            child:Image.network("https://thumbs.dreamstime.com/z/police-officer-badge-13977603.jpg",width: 250,)
            ),
            const SizedBox(height: 8,),

            const Text("police app",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(top:8,bottom: 8,right: 25,left: 25),
              child: Row(
                children: [
                   Expanded(
                    child: Container(height: 50, 
                    decoration: BoxDecoration(color:hasbeen?Colors.red:Colors.blue,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(25),bottomLeft:Radius.circular(25)),
                     )
                     )),
                    Expanded(child: Container(height: 50, decoration: BoxDecoration(color:hasbeen?Colors.blue:Colors.red,
                    borderRadius: BorderRadius.only(topRight:Radius.circular(25),bottomRight:Radius.circular(25))),
                    )),

                  
                ],
              ),
            ),
           
           Padding(
            padding:  const EdgeInsets.only(top: 8,left:20,right: 25),
            child:  TextField(
              controller: emailcont,
              decoration:  InputDecoration(
                labelText: "username",
                border: const OutlineInputBorder(borderSide:BorderSide(color:Colors.red,)),
                 
                suffixIcon: IconButton( icon:const Icon(Icons.close), onPressed: () { 
                  emailcont.text="";

                },)
                    
                    ), 
              ),
              
            ),
          



           Padding(
             padding: const EdgeInsets.only(top: 8,left:20,right: 25),

             child: TextField( 
                  controller: passcont,
                  obscureText: passwordVisible, 
                  decoration: InputDecoration( 
                    
                    border: const UnderlineInputBorder(), 
                    hintText: "Password", 
                    labelText: "Password", 
                    helperText:"Password must contain special character", 
                    helperStyle:const TextStyle(color:Colors.green), 
                    suffixIcon: SizedBox(
                      width: 80,
                      child: Row(
                        children: [
                          IconButton( 
                            icon: Icon(passwordVisible 
                                ? Icons.visibility 
                                : Icons.visibility_off), 
                            onPressed: () { 
                              setState( 
                                () { 
                                  passwordVisible = !passwordVisible; 
                                }, 
                              ); 
                            }, 
                          ),
                          IconButton( 
                            icon: const Icon (Icons.close), 
                            onPressed: () { 
                              setState( 
                                () { 
                                  passcont.text="";
                                }, 
                              ); 
                            }, 
                          ),
                        ],
                      ),
                    ), 
                    alignLabelWithHint: false, 
                    filled: true, 
                  ), 
                  keyboardType: TextInputType.visiblePassword, 
                  textInputAction: TextInputAction.done,
             ),
             
           ),
            const SizedBox(height: 20),

           ElevatedButton(onPressed: (){
           
            if(emailcont.text.isEmpty  || passcont.text.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("please enter your email & password"),
              ));
            
            }
            else{
                  if(emailcont.text !="abed" ||passcont.text !="123"){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("email or password is not valid"),
              ));
                  }
                else{  
                 
                 Navigator.of(context).push(MaterialPageRoute(builder: (cont)
                 {return Mainscreen();
                 })
                 );
                
            }
            

            }

           }, child: const Text("login"))


          
            
         
        ]
     
         ),
     ),);
  }
}