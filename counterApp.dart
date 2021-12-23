import 'dart:ffi';
import 'dart:io';

void main(List<String> arguments) {

  int opValue;
  int num1;
  int num2;
  String? tempInput;
  int choice;
  bool stop=false;

  AmritCounter amritCounter;

  print("Enter 2 numbers");

  tempInput=stdin.readLineSync();

  if(tempInput!=null && tempInput.isNotEmpty)
  {
    num1 = int.parse(tempInput);
  }
  else{
    num1=0;
  }

  tempInput=stdin.readLineSync();

  if(tempInput!=null && tempInput.isNotEmpty)
  {
    num2 = int.parse(tempInput);
  }
  else{
    num2=0;
  }

  print("Enter username");
  tempInput=stdin.readLineSync();

  if(tempInput!=null && tempInput.isNotEmpty)
  {
    amritCounter = AmritCounter(userName:tempInput,
      count:100,
      multiply:0,
      divide:0,
      remainder:0,
    );
  }
  else{
    return;
  }


  print("Enter value for increment/decrement");

  tempInput=stdin.readLineSync();

  if(tempInput!=null && tempInput.isNotEmpty)
  {
    opValue = int.parse(tempInput);
  }
  else{
    opValue=0;
  }

  while(!stop)
  {

    print('''Enter choice
           1. Print Value
           2. Increment
           3. Decrement
           4. Change Username
           5. Multiply
           6. Divide
           7. Remainder
           8. Stop''');

    tempInput=stdin.readLineSync();
    if(tempInput!=null && tempInput.isNotEmpty)
    {
      choice = int.parse(tempInput);
    }
    else{
      choice=0;
    }

    print("Starting value of counter is : ${amritCounter.count} and username is ${amritCounter.userName}");
    print("Starting Mulitplication value is : ${amritCounter.multiply}");
    print("Starting Division value is : ${amritCounter.divide}");
    print("Starting Remainder value is : ${amritCounter.remainder}\n\n");

    switch(choice){
      case 1: print(amritCounter);
      break;
      case 2: incrementCounter(counter:amritCounter,incrementValue:opValue);
      break;
      case 3: decrementCounter(counter:amritCounter,decrementValue:opValue);
      break;
      case 4: changeUserName(amritCounter:amritCounter);
      break;
      case 5: multiplyNumbers(multi:amritCounter,num1:num1,num2:num2);
      break;

      case 6: divideNumbers(div:amritCounter,num1:num1,num2:num2);
      break;

      case 7: remainderofNumbers(rem:amritCounter,num1:num1,num2:num2);
      break;
      case 8:
        stop=true;
        break;

      default:
        print('Kaikai Kitan');

    }
    print("Current value of counter is : ${amritCounter.count} and username is ${amritCounter.userName}");
    print("Current Mulitplication value is : ${amritCounter.multiply}");
    print("Current Division value is : ${amritCounter.divide}");
    print("Current Remainder value is : ${amritCounter.remainder}\n\n");
  }
  print("Final value of counter is : ${amritCounter.count} and username is ${amritCounter.userName}");
  print("Final Mulitplication value is : ${amritCounter.multiply}");
  print("Final Division value is : ${amritCounter.divide}");
  print("Final Remainder value is :${amritCounter.remainder}");
}

void changeUserName({required AmritCounter amritCounter}){
  print("Enter new username");
  String? tempInput=stdin.readLineSync();
  if(tempInput!=null && tempInput.isNotEmpty)
  {
    amritCounter.userName=tempInput;
  }
}

void incrementCounter({required AmritCounter counter, required int incrementValue})
{
  counter.count=counter.count+incrementValue;
}

void decrementCounter({required AmritCounter counter, required int decrementValue})
{
  counter.count=counter.count-decrementValue;
}

void multiplyNumbers({required AmritCounter multi,required int num1,required int num2})
{
  multi.multiply = num1*num2;
}

void divideNumbers({required AmritCounter div,required int num1,required int num2})
{
  if(num2==0){
    print("Divide by zero");
  }
  else{
    div.divide = num1/num2;
  }
}

void remainderofNumbers({required AmritCounter rem,required int num1,required int num2})
{
  rem.remainder = num1%num2;
}

class AmritCounter{
  int count;
  String userName;
  int multiply;
  double divide;
  int remainder;

  AmritCounter({required this.count, required this.userName,required this.multiply,required this.divide,required this.remainder});
}