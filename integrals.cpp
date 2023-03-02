//
// Created by Naz on 3/2/2023.
//
#include "integrals.h"

namespace integrals {
    std::vector<double> divide_region(size_t n, double y_start, double y_end) {
        std::vector<double> regions(n + 1);
        for (size_t i = 0; i != n; i++) {
            regions[i] = y_start + (double) i * ((y_end - y_start) / (double) n);
        }
        regions[n] = y_end;
        return regions;
    }
}