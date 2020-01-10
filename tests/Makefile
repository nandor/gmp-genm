
CFLAGS:=$(CFLAGS) -I..

TEST_OBJECTS=\
	memory.o misc.o refmpf.o refmpn.o refmpq.o refmpz.o spinner.o trace.o

TESTS=\
	t-bswap t-constants t-count_zeros t-hightomask t-modlinv t-popc t-parity     \
	t-sub

MPN_TESTS=\
	t-asmtype t-aors_1 t-divrem_1 t-mod_1 t-fat t-get_d t-instrument t-iord_u    \
	t-mp_bases t-perfsqr t-scan logic t-toom22 t-toom32 t-toom33 t-toom42        \
	t-toom43 t-toom44 t-toom52 t-toom53 t-toom54 t-toom62 t-toom63 t-toom6h      \
	t-toom8h t-toom2-sqr t-toom3-sqr t-toom4-sqr t-toom6-sqr t-toom8-sqr t-div   \
	t-mul t-mullo t-sqrlo t-mulmod_bnm1 t-sqrmod_bnm1 t-mulmid t-hgcd t-hgcd_appr\
	t-matrix22 t-invert t-bdiv t-broot t-brootinv t-minvert t-sizeinbase

MPZ_TESTS=\
	reuse t-addsub t-cmp t-mul t-mul_i t-tdiv t-tdiv_ui t-fdiv t-fdiv_ui         \
	t-cdiv_ui t-gcd t-gcd_ui t-lcm t-invert dive dive_ui t-sqrtrem convert io    \
	t-inp_str logic bit t-powm t-powm_ui t-pow t-div_2exp t-root t-perfsqr       \
	t-perfpow t-jac t-bin t-get_d t-get_d_2exp t-get_si t-set_d t-set_si t-fac_ui\
	t-mfac_uiui t-primorial_ui t-fib_ui t-lucnum_ui t-scan t-fits t-divis        \
	t-divis_2exp t-cong t-cong_2exp t-sizeinbase t-set_str t-aorsmul t-cmp_d     \
	t-cmp_si t-hamdist t-oddeven t-popcount t-set_f t-io_raw t-import t-export   \
	t-pprime_p t-nextprime t-remove t-limbs

MPQ_TESTS=\
 t-aors t-cmp t-cmp_ui t-cmp_si t-equal t-get_d t-get_str t-inp_str t-inv      \
 t-md_2exp t-set_f t-set_str io reuse t-cmp_z

MPF_TESTS=\
 t-dm2exp t-conv t-add t-sub t-sqrt t-sqrt_ui t-muldiv reuse t-cmp_d t-cmp_si  \
  t-div t-fits t-get_d t-get_d_2exp t-get_si t-get_ui t-gsprec t-inp_str       \
  t-int_p t-mul_ui t-set t-set_q t-set_si t-set_ui t-trunc t-ui_div t-eq       \
  t-pow_ui

MISC_TESTS=\
	t-printf t-scanf t-locale

RAND_TESTS=\
 t-iset t-lc2exp t-mt t-rand t-urbui t-urmui t-urndmm

GMP_TESTS=\
	$(addprefix mpn/, $(MPN_TESTS))\
	$(addprefix mpz/, $(MPZ_TESTS))\
	$(addprefix mpq/, $(MPQ_TESTS))\
	$(addprefix mpf/, $(MPF_TESTS))\
	$(addprefix misc/, $(MISC_TESTS))\
	$(addprefix rand/, $(RAND_TESTS))\
	$(TESTS)

all: $(GMP_TESTS)

check: $(GMP_TESTS)
	@for test in $?; do \
		OUT=`./$$test &> /dev/null`; \
		if [ "$$?" -ne "0" ]; then \
			echo "failed: $$test"; \
		fi; \
	done;

libtest.a: $(TEST_OBJECTS)
	@echo "AR  $@"
	@$(AR) cq $@ $^

%.o: %.c
	@echo "CC  $@"
	@$(CC) $(CFLAGS) -c -o $@ $<

%: %.c libtest.a ../libgmp.a
	@echo "EXE $@"
	@$(CC) $(CFLAGS) -o $@ $^

.PHONY: clean
clean:
	@rm -rf $(TESTS) $(TEST_OBJECTS) libtest.a
