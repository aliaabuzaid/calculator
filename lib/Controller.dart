
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'dart:math';

import 'package:calculator_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//7,11,,15
class Controller extends GetxController{
  final numbers = ["C", "()", "%", "/", "7","8","9","×" ,"4","5", "6","-","1", "2",
  "3","+" ,"0", "00",".", "="];
List numberIndex=[3,7,11,15,19];
List numberIndex2 =[0,1,2] ;
  var num1 =(0.0).obs,num2=(0.0).obs;
  var operation="".obs;




  RegExp regExp = RegExp((r'[- + % / × =]'));

       var input ="0".obs;
       var init =(0.0).obs;
       var  output=(0.0).obs ;
       var index=0;

       List split = [];
  CalculatorView view = CalculatorView();


       show(result)=>
      {
       input.value+=result,
        print("input=${input.value}")

    };

       delete()=>{
        input.value= input.substring(0,input.value.length-1),
         if(input.isEmpty){
           init.value=0.0,
           output.value=0,
           split.clear(),
           print("empty")

         }

       };

       result(indx)=>{


         split= input.split(regExp).toList(),
         index=split.length-1,

            if(index==0 ) {
           init.value = view.covertToInt(split[0]),
         },
         print(output.value),
         print(init.value),
         print(input.value),
         print(split),
         print(num1.value),
         print(num2.value),
         if(operation.value=="-"){
         num1.value=init.value,
         num2.value= view.covertToInt(split[index]),
         init.value=num1.value-num2.value,

        },
         if(operation.value=="+"){
           num1.value=view.covertToInt(split[index-1]),
           num2.value= view.covertToInt(split[index]),
           init.value=num1.value+num2.value,


         },if(operation.value=="/"){
           num1.value=init.value,
           num2.value= view.covertToInt(split[index]),
           init.value=(num1.value/num2.value) as dynamic,


         },
         if(operation.value=="×"){
           num1.value=init.value,
           num2.value= view.covertToInt(split[index]),
           init.value=(num1.value * num2.value) as dynamic,


         },

         if(indx==numbers[15]){
            operation.value="+",
         }else if(indx==numbers[11]){
            operation.value="-",

         }else if(indx==numbers[19]){
           print("indx=${index}"),
           //
           output.value=init.value,
           //input.value=output.value.toString(),
           input.value="0",
           init.value=0,
           split=[],
           num1.value=0,
           num2.value=0,
           operation.value="",

         }else if(indx==numbers[3]){
           operation.value="/",

         }else  if(indx==numbers[7]){
              operation.value="×",},
       };


Color setColor(index){
  if(numberIndex.contains(index)){
    return  Colors.orange;
  }else if(numberIndex2.contains(index)){
    return  Colors.grey;
  }else{
    return  Colors.white24;
  }
}
}
