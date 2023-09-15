module mod_const
  implicit none
  integer(4), parameter :: r_sngl = kind(0.0e0)
  integer(4), parameter :: r_dble = kind(0.0d0)
! integer(4), parameter :: r_size = r_sngl
  integer(4), parameter :: r_size = r_dble

  real(kind=r_size), parameter :: pi = 4.0d0*atan(1.0d0)
end module mod_const