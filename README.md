# Lab work 3: Parallel Integral Calculation
Authors (team): Nazar Demchuk, Liubomyr Oleksiuk<br>

## Compilation

```
/comile.sh
```

## Usage

The example of calculating the integral of the first function using 4 threads:

```bash
./build/integrate_parallel func1.cfg 1 4
``` 
The examle of using pyhton stript which executes calculations 3 times for each function in 4 threads:

```bash
python3 runner.py 3 4
```

## Results

### In short

What we achieved by the parallelization is the significant performance boost, which, in fact, when the number of threads dedicated to program is chosen properly, grows linearly.

Here you can see the graph which represent the performance (in time) on the team member's machine (MacBook Pro 2019, Intel Core i5-8257u, 4 cores):

And here you can see the table which shows the impact of parralellism on the performance:


<table>
  <tr>
    <td rowspan="1"></td>
    <th colspan="3">Serial</th>
    <th colspan="3">Parallel (4 threads)</th>
  </tr>
  <tr>
    <th>Function</th>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>1</td>
    <td>2</td>
    <td>3</td>
  </tr>
  <tr>
    <th>Min time</th>
    <td>158367</td>
    <td>32754</td>
    <td>67944</td>
    <td>46383</td>
    <td>8762</td>
    <td>17786</td>
  </tr>
  <tr>
    <th>Avarage time</th>
    <td>160537</td>
    <td>33707</td>
    <td>69216</td>
    <td>46877</td>
    <td>9045</td>
    <td>18063</td>
  </tr>
  <tr>
    <th>Standard deviation</th>
    <td>2223</td>
    <td>759</td>
    <td>1052</td>
    <td>494</td>
    <td>265</td>
    <td>247</td>
  </tr>
</table>

### Details

Additionally, we checked our program for the presence of memory leaks, undefined behaviour and race conditions using Valgrind memcheck.

The absence of race conditions can be also easily verified by the fact, that the result is unchanged every time the program is run.

It is worth mentioning that although we have achieved good improvement in performance, the absolute error has become a little larger. There can be at least two possible explainings:

<ul>
  <li>the error that accumulates when adding a large amount of ```double```'s</li>
  <li>the way we divide our subregions into rectangles (from the beggining we don't divide the region into the specified amount in .cfg file, but into the amount such that each region contains equal numbers of rectangles)</li>
</ul>
