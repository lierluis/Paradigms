/*
 * This program prompts the user to enter 3 points (x1, y1),
 * (x2, y2), and (x3, y3), and then computes y values for n=40
 * equidistant x values such that x1 <= x <= x3. It does so
 * using both Cramer's rule and Lagrange interpolation.
 * 
 * Conclusion: They yield the same results. Cramer's rule is O(n*n!) and
 * Lagrange interpolation is O(n^2). With small input sizes, Cramer's
 * rule runs fine, but the larger the input, Lagrange interpolation
 * becomes much more efficient than Cramer's rule.
 */

#include <iostream>

using namespace std;

/**
 * This function solves a linear system using Cramer's rule
 * & returns a y value for a given x such that x1 <= x <= x3.
 */
double yCramer(double x1, double y1, double x2, double y2,
        double x3, double y3, double x)
{
    double A[3][3]; // matrix containing values
    A[0][0] = x1*x1; A[0][1] = x1; A[0][2] = 1;
    A[1][0] = x2*x2; A[1][1] = x2; A[1][2] = 1;
    A[2][0] = x3*x3; A[2][1] = x3; A[2][2] = 1;
    
    double d, dx, dy, dz; // determinants
    
    // evaluate determinants
    d  = A[0][0] * ((A[1][1] * A[2][2]) - (A[1][2]*A[2][1]))
       - A[0][1] * ((A[1][0] * A[2][2]) - (A[1][2]*A[2][0]))
       + A[0][2] * ((A[1][0] * A[2][1]) - (A[1][1]*A[2][0]));
        
    dx = y1 * ((A[1][1] * A[2][2]) - (A[1][2]*A[2][1]))
       - A[0][1] * ((y2 * A[2][2]) - (A[1][2] * y3))
       + A[0][2] * ((y2 * A[2][1]) - (A[1][1] * y3));
        
    dy = A[0][0] * ((y2 * A[2][2]) - (A[1][2] * y3))
       - y1 * ((A[1][0]*A[2][2]) - (A[1][2]*A[2][0]))
       + A[0][2] * ((A[1][0] * y3) - (y2 * A[2][0]));
        
    dz = A[0][0] * ((A[1][1] * y3) - (y2 * A[2][1]))
       - A[0][1] * ((A[1][0] * y3) - (y2 * A[2][0]))
       + y1 * ((A[1][0]*A[2][1]) - (A[1][1]*A[2][0]));
    
    // Cramer's rule: x = dx/d, y = dy/d, z = dz/d
    dx = dx / d;
    dy = dy / d;
    dz = dz / d;
    
    // y(x) = ax^2 + bx + c
    return dx*x*x + dy*x + dz;
}

/**
 * This method performs Lagrange interpolation
 * and returns y(x) such that x1 <= x <= x3.
 */
double yLagrange(double x1, double y1, double x2, double y2,
        double x3, double y3, double x)
{
    // coordinates held in arrays for easy computation
    double xValues[3], yValues[3], y=0.0;
    xValues[0] = x1; yValues[0] = y1;
    xValues[1] = x2; yValues[1] = y2;
    xValues[2] = x3; yValues[2] = y3;
    
    // numerator & denominator of Lagrange interpolation formula
    double numerator=1.0, denominator=1.0;
    
    for (int i = 0; i < 3; i++)
    {
        numerator = denominator = 1.0; // reset
        for (int j = 0; j < 3; j++)
        {
            if (j != i)
            {
                // (x-x1)...(x-xn)
                numerator *= (x - xValues[j]);
                
                // (x0-x1)...(x0-xn)
                denominator *= (xValues[i] - xValues[j]);
            }
        }
        // f(x) = f0(((x-x1)...(x-xn))/((x0-x1)...(x0-xn)))
        //  + ... + fn(((x-x0)...(x-xn-1))/((xn-x0)...(xn-xn-1)))
        y += (yValues[i]*(numerator/denominator));
    }
    return y;
}

int main()
{
    double x1, y1, x2, y2, x3, y3;
    cout << "Input values\n";
    cout << "--------------\n";
    cout << "Enter x1: "; cin >> x1;
    cout << "Enter y1: "; cin >> y1;
    cout << "Enter x2: "; cin >> x2; 
    cout << "Enter y2: "; cin >> y2;
    cout << "Enter x3: "; cin >> x3;
    cout << "Enter y3: "; cin >> y3;
    
    cout << "\n\nCramer's rule" << endl;
    cout << "-------------------" << endl;
    
    cout << "x1: " << x1 << ", x3: " << x3 << endl;
    double value = x1; // min value is x1
    double equidistance = (x3-x1)/40.0;
    cout << "equidistance: " << equidistance << "\n\n";
    
    // solve linear system using Cramer's rule
    for (int i = 0; i < 40; i++)
    {
        double equiValue = yCramer(x1, y1, x2, y2, x3, y3, value);
        cout << "y(" << value << ") = " << equiValue << endl;
        value += equidistance; // add to min value
    }
    
    // find y values again but using Lagrange interpolation
    cout << "\nLagrange interpolation" << endl;
    cout << "----------------------" << endl;
    value = x1; // reset min value
    for (int i = 0; i < 40; i++)
    {
        double equiValue = yLagrange(x1, y1, x2, y2, x3, y3, value);
        cout << "y(" << value << ") = " << equiValue << endl;
        value += equidistance;
    }
    
    return 0;
}
