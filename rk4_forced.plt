set terminal jpeg
set output "forced.jpeg"
set xlabel "Time (t)"
set ylabel "Charge (q)"
set title "Forced Oscillations (V(t) = sin(t))"

# Analytical solution parameters (steady-state response)
R = 0.5
L = 1.0
C = 1.0
omega = 2.0                   # Driving frequency (matches V(t) = sin(t))
Z = sqrt(R**2 + (omega*L - 1/(omega*C))**2)  # Impedance
phi = atan((omega*L - 1/(omega*C)) / R)       # Phase shift
A_steady = 1.0 / Z            # Steady-state amplitude

# Analytical solution: q_steady(t) = A_steady * sin(omega t - phi)
f(x) = A_steady * sin(omega * x - phi)

plot "LCR_forced.txt" using 1:2 with lines title "Numerical", \
     f(x) with lines title "Analytical (Steady-State)"
