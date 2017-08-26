#include <iostream>
using namespace std;

void add(double a[], double b[], int degree, int degree2)
{
    // check which degree is higher than the other
    bool firstHigher = false;
    int highDegree = degree2;
    if (degree > degree2) {
        firstHigher = true;
        highDegree = degree;
    }
    
    // add polynomials
    double c[highDegree+1];
    if (firstHigher) {
        for (int i = 0; i <= degree; i++)
            c[i] = a[i]; // copy polynomial of higher degree
        for (int i = 0; i <= degree2; i++)
            c[i] += b[i]; // add polynomial of lower degree
    } else { // degree2 <= degree
        for (int i = 0; i <= degree2; i++)
            c[i] = b[i];
        for (int i = 0; i <= degree; i++)
            c[i] += a[i];
    }
    
    // print result
    cout << "\n--------Adding polynomials---------\n";
    for (int i = 0; i < highDegree; i++)
        cout << c[i] << "(X^" << i << ") + ";
    cout << c[highDegree] << "(X^" << highDegree << ")\n";
}

void multiply(double a[], double b[], int degree, int degree2)
{
    int multDegree = degree + degree2;
    double d[multDegree+1];
    
    // initialize
    for (int i = 0; i <= multDegree; i++) d[i] = 0;
    
    // multiply polynomials
    for (int i = 0; i <= degree; i++) {
        for (int j = 0; j <= degree2; j++)
            d[i+j] += a[i] * b[j];
    }
    
    // print result
    cout << "\n------Multiplying polynomials------\n";
    for (int i = 0; i < multDegree; i++)
        cout << d[i] << "(X^" << i << ") + ";
    cout << d[multDegree] << "(X^" << multDegree << ")\n";
}

void derivative(double a[], double b[], int degree, int degree2)
{
    double deriv1[degree-1];
    double deriv2[degree2-1];
    
    // find derivatives of polynomials
    for (int i = 0; i <= degree-1; i++) deriv1[i] = (i+1)*a[i+1];
    for (int i = 0; i <= degree2-1; i++) deriv2[i] = (i+1)*b[i+1];
    
    // print derivatives
    cout << "\n-----Derivative of polynomials-----\n";
    for (int i = 0; i < degree-1; i++)
        cout << deriv1[i] << "(X^" << i << ") + ";
    cout << deriv1[degree-1] << "(X^" << degree-1 << ")\n";
    
    for (int i = 0; i < degree2-1; i++)
        cout << deriv2[i] << "(X^" << i << ") + ";
    cout << deriv2[degree2-1] << "(X^" << degree2-1 << ")\n";
}

void integral(double a[], double b[], int degree, int degree2)
{
    double integral1[degree+1];
    double integral2[degree2+1];
    
    // find integrals of polynomials
    for (int i = 0; i <= degree+1; i++) integral1[i] = a[i];
    for (int i = 0; i <= degree2+1; i++) integral2[i] = b[i];
    
    // print integrals
    cout << "\n------Integral of polynomials------\n";
    for (int i = 0; i < degree; i++)
        cout << integral1[i] << "(X^" << i+1 << ")/" << i+1 << " + ";
    cout << integral1[degree] << "(X^" << degree+1 << ")/" << degree+1 << "\n";
    
    for (int i = 0; i < degree2; i++)
        cout << integral2[i] << "(X^" << i+1 << ")/" << i+1 << " + ";
    cout << integral2[degree2] << "(X^" << degree2+1 << ")/" << degree2+1 << "\n";
}

int main()
{
    // poynomial 1
    int degree = 1;
    cout << "Enter positive degree of polynomial a: ";
    cin >> degree;
    double a[degree+1];
    for (int i = 0; i <= degree; i++) {
        cout << "Enter a[" << i << "]: ";
        cin >> a[i];
    }
    
    // polynomial 2
    int degree2 = 1;
    cout << "Enter positive degree of polynomial b: ";
    cin >> degree2;
    double b[degree2+1];
    for (int i = 0; i <= degree2; i++) {
        cout << "Enter b[" << i << "]: ";
        cin >> b[i];
    }
    
    // print polynomials
    cout << "\n-----------Polynomials-------------\n";
    for (int i = 0; i < degree; i++)
        cout << a[i] << "(X^" << i << ") + ";
    cout << a[degree] << "(X^" << degree << ")\n";
    
    for (int i = 0; i < degree2; i++)
        cout << b[i] << "(X^" << i << ") + ";
    cout << b[degree2] << "(X^" << degree2 << ")\n";
    
    // perform operations on polynomials
    add(a, b, degree, degree2);
    multiply(a, b, degree, degree2);
    derivative(a, b, degree, degree2);
    integral(a, b, degree, degree2);
    
    return 0;
}

/* sample output

Enter positive degree of polynomial a: 2
Enter a[0]: 1
Enter a[1]: 3
Enter a[2]: 2
Enter positive degree of polynomial b: 1
Enter b[0]: 3
Enter b[1]: 2

-----------Polynomials-------------
1(X^0) + 3(X^1) + 2(X^2)
3(X^0) + 2(X^1)

--------Adding polynomials---------
4(X^0) + 5(X^1) + 2(X^2)

------Multiplying polynomials------
3(X^0) + 11(X^1) + 12(X^2) + 4(X^3)

-----Derivative of polynomials-----
3(X^0) + 4(X^1)
2(X^0)

------Integral of polynomials------
1(X^1)/1 + 3(X^2)/2 + 2(X^3)/3
3(X^1)/1 + 2(X^2)/2
*/
