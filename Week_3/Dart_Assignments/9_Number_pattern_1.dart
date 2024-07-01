// 9.Write a program to print the following pattern (hint: use nested loop)

import 'dart:io';

int main(){
  int limit;
  stdout.write("Enter the limit: ");
  String input = stdin.readLineSync()!;
  try{
    limit = int.parse(input);
  }
  catch(e){
    print("Invalid, try again!");
    return 1;
  }

  for(int i = 0; i < limit; i++){
    for(int j = 0; j < i+1; j++){
      stdout.write("${j+1} ");
    }
    print("");
  }

return 0;
}