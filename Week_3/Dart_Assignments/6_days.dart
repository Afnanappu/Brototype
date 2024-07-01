// 6.Using the ‘switch case’ write a program to accept an input number 
//from the user and output the day as follows. 


import 'dart:io';

int main(){

  int day = 1;
  stdout.write("Enter the day number(1-7): ");
  String? input = stdin.readLineSync();
  if(input != null){
    try {
      day = int.parse(input);
    }
    catch(e){
      print("Invalid, try again!");
      return 1;
    }
  }
  
  switch(day){
    case 1: print("Sunday");
    case 2: print("Monday");
    case 3: print("Tuesday");
    case 4: print("Wednesday");
    case 5: print("Thursday");
    case 6: print("Friday");
    case 7: print("Saturday");
    default: print("Invalid day number! ");
  }

return 0;
}