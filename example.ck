// example.ck
// Eric Heep

// classes
sci sci;
mel mel;
matrix mat;
filter_bank sub;
visualization vis;

adc => FFT fft => blackhole;

second / samp => float sr;
32 => int nfilts;
512 => int N => int win => fft.size;
Windowing.hamming(N) => fft.window;

UAnaBlob blob;

[0.0, 100.0, 500.0, 1000.0, 10000.0, 22050.0] @=> float filts[];

// calculates mel matrix
mel.calc(N, 24, sr, 1.0, "bark") @=> float mx[][];
mat.transpose(mx) @=> mx;

// cuts off unnecessary half of mel matrix
mat.cut(mx, 0, 256) @=> mx;

// main program
while (true) {
    win::samp => now;
    fft.upchuck() @=> blob;

    // mel matrix and subband filter
    //sub.subband(blob.fvals(), filts, N, sr) @=> float X[];
    //sub.sub_centroid(blob.fvals(), filts, N, sr) @=> float subcentroid[];
    mat.dot_win(blob.fvals(), mx) @=> float X[];

    // TODO: improve mfcc (log and dct) results, create a matrix.rms function
    //mat.log_win(X) @=> X;
    //sci.dct_win(X) @=> X;

    vis.data(X, "/data");
}
