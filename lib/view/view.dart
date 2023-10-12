import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controller.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({Key? key}) :super(key: key);

  double covertToInt(dynamic a){

    if(a != ""){
    return double.parse(a);}
    else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    double raduis = 35.sp;
    double fontSize = 25.sp;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Calculator"),

        ),
        body:
        Padding(
          padding:  EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Container(
                color: Colors.black,
                height: 200.sp,//MediaQuery.sizeOf(context).height*2/7 ,
                width:MediaQuery.sizeOf(context).width ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5.sp,),
                    Obx(() =>  Text(
                         "${ c.input}",
                      //initialValue:"0" ,

                      maxLines: 3,
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.white),
                    ),),
                     Obx(() =>Text(
                       c.output.value==0?
                       "${ c.init}":"${ c.output}",
                      style: TextStyle(fontWeight: FontWeight.normal,
                          fontSize: 25.sp,
                          color: Colors.white),
                    )),

                  ],),
              ),

              SizedBox(height: 20.sp,),
                 GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                children: List.generate(20, (index) => Padding(
                  padding:  EdgeInsets.all(1.0.sp),
                  child: GestureDetector(
                    onTap:()=> {
                    if(index==0){
                    c.delete(),
                    print( c.input),
                    }
                    else {
                    c.show (c.numbers[index] ),
                    c.result(c.numbers[index]),
                    print( c.input),
                    },


                  }

                     ,
                    child: CircleAvatar(
                    radius: raduis,//MediaQuery.sizeOf(context).width/5 ,
                     backgroundColor: c.setColor(index),// num2.contains(index) ? Colors.grey :Colors.orangeAccent,
                      child: Text(c.numbers[index].toString(),style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        color: Colors.white,
    ),
    ),),
                  ),
                ),
              )
              ,),

          ]),
        )
    );
  }}


