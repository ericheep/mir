// Matrix.ck
// Eric Heep

public class Matrix {

    // max index
    fun int[] argMax(float x[], int num) {
        int out[num];
        for (int i; i < num; i++) {
           float max;
           int idx_max;
           for (int j; j < x.cap(); j++) {
                if (x[j] >= max) {
                    x[j] => max;
                    j => idx_max;
                }
            }
            idx_max => out[i];
            0 => x[idx_max];
        }
        return out;
    }

    // reduces rows of a 2D array
    fun float[][] cutMat(float x[][], int low, int high) {
        high - low => int rows;
        float out[rows][x[0].cap()];
        float temp[x.cap()];
        for (int i; i < x[0].cap(); i++) {
            for (int j; j < x.cap(); j++) {
                x[j][i] => temp[j];
            }
            cut(temp, low, high) @=> float r[];
            for (int j; j < rows; j++) {
                r[j] => out[j][i];    
            }
        }
        return out;
    }

    // reduces an array
    fun float[] cut(float x[], int low, int high) {
        high - low => int num;
        float out[num];
        for (int i; i < num; i++) {
            x[low + i] => out[i];
        }
        return out;
    }

    // dot product
    fun float[][] dotMat(float x[][], float y[][]) {
        x.cap() => int rows_x;
        x[0].cap() => int cols_x;
        y.cap() => int rows_y; 
        y[0].cap() => int cols_y; 

        float out[cols_y][cols_x];
        float temp[rows_x];
        for (int i; i < cols_x; i++) {
            for (int j; j < rows_x; j++) {
                x[j][i] => temp[j];
            }
            dot(temp, y) @=> float mx[];
            for (int j; j < cols_y; j++) {
                mx[j] => out[j][i];
            }
        }
        return out;
    }

    // dot product
    fun float[] dot(float x[], float y[][]) {
        1 => int rows_x; 
        x.cap() => int cols_x;
        y.cap() => int rows_y; 
        y[0].cap() => int cols_y;
        
        float out[cols_y];

        if (cols_x == rows_y) {
            for (int i; i < cols_y; i++) {
                float prod;
                for (int j; j < rows_y; j++) { 
                    x[j] * y[j][i] +=> prod;
                }
                prod => out[i];
            }
            return out;
        }
        else <<< "Number of x columns must match number of y rows", "" >>>;
    }

    // dot product
    fun float[] dot(float x[][], float y[]) {
        1 => int rows_x; 
        x.cap() => int cols_x;
        x[0].cap() => int rows_y; 
        y.cap() => int cols_y;
        
        float out[cols_y];

        if (cols_x == rows_y) {
            for (int i; i < cols_y; i++) {
                float prod;
                for (int j; j < rows_y; j++) { 
                    x[i][j] * y[j] +=> prod;
                }
                prod => out[i];
            }
            return out;
        }
        else <<< "Number of x columns must match number of y rows", "" >>>;
    }

    // log transform
    fun float[][] logMat(float x[][]) {
        float out[x.cap()][x[0].cap()];
        float temp[x.cap()];
        for (int i; i < x[0].cap(); i++) {
            for (int j; j < x.cap(); j++) {
                x[j][i] => temp[j];
            }
            log(temp) @=> float lg[];
            for (int j; j < x.cap(); j++) {
                lg[j] => out[j][i];    
            }
        }
        return out;
    }

    // log transform
    fun float[] log(float x[]) {
        for (int i; i < x.cap(); i++) {
            Math.log(x[i] + 1.0) => x[i];
        }
        return x;
    }

    // log transform
    fun float[] log10(float x[]) {
        for (int i; i < x.cap(); i++) {
            Math.log10(x[i] + 1.0) => x[i];
        }
        return x;
    }

    // mean average of a matrix by rows or columns
    fun float[] mean(float x[][], int axis) {
        int rows, cols;
        if (axis == 0) {
            x.cap() => rows;
            x[0].cap() => cols;
        }
        else if (axis == 1) {
            x[0].cap() => rows;
            x.cap() => cols;
        }
        float out[cols];
        for (int i; i < cols; i++) {
            float sum;
            for (int j; j < rows; j++) {
                if (axis == 0) {
                    x[j][i] +=> sum;
                }
                else {
                    x[i][j] +=> sum;
                }
            }
            sum/rows => out[i];
        }
        return out;
    }

    // power function
    fun float[] pow(float x[], float p) {
        for (int i; i < x.cap(); i++) {
            Math.pow(x[i], p) => x[i];
        }
        return x;
    }

    // sorting function
    fun int[] order (int x[]) {
        int out[x.cap()];
        int sum;
        while (sum != x.cap() - 1) {
            0 => sum;
            for (int i; i < x.cap() - 1; i++) {
                if (x[i] > x[i + 1]) {
                    x[i] => int temp;
                    x[i + 1] => x[i];
                    temp => x[i + 1];
                }
                else {
                    sum++;
                }
            } 
        }
        return x;
    }

    // power function
    fun float[] rmstodb(float x[]) {
        for (int i; i < x.cap(); i++) {
            Std.rmstodb(x[i]) => x[i];
        }
        return x;
    }


    // matrix tranpose
    fun float[][] transpose (float x[][]) {
        float out[x[0].cap()][x.cap()];
        for (int i; i < x.cap(); i++) {
            for (int j; j < x[0].cap(); j++) {
                x[i][j] => out[j][i];
            }
        }
        return out;
    }
}