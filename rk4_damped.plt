set terminal jpeg
set output "damped.jpeg"
set xlabel "Time (t)"
set ylabel "Charge (q)"
set title "Damped Oscillations (R = 0.5 Ω)"

# Analytical solution parameters
R = 0.5
L = 1.0
C = 1.0
alpha = R / (2 * L)                       # Damping coefficient
omega_d = sqrt(1/(L*C) - alpha**2)        # Damped frequency
A = 1.0                                   # Initial charge

# Analytical solution: q(t) = A * exp(-alpha x) * cos(omega_d x)
f(x) = A * exp(-alpha * x) * cos(omega_d * x)

plot "LCR_damped.txt" using 1:2 with lines title "Numerical", \
     f(x) with lines title "Analytical"
