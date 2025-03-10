set terminal jpeg
set output "forced.jpeg"
set xlabel "Time (t)"
set ylabel "Charge (q)"
set title "Forced Oscillations (V(t) = sin(2t))"
set key top right

# Circuit parameters (match Fortran code)
R = 0.5
L = 1.0
C = 1.0
omega = 2.0                   # Driving frequency (matches V(t) = sin(2t))

# Derived parameters
alpha = R / (2 * L)           # Damping coefficient = 0.25
omega0 = 1.0 / sqrt(L * C)    # Natural frequency = 1.0 rad/s
omega_d = sqrt(omega0**2 - alpha**2)  # Damped frequency ≈ 0.968 rad/s

# Steady-state parameters
Z = sqrt(R**2 + (omega*L - 1/(omega*C))**2)  # Impedance ≈ 1.640
phi = atan((omega*L - 1/(omega*C)) / R)      # Phase shift ≈ 1.107 radians
A_steady = 1.0 / Z            # Steady-state amplitude ≈ 0.610

# Transient coefficients from initial conditions (q=0, p=0)
C1 = -A_steady * sin(-phi)                     # ≈ -0.479
C2 = (A_steady * omega * cos(phi) - alpha * C1) / omega_d  # ≈ 0.447

# Analytical solutions
f(x) = exp(-alpha * x) * (C1 * cos(omega_d * x) + C2 * sin(omega_d * x))  # Transient
h(x) = A_steady * sin(omega * x - phi)                                     # Steady-state
g(x) = f(x) + h(x)                                                        # Total solution

# Plot all components
plot "LCR_forced.txt" using 1:2 with lines lw 2 title "Numerical (Total)", \
     f(x) with lines lt rgb "#009E73" title "Transient (Analytical)", \
     h(x) with lines lt rgb "#D55E00" title "Steady-State (Analytical)", \
     g(x) with lines lt rgb "red" lw 2 title "Total (Analytical)"
