/*
 * This program searches through an array and finds a number using
 * a binary search algorithm both iteratively and recursively.
 */

#include <iostream>
#include <cmath>

using namespace std;

/**
 * This function iteratively finds a
 * number x in an array a of size n
 */
int bs (int a[], int n, int x)
{
    int low, mid, high;
    low = 1, high = n;
    
    int location = 0;
    while (low <= high && location == 0)
    {
        mid = floor((low+high)/2);
        if (x == a[mid])
            location = mid;
        else if (x < a[mid])
            high = mid - 1;
        else
            low = mid + 1;
    }
    return location; // location of number x
}

/**
 * The functions bs2(int[], int, int, int) & bs2(int[], int, int)
 * recursively find a number x in an array a of size n
 */
int bs2(int a[], int start, int end, int x)
{
    int mid = (start + end) / 2;
    if (end < start)
        return -1;
    if (x == a[mid])
        return mid;
    else if (x < a[mid])
        return bs2(a, start, mid-1, x);
    else
        return bs2(a, mid+1, end, x);
}

int bs2(int a[], int n, int x)
{
    return bs2(a, 0, n-1, x);
}

int main()
{   
    int n = 2095992; // max size for system
    int k = 7;
    
    int a[n];
    for (int i=0; i<n; i++)
        a[i] = i; // a[i]=i, i=0,...,n-1
    
    cout << "size of array: " << n << endl;
    cout << "k: " << k << endl;
    
    // iterative
    for (int j=0; j<k; j++)
    {
        for (int i=0; i<n; i++)
        {
            if (bs(a,n,i) != i)
                cout << "ERROR\n";
        }
    }
    
    /*
    // recursive
    for (int j=0; j<k; j++)
    {
        for (int i=0; i<n; i++)
        {
            if (bs2(a,n,i) != i)
                cout << "ERROR\n";
        }
    }
    */
    
    return 0;
}
