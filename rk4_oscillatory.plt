set terminal jpeg
set output "undamped.jpeg"
set xlabel "Time (t)"
set ylabel "Charge (q)"
set title "Undamped Oscillations (R = 0)"

# Analytical solution parameters
L = 1.0
C = 1.0
omega0 = 1.0 / sqrt(L * C)  # Natural frequency
A = 1.0                      # Initial charge

# Analytical solution: q(t) = A * cos(omega0 * t)
f(x) = A * cos(omega0 * x)

plot "LCR_undamped.txt" using 1:2 with lines title "Numerical", \
     f(x) with lines title "Analytical"
