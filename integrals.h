//
// Created by Naz on 2/25/2023.
//

#ifndef INTEGRATE_SERIAL_INTEGRALS_H
#define INTEGRATE_SERIAL_INTEGRALS_H

#include <cstddef>
#include <cmath>
#include <vector>
#include <thread>
#include <numeric>

namespace integrals {

    /* Calculates the integral of the function with given relative and
     * absolute errors. The function must be of two parameters.
     * */

    template<class F>
    double calculate_riemann_sum(F function, double x_start, double x_end, double y_start,
                                 double y_end, size_t steps_x, size_t steps_y,
                                 double shift_x = 0, double shift_y = 0) {
        auto delta_x = (x_end - x_start) / (double) steps_x;
        auto delta_y = (y_end - y_start) / (double) steps_y;
        double result = 0;
        for (size_t step_x = 0; step_x != steps_x; step_x++) {
            for (size_t step_y = 0; step_y != steps_y; step_y++) {
                auto value_of_func = function(x_start + (double) step_x * delta_x + shift_x,
                                              y_start + (double) step_y * delta_y + shift_y);
                result += value_of_func;
            }
        }
        return result;
    }

    template<class F>
    std::tuple<double, double, double> calculate_integral(F function, double abs_err, double rel_err,
                                                          double x_start, double x_end, double y_start,
                                                          double y_end, size_t init_steps_x,
                                                          size_t init_steps_y, size_t max_iter) {

        // first step: dividing an interval and computing
        // the initial value of the riemann sum over it
        double first_riemann_sum = 0;
        double second_riemann_sum = 0;
        auto steps_x = init_steps_x;
        auto steps_y = init_steps_y;
        size_t counter = 0;
        do {
            auto delta_x = (x_end - x_start) / (double) steps_x;
            auto delta_y = (y_end - y_start) / (double) steps_y;

            if (counter == 0) {
                first_riemann_sum = delta_x * delta_y *
                                    calculate_riemann_sum(function, x_start, x_end, y_start, y_end, steps_x, steps_y);
            } else {
                first_riemann_sum = second_riemann_sum;
            }

            auto first = calculate_riemann_sum(function, x_start, x_end, y_start, y_end,
                                               steps_x, steps_y, delta_x / 2, 0);
            auto second = calculate_riemann_sum(function, x_start, x_end, y_start, y_end,
                                                steps_x, steps_y, 0, delta_y / 2);
            auto third = calculate_riemann_sum(function, x_start, x_end, y_start, y_end,
                                               steps_x, steps_y, delta_x / 2, delta_y / 2);
            second_riemann_sum = 0.25 * (first_riemann_sum + delta_x * delta_y * (first + second + third));
//            std::cout << second_riemann_sum << " " << counter << std::endl;
            steps_x *= 2;
            steps_y *= 2;
            counter++;
        } while ((fabs(second_riemann_sum - first_riemann_sum) > abs_err &&
                  fabs((second_riemann_sum - first_riemann_sum) / second_riemann_sum) > rel_err) ||
                 counter < max_iter);

        return std::make_tuple(second_riemann_sum, fabs(second_riemann_sum - first_riemann_sum),
                               fabs((second_riemann_sum - first_riemann_sum) / second_riemann_sum));
    }

    /*
     * Divides a region into n smaller ones by y coordinate.
     * Returns a vector of pair of form <y_start, y_end>,
     * where y_start means the lower y bound of the smaller region,
     * and y_end - the upper one.
     * */
    std::vector<double> divide_region(size_t n, double y_start, double y_end) {
        std::vector<double> regions(n + 1);
        for (size_t i = 0; i != n; i++) {
            regions[i] = y_start + (double) i * ((y_end - y_start) / n);
        }
        regions[n] = y_end;
        return regions;
    }

    template<class F>
    std::tuple<double, double, double>
    calculate_integral_parallel(size_t thread_count, F function, double abs_err, double rel_err,
                                double x_start, double x_end, double y_start,
                                double y_end, size_t init_steps_x,
                                size_t init_steps_y, size_t max_iter) {

        std::vector<std::thread> threads(thread_count);
        std::vector<std::tuple<double, double, double>> results(thread_count);

        // dividing the region into smaller pieces
        auto regions = divide_region(thread_count, y_start, y_end);
        auto new_steps_y = ceil((double)init_steps_y / (double)thread_count);
        auto compute_and_write_to = [&function, abs_err, rel_err, x_start, x_end, &regions,
                init_steps_x, new_steps_y, max_iter, &results](size_t idx) {
            results[idx] = calculate_integral(function, abs_err, rel_err, x_start, x_end, regions[idx],
                                              regions[idx + 1], init_steps_x, new_steps_y, max_iter);
        };

        for (size_t i{0}; i != thread_count; i++) {
            threads[i] = std::thread{compute_and_write_to, i};
        }

        for (auto &thread: threads) {
            thread.join();
        }

        auto result = std::make_tuple(0.0, 0.0, 0.0);
        return std::accumulate(results.begin(), results.end(), result, [](auto first, auto second) {
                                   return std::make_tuple(std::get<0>(first) + std::get<0>(second),
                                                          std::get<1>(first) + std::get<1>(second),
                                                          std::get<2>(first) + std::get<2>(second));
                               }
        );
    }

}


#endif //INTEGRATE_SERIAL_INTEGRALS_H
