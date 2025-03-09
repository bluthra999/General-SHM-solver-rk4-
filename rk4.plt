set terminal jpeg
set output "abhay.jpeg"
stats "LCR.txt" name "LCR"
set xlabel "Time(t)"
set ylabel "Charge(q)"
f(x)=0.002*exp(-200*x)
g(x)=0.002*exp(-200*x)-0.0005*exp(-800*x)
h(x)=-0.0005*exp(-800*x)
plot "LCR.txt" w l t "numerical", f(x) w l, g(x) w l , h(x) w l t  "analytical"