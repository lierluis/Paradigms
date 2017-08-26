/*
 * This program displays an arbitrary positive integer
 * n using big characters of size 7x7. The user inputs
 * a number, and that number is broken up into separate
 * digits. The digits are then found as substrings of
 * an array containing all of the digits as strings.
 */
 
#include <iostream>
#include <string>

using namespace std;

string fullString[7] = {"","","","","","",""};

/** This function creates a string array of big integers. */
void bigInt (int n)
{
    string nums[7] =
    {
        " @@@@@    @@   @@@@@  @@@@@ @@   @@@@@@@@@ @@@@@ @@@@@@@ @@@@@  @@@@@ ",
        "@@   @@ @@@@  @@   @@@@   @@@@   @@@@     @@   @@@@   @@@@   @@@@   @@",
        "@@   @@   @@       @@     @@@@   @@@@     @@         @@ @@   @@@@   @@",
        "@@   @@   @@     @@    @@@@@@@@@@@@@@@@@@@@@@@@@    @@   @@@@@  @@@@@ ",
        "@@   @@   @@   @@         @@     @@     @@@@   @@  @@   @@   @@   @@  ",
        "@@   @@   @@  @@     @@   @@     @@@@   @@@@   @@ @@    @@   @@  @@   ",
        " @@@@@ @@@@@@@@@@@@@@ @@@@@      @@ @@@@@  @@@@@ @@      @@@@@  @@    "
    };
    
    for (int i = 0; i < 7; i++)
        fullString[i] += nums[i].substr(n*7,7) + " ";
}

int main()
{   
    unsigned int user_input = 0;
    cout << "Enter a positive integer: ";
    cin >> user_input;
    num = user_input;
    
    // count # of digits in num
    unsigned int numDigits = 0;
    unsigned int tmp = num;
    do
    {   numDigits++;
        tmp /= 10; // shorten number by 1 digit
    } while (tmp > 0);
    
    // store digits in reverse order
    int digits[numDigits];
    for (int i = numDigits-1; i >= 0; i--)
    {
        digits[i] = num % 10; // get last digit
        num /= 10; // trim last digit
    }
    
    // create big integer string
    for (int i = 0; i < numDigits; i++)
        bigInt(digits[i]);
    
    // print big integer string
    for (int i = 0; i < 7; i++)
        cout << fullString[i] << endl;
    
    return 0;
}
