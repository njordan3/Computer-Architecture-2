void vectOp(int length, float a, float b, float *x, float *y, float *z, float *w)
{
    for(int i = 0; i < length; i ++) {
        w[i] = a*x[i]*y[i] + b*z[i];
    }
}
