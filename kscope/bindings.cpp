//
// Created by Alex Zelenshikov on 10.11.2023.
//
#include <cstdio>

#ifdef _WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT
#endif

/// putchard - putchar that takes a double and returns 0.
extern "C" DLLEXPORT double putchard(double X) {
  fputc((char)X, stderr);
  return 0;
}

/// printd - printf that takes a double prints it as "%f\n", returning 0.
extern "C" DLLEXPORT double printd(double X) {
  fprintf(stderr, "%f\n", X);
  return 0;
}

extern "C" DLLEXPORT double myfun(double X) {
  return X * 10;
}

extern "C" DLLEXPORT double my_fun(double X) {
  return X * 10;
}

