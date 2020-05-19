void vectOp(int length, float *x, float *y, float *z, float *w)
{
    for (int i = 0; i < length; i++) {
        w[i] = x[i]*y[i] + z[i];
    }
}
