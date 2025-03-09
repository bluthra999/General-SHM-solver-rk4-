program LCR
    implicit none

    ! Declare variables and parameters
    real :: L, C, R, V, t_start, t_end, h, q, p, t_current
    integer :: case_number, i, steps
    common /params/ L, C, R, V  ! Only REAL variables in common block

    ! Runge-Kutta variables
    real :: k1, k2, k3, k4, l1, l2, l3, l4
    character(len=20) :: filename

    ! Display menu for case selection
    print *, "Select the case:"
    print *, "1. Undamped infinite oscillations"
    print *, "2. Damped oscillations"
    print *, "3. External force oscillations"
    print *, "4. General case (custom parameters)"
    read *, case_number

    ! Set parameters and output file based on the selected case
    select case (case_number)
    case (1)
        R = 0.0
        L = 1.0
        C = 1.0
        V = 0.0
        q = 1.0
        p = 0.0
        t_start = 0.0
        t_end = 20.0
        h = 0.01
        filename = "LCR_undamped.txt"
    case (2)
        R = 0.5
        L = 1.0
        C = 1.0
        V = 0.0
        q = 1.0
        p = 0.0
        t_start = 0.0
        t_end = 20.0
        h = 0.01
        filename = "LCR_damped.txt"
    case (3)
        R = 0.5
        L = 1.0
        C = 1.0
        V = 0.0
        q = 0.0
        p = 0.0
        t_start = 0.0
        t_end = 50.0  ! Extended time to show steady-state
        h = 0.01
        filename = "LCR_forced.txt"
    case (4)
        write(*,'("Enter resistance R (Ω): ")', advance='no')
        read *, R
        write(*,'("Enter capacitance C (F): ")', advance='no')
        read *, C
        write(*,'("Enter inductance L (H): ")', advance='no')
        read *, L
        write(*,'("Enter voltage V (V): ")', advance='no')
        read *, V
        write(*,'("Enter initial charge q: ")', advance='no')
        read *, q
        write(*,'("Enter initial current dq/dt: ")', advance='no')
        read *, p
        write(*,'("Enter start time: ")', advance='no')
        read *, t_start
        write(*,'("Enter end time: ")', advance='no')
        read *, t_end
        write(*,'("Enter step size h: ")', advance='no')
        read *, h
        filename = "LCR_general.txt"
    case default
        print *, "Invalid case number."
        stop
    end select

    steps = nint((t_end - t_start) / h)
    open(19, file=filename)

    do i = 0, steps-1
        t_current = t_start + i * h

        ! Runge-Kutta coefficients
        k1 = h * p
        l1 = h * g(q, p, t_current)

        k2 = h * (p + 0.5 * l1)
        l2 = h * g(q + 0.5 * k1, p + 0.5 * l1, t_current + 0.5 * h)

        k3 = h * (p + 0.5 * l2)
        l3 = h * g(q + 0.5 * k2, p + 0.5 * l2, t_current + 0.5 * h)

        k4 = h * (p + l3)
        l4 = h * g(q + k3, p + l3, t_current + h)

        ! Update charge and current
        q = q + (k1 + 2.0 * k2 + 2.0 * k3 + k4) / 6.0
        p = p + (l1 + 2.0 * l2 + 2.0 * l3 + l4) / 6.0

        write(19, '(F0.4, 2X, F0.4)') t_current + h, q
    end do

    close(19)
    print *, "Simulation complete. Results saved to ", trim(filename)

contains
    real function g(q, p, t)
        implicit none
        real, intent(in) :: q, p, t
        real :: L, C, R, V
        common /params/ L, C, R, V  ! Access REAL variables only
        real :: V_t

        
        if (case_number == 3) then
            V_t = 1.0 * sin(2.0 * t)  ! External force: V(t) = sin(t)
        else
            V_t = V
        end if

        g = -( (R / L) * p + (1.0 / (L * C)) * q - V_t / L )
    end function g
end program LCR
