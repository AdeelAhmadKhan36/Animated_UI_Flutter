import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.only(left: 20,),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Go Premium",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.only(top: 20
                    ),
                    child: Image(image: AssetImage('Assets/img.png',),height: 200,width: 183,),
                  )
                ],
              ),
              const Row(

                children: [
                  Icon(Icons.add_a_photo_outlined,color: Colors.deepOrange,size: 25,),
                  SizedBox(width: 10,),
                  Text("Unlimited Storage for photos,videos",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Icon(Icons.ad_units,color: Colors.deepOrange,size: 25,),
                  SizedBox(width: 10,),
                  Text("Unlimited exports for medias",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Icon(Icons.ads_click_rounded,color: Colors.deepOrange,size: 25,),
                  SizedBox(width: 10,),
                  Text("Remove all the advertisements",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Icon(Icons.delete_forever_outlined,color: Colors.deepOrange,size: 25,),
                  SizedBox(width: 10,),
                  Text("Recover files you deleted from trash",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 30),
                  Container(
                    // width: 450,
                    
                    child: Image.asset("Assets/button.png"),
                    
                  )


              
            ],
          ),
        ),
      ),
    );
  }
}

