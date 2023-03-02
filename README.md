# Lab work 4: Integral calculation
Authors (team): Nazar Demchuk, Liubomyr Oleksiuk<br>

### Compilation

```
/comile.sh
```

### Usage

Exeutable file for function X and data.cfg config file:
```bash
./build/integrate_serial data.cfg X
``` 
Python script with N repetitions:
```bash
python runner.py N
```

### Results

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
