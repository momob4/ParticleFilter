module mod_random
	use mod_const, only: r_size, pi2
	implicit none
contains
  subroutine box_muller(seedsize, ndim, xout)
		implicit none
		integer(kind=4),   intent(in)  :: seedsize
		integer(kind=4),   intent(in)  :: ndim
		real(kind=r_size), intent(out) :: xout(1:ndim)

		integer(kind=4),   allocatable :: seed(:)
		integer(kind=4)                :: iseed
		real(kind=r_size)              :: uniform_random1, uniform_random2
		integer(kind=4)                :: ii

		iseed = seedsize
		call RANDOM_SEED(SIZE=iseed)
		allocate(seed(iseed))
		call RANDOM_SEED(get=seed)

		do ii = 1, ndim
      call RANDOM_NUMBER(uniform_random1)
      call RANDOM_NUMBER(uniform_random2)

			xout(ii) = sqrt(-2.0d0*LOG(uniform_random1)) * COS(pi2*uniform_random2)
		end do

		deallocate(seed)
		return
	end subroutine box_muller
end module mod_random