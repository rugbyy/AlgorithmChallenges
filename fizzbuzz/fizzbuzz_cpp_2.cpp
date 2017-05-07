include <string>
#include <iostream>
using namespace std;

//solution is from rosettacode, i mearly read it and typed it down

int main()
{
	for (int i = 1; i != 16; ++i){
		if ((i % 15) == 0)
			cout << "FizzBuzz" << endl;
		else if ((i % 3) == 0)
			cout << "Fizz" << endl;
		else if ((i % 5) == 0)
			cout << "Buzz" << endl;
		else
			cout << i << endl;
	}
}