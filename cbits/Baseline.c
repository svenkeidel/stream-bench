#include <math.h>
#include "Baseline.h"

double nthIntegral(double dt, int n)
{
	double integral = 0;
	int i;
	for(i = 0; i < n; i++) {
		double t = (double)i / dt;
		double s = sin(t);
		integral = integral + s * dt;
	}
	return integral;
}
