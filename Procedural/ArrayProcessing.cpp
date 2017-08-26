/*
 * This program reduces an array a(1...n) by eliminating
 * from it all values that are equal to three largest
 * different integers. It has time complexity O(n).
 */

#include <iostream>

using namespace std;

/**
 * This function reduces the size of an array 'a' by
 * removing the 3 different highest numbers it contains
 * and creating a new array 'b' with the non-high numbers.
 *
 * First it swaps the numbers to retain a high, mid, low
 * order among the highest numbers. Then it looks for the
 * high numbers and how many there are, saves their indices,
 * and then creates the new array with an adjusted size.
 * The small numbers are all then added to the new array.
 */
int reduce (int a[], int n)
{
    int num1 = a[0]; // highest number
    int num2 = a[1]; // middle high number
    int num3 = a[2]; // lowest of high numbers
    int tmp = 0;
    
    // swap so that biggest number is a[0] & lowest is a[2]
    if (num2 > num1)
    {
        tmp = num1;
        num1 = num2;
        num2 = tmp;
    }
    if (num3 > num2)
    {
        tmp = num2;
        num2 = num3;
        num3 = tmp;
    }
    if (num2 > num1)
    {
        tmp = num1;
        num1 = num2;
        num2 = tmp;
    }
    
    // sort through array and find largest numbers.
    // if one is found, raise appropriate numbers to
    // retain the order of num1, num2, & num3
    for (int i = 3; i < n; i++)
    {
        if (a[i] > num1) // raise each number
        {
            if (num2 != num3)
                num3 = num2;
                
            num2 = num1;
            num1 = a[i];
        }
        else if (a[i] > num2 && a[i] != num1) // raise num2 & num3
        {
            if (num2 != num3)
                num3 = num2;
                
            num2 = a[i];
        }
        else if (a[i] > num3 && a[i] != num1 && a[i] != num2) // raise num3
        {
            num3 = a[i]; // raise num3
        }
    }
    
    // print original array
    cout << "array a: ";
    for (int i = 0; i < n; i++)
    {
        cout << a[i] << " ";
    }
    
    // find # of large numbers & save their indices
    int numLargeNumbers = 0;
    int indeces[n];
    for (int i = 0; i < n; i++)
    {
        if (a[i] == num1 || a[i] == num2 || a[i] == num3)
        {
            indeces[numLargeNumbers] = i; // save index
            numLargeNumbers++; // large number found
        }
    }
    
    int b[n-numLargeNumbers]; // reduced array
    int bIndex = 0, highCounter = 0;
    for (int i = 0; i < n; i++)
    {
        // if i is a high number
        if (i == indeces[highCounter])
        {
            highCounter++; // ignore high number
        }
        else // if i is not a high number
        {
            b[bIndex] = a[i]; // save low number in b
            bIndex++;
        }
    }
    
    // print new array
    cout << "\n\narray b: ";
    for (int i = 0; i < n-numLargeNumbers; i++)
    {
        cout << b[i] << " ";
    }
    cout << "\n";
    
    return 0;
}

int main()
{
    int a[] = {9, 1, 1, 6, 7, 1, 2, 3, 3, 5, 6, 6, 6, 6, 7, 9};
    int size = sizeof(a)/sizeof(a[0]);
    
    int x = reduce(a, size);
    
    return 0;
}
