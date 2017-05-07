#include <string>
#include <iostream>
using namespace std;

//saw this online, pretty cool solution using cpp

int main()
{
	for (int i = 1; i != 16; ++i){
		string fizzybuzz;
		fizzybuzz += (i % 3 == 0) ? "Fizz" : "";
		fizzybuzz += (i % 5 == 0) ? "Buzz" : "";
		fizzybuzz += (fizzybuzz.empty()) ? to_string(i) : "";
		cout << fizzybuzz << endl;
	}
}