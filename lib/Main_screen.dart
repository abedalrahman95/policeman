import 'package:flutter/material.dart';

import 'model/itame.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<Item>itemlist=[Item(image: "https://images.unsplash.com/photo-1550258987-190a2d41a8ba?auto=format&fit=crop&q=80&w=1374&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
  name:"pineapple", prise:2),
  Item(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Pomelo_fruit.jpg/799px-Pomelo_fruit.jpg", 
  name:"fruit", prise:1.8),
Item(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDjCfX--nSrgKIdHHnR4kWvAO-36Gjnr9didRjcZq8&s", 
  name:"pineapple", prise:2),
  Item(image: "https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D", 
  name:"fruit", prise:3),
  Item(image:"https://images.unsplash.com/photo-1577234286642-fc512a5f8f11?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
  name:"pineapple", prise:6),
  Item(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Pomelo_fruit.jpg/799px-Pomelo_fruit.jpg", 
  name:"fruit", prise:4),
Item(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDjCfX--nSrgKIdHHnR4kWvAO-36Gjnr9didRjcZq8&s", 
  name:"pineapple", prise:2),
  Item(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUjfo6Bt9FzmEfLU99nwvcm5G6S46Z5jSDpZRj3_A6&s ", 
  name:"fruit", prise:3),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("shoping app"),
          ),
      body:
            


      Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:itemlist.length,
              itemBuilder: (BuildContext context, int index) {
                return tile(context:context, item:itemlist[index]);
                //  itemimage:itemlist[index].image,
                //  itemname: itemlist[index].name,prise:itemlist[index].prise);
                
           
              },
            ),
          ),
          Container(height: 50,color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(" number of cart "),
                    Text(numberitem().toString())
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    Text(" Prise "),
                     Text( totalprise().toString()),
                  ],
                ),
               
              ],
            ),
          ),)
        ],
      ),
      
      
     );
  }
 int numberitem(){
 var totalqant=0;
 for(var x in itemlist){
       totalqant=totalqant+x.gte;

 }

  return totalqant;

 }

 double totalprise(){
  double totalprise=0;

  for(var i in itemlist){

    totalprise=totalprise+(i.gte * i.prise);
  }

 

  return totalprise ;

 }






  Widget tile({required context,required Item item}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[200],
        
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Image.network
                 (item.image,
                 width: 50,height:50,),
                 Column(
                   children: [
                     Text(item.name),
                     Text("${item.prise} JD"),
                     
                    
                   ],
                 ),
                 Expanded(child: Container(height: 50,)),
                 IconButton(onPressed: (){
                  if(item.gte==0){
                    return;
                  }
                  item.gte--;
                  setState(() {
                    
                  });
                 }, 
                 icon: Icon(Icons.remove)),
                 Text(item.gte.toString()),
                 IconButton(onPressed: (){
                  item.gte++;
                  setState(() {
                    
                  });

                 } , icon: Icon(Icons.add))
                
                ],
          ),
        ),
      
      ),
    );
    
  }
}