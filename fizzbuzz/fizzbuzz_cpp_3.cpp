#include <string>
#include <iostream>
using namespace std;

//solution is from rosettacode, i mearly read it and typed it down

int main()
{
	for (int i = 1; i != 16; ++i){
		bool fizz = (i % 3) == 0;
		bool buzz = (i % 5) == 0;
		if (fizz)
			cout << "Fizz";
		if (buzz)
			cout << "Buzz";
		if (!fizz && !buzz)
			cout << i;
		cout << endl;
	}
}