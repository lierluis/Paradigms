/*
 * This program finds the longest sequenece of identical numbers
 * in a sorted array. It iterates through the array and increments a
 * counter if it finds that the current index is equal to the next.
 * If not, or if the last element is part of the sequence, the
 * sequence is saved and is considered the longest sequence if and
 * only if it is bigger than any previously saved sequence(s).
 * The program has time complexity O(n).
 */

#include <iostream>

using namespace std;

/**
 * This method iterates through a sorted array a of n integers
 * and finds the longest sequence of identical numbers.
 */
int maxlen(int a[], int size)
{
    int sequence, longestSequence;
    
    // sequence is 1 by default, b/c the array is nonempty
    sequence = longestSequence = 1;
    
    for (int i = 0; i < size-1; i++)
    {
        if (a[i] == a[i+1]) // if current index equals next index
        {
            sequence++; // increment sequence count
            
            // check if last element in array is part of sequence
            if (a[i] == a[size-1])
            {
                if (sequence > longestSequence)
                    longestSequence = sequence; // save sequence
            }
        }
        else // save sequence in longestSequence
        {
            if (sequence > longestSequence)
                longestSequence = sequence; // save longest sequence
            sequence = 1; // reset sequence to search for bigger one
        }
    }
    
    return longestSequence;
}

int main()
{
    int a[] = {1, 1, 1, 2, 3, 3, 5, 6, 6, 6, 6, 7, 9};
    int size = sizeof(a)/sizeof(a[0]);
    int longestSequence = 1; // sequence is 1 by default
    
    // find longest sequence only if there is more than 1 element
    if (size > 1)
        longestSequence = maxlen(a, size);
    
    cout << "array: ";
    for (int i = 0; i < size; i++)
    {
        cout << a[i] << " ";
    }
    
    cout << "\nlongest sequence: " << longestSequence << endl;
    
    return 0;
}
