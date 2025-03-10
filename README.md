# LCR Circuit Dynamics: Analytical and Numerical Solutions  


---

## 1. Governing Equation of an LCR Circuit  
The behavior of an LCR circuit is described by the second-order linear differential equation:  
$$L \frac{d^2q}{dt^2} + R \frac{dq}{dt} + \frac{1}{C} q = V(t) $$  
- **L**: Inductance (H)  
- **R**: Resistance (Ω)  
- **C**: Capacitance (F)  
- **V(t)**: External voltage source (V)  

---

## 2. Analytical Solutions for Different Cases  

### **Case 1: Undamped Oscillations (R = 0)**  
**Physical Behavior**:  
- Pure sinusoidal oscillations with constant amplitude (no energy dissipation).  

**Analytical Solutions**:  
- **Primary Function**:  
  $$ f(x) = A \cos(\omega_0 x), \quad \omega_0 = \frac{1}{\sqrt{LC}} $$  
  - Represents natural oscillations.  

**Governing Equation**:  
$$ L f''(x) + \frac{1}{C} f(x) = 0 $$  


---

### **Case 2: Damped Oscillations (Underdamped, R ≠ 0)**  
**Physical Behavior**:  
- Exponentially decaying oscillations (energy loss due to resistance).  

**Analytical Solutions**:  
- **Decay Term**:  
  $$ f(x) = e^{-\alpha x}, \quad \alpha = \frac{R}{2L} $$  
- **Damped Oscillatory Solution**:  
  $$ g(x) = A e^{-\alpha x} \cos(\omega_d x), \quad \omega_d = \sqrt{\frac{1}{LC} - \alpha^2} $$  

**Governing Equation**:  
$$ L g''(x) + R g'(x) + \frac{1}{C} g(x) = 0 $$  

**Gnuplot Script Example**:  

---

## 3. Summary of Solutions  

| Case          | Primary Function ($$ f(x) $$)     | Composite Function ($$ g(x) $$)   | External Term ($$ h(x) $$)    |  
|---------------|------------------------------------|-----------------------------------|-------------------------------|  
| **Undamped**  | $$ A \cos(\omega_0 x) $$          | Not applicable                   | Not applicable               |  
| **Damped**    | $$ e^{-\alpha x} $$               | $$ A e^{-\alpha x}\cos(\omega_d x) $$ | Not applicable               |  
| **Forced**    | Transient decay                    | $$ f(x) + h(x) $$                | $$ B \sin(\omega x - \phi) $$ |  

---


