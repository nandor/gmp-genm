
CFLAGS=\
	-DHAVE_CONFIG_H \
	-D__GMP_WITHIN_GMP \
	-I. \
	-O2 \
	-pedantic \
	-fomit-frame-pointer \
	-m64 \
	-Wno-empty-translation-unit

GENERATED=\
	fac_table.h fib_table.h mp_bases.h trialdivtab.h mpn/jacobitab.h             \
	mpn/jacobitab.h mpn/perfsqr.h mpn/fib_table.c mpn/mp_bases.c

GENERATORS=\
	gen-fac gen-fib gen-bases gen-trialdivtab gen-jacobitab gen-psqr

OBJECTS=\
	assert.o compat.o errno.o extract-dbl.o invalid.o memory.o mp_bpl.o          \
	mp_clz_tab.o mp_dv_tab.o mp_minv_tab.o mp_get_fns.o mp_set_fns.o version.o   \
	nextprime.o primesieve.o tal-reent.o

MPN_OBJECTS=\
	add.o add_1.o add_err1_n.o add_err2_n.o add_err3_n.o add_n.o add_n_sub_n.o   \
	addmul_1.o and_n.o andn_n.o bdiv_dbm1c.o bdiv_q.o bdiv_q_1.o bdiv_qr.o       \
	binvert.o broot.o brootinv.o bsqrt.o bsqrtinv.o cmp.o cnd_add_n.o cnd_sub_n.o\
	cnd_swap.o com.o comb_tables.o copyd.o copyi.o dcpi1_bdiv_q.o dcpi1_bdiv_qr.o\
	dcpi1_div_q.o dcpi1_div_qr.o dcpi1_divappr_q.o div_q.o div_qr_1.o            \
	div_qr_1n_pi1.o div_qr_2.o div_qr_2n_pi1.o div_qr_2u_pi1.o dive_1.o diveby3.o\
	divexact.o divis.o divrem.o divrem_1.o divrem_2.o dump.o fib2_ui.o gcd.o     \
	gcd_1.o gcd_subdiv_step.o gcdext.o gcdext_1.o gcdext_lehmer.o get_d.o        \
	get_str.o hamdist.o hgcd.o hgcd2.o hgcd2_jacobi.o hgcd_appr.o hgcd_jacobi.o  \
	hgcd_matrix.o hgcd_reduce.o hgcd_step.o invert.o invertappr.o ior_n.o        \
	iorn_n.o jacbase.o jacobi.o jacobi_2.o lshift.o lshiftc.o matrix22_mul.o     \
  matrix22_mul1_inverse_vector.o mod_1.o mod_1_1.o mod_1_2.o mod_1_3.o         \
  mod_1_4.o mod_34lsub1.o mode1o.o mp_bases.o mu_bdiv_q.o mu_bdiv_qr.o         \
  mu_div_q.o mu_div_qr.o mu_divappr_q.o mul.o mul_1.o mul_basecase.o mul_fft.o \
  mul_n.o mullo_basecase.o mullo_n.o mulmid.o mulmid_basecase.o mulmid_n.o     \
  mulmod_bnm1.o nand_n.o neg.o nior_n.o nussbaumer_mul.o perfpow.o perfsqr.o   \
  popcount.o pow_1.o powlo.o powm.o pre_divrem_1.o pre_mod_1.o random.o        \
  random2.o redc_1.o redc_2.o redc_n.o remove.o rootrem.o rshift.o             \
  sbpi1_bdiv_q.o sbpi1_bdiv_qr.o sbpi1_div_q.o sbpi1_div_qr.o sbpi1_divappr_q.o\
  scan0.o scan1.o sec_add_1.o sec_div_qr.o sec_div_r.o sec_invert.o sec_mul.o  \
  sec_pi1_div_qr.o sec_pi1_div_r.o sec_powm.o sec_sqr.o sec_sub_1.o            \
  sec_tabselect.o set_str.o sizeinbase.o sqr.o sqr_basecase.o sqrlo.o          \
  sqrlo_basecase.o sqrmod_bnm1.o sqrtrem.o sub.o sub_1.o sub_err1_n.o          \
  sub_err2_n.o sub_err3_n.o sub_n.o submul_1.o tdiv_qr.o toom22_mul.o          \
  toom2_sqr.o toom32_mul.o toom33_mul.o toom3_sqr.o toom42_mul.o               \
  toom42_mulmid.o toom43_mul.o toom44_mul.o toom4_sqr.o toom52_mul.o           \
  toom53_mul.o toom54_mul.o toom62_mul.o toom63_mul.o toom6_sqr.o toom6h_mul.o \
  toom8_sqr.o toom8h_mul.o toom_couple_handling.o toom_eval_dgr3_pm1.o         \
  toom_eval_dgr3_pm2.o toom_eval_pm1.o toom_eval_pm2.o toom_eval_pm2exp.o      \
  toom_eval_pm2rexp.o toom_interpolate_12pts.o toom_interpolate_16pts.o        \
  toom_interpolate_5pts.o toom_interpolate_6pts.o toom_interpolate_7pts.o      \
  toom_interpolate_8pts.o trialdiv.o xnor_n.o xor_n.o zero.o zero_p.o 				 \
  invert_limb_table.o fib_table.o

MPZ_OBJECTS=\
	2fac_ui.o add.o add_ui.o abs.o aorsmul.o aorsmul_i.o and.o array_init.o      \
	bin_ui.o bin_uiui.o cdiv_q.o cdiv_q_ui.o cdiv_qr.o cdiv_qr_ui.o cdiv_r.o     \
	cdiv_r_ui.o cdiv_ui.o cfdiv_q_2exp.o cfdiv_r_2exp.o clear.o clears.o clrbit.o\
	cmp.o cmp_d.o cmp_si.o cmp_ui.o cmpabs.o cmpabs_d.o cmpabs_ui.o com.o        \
	combit.o cong.o cong_2exp.o cong_ui.o divexact.o divegcd.o dive_ui.o divis.o \
	divis_ui.o divis_2exp.o dump.o export.o fac_ui.o fdiv_q.o fdiv_q_ui.o        \
	fdiv_qr.o fdiv_qr_ui.o fdiv_r.o fdiv_r_ui.o fdiv_ui.o fib_ui.o fib2_ui.o     \
	fits_sint.o fits_slong.o fits_sshort.o fits_uint.o fits_ulong.o fits_ushort.o\
	gcd.o gcd_ui.o gcdext.o get_d.o get_d_2exp.o get_si.o get_str.o get_ui.o     \
	getlimbn.o hamdist.o import.o init.o init2.o inits.o inp_raw.o inp_str.o     \
	invert.o ior.o iset.o iset_d.o iset_si.o iset_str.o iset_ui.o jacobi.o       \
	kronsz.o kronuz.o kronzs.o kronzu.o lcm.o lcm_ui.o limbs_read.o limbs_write.o\
	limbs_modify.o limbs_finish.o lucnum_ui.o lucnum2_ui.o mfac_uiui.o           \
	millerrabin.o mod.o mul.o mul_2exp.o mul_si.o mul_ui.o n_pow_ui.o neg.o      \
	nextprime.o oddfac_1.o out_raw.o out_str.o perfpow.o perfsqr.o popcount.o    \
	pow_ui.o powm.o powm_sec.o powm_ui.o pprime_p.o prodlimbs.o primorial_ui.o   \
	random.o random2.o realloc.o realloc2.o remove.o roinit_n.o root.o rootrem.o \
	rrandomb.o scan0.o scan1.o set.o set_d.o set_f.o set_q.o set_si.o set_str.o  \
	set_ui.o setbit.o size.o sizeinbase.o sqrt.o sqrtrem.o sub.o sub_ui.o swap.o \
	tdiv_ui.o tdiv_q.o tdiv_q_2exp.o tdiv_q_ui.o tdiv_qr.o tdiv_qr_ui.o tdiv_r.o \
	tdiv_r_2exp.o tdiv_r_ui.o tstbit.o ui_pow_ui.o ui_sub.o urandomb.o urandomm.o\
	xor.o

MPQ_OBJECTS=\
	abs.o aors.o canonicalize.o clear.o clears.o cmp.o cmp_si.o cmp_ui.o div.o   \
	equal.o get_d.o get_den.o get_num.o get_str.o init.o inits.o inp_str.o inv.o \
	md_2exp.o mul.o neg.o out_str.o set.o set_den.o set_num.o set_si.o set_str.o \
	set_ui.o set_z.o set_d.o set_f.o swap.o

MPF_OBJECTS=\
	init.o init2.o inits.o set.o set_ui.o set_si.o set_str.o set_d.o set_z.o     \
	set_q.o iset.o iset_ui.o iset_si.o iset_str.o iset_d.o clear.o clears.o      \
	get_str.o dump.o size.o eq.o reldiff.o sqrt.o random2.o inp_str.o out_str.o  \
	add.o add_ui.o sub.o sub_ui.o ui_sub.o mul.o mul_ui.o div.o div_ui.o cmp.o   \
	cmp_d.o cmp_z.o cmp_si.o cmp_ui.o mul_2exp.o div_2exp.o abs.o neg.o get_d.o  \
	get_d_2exp.o set_dfl_prec.o set_prc.o set_prc_raw.o get_dfl_prec.o get_prc.o \
	ui_div.o sqrt_ui.o pow_ui.o urandomb.o swap.o get_si.o get_ui.o int_p.o      \
	ceilfloor.o trunc.o fits_sint.o fits_slong.o fits_sshort.o fits_uint.o       \
	fits_ulong.o fits_ushort.o

PRINTF_OBJECTS=\
	asprintf.o asprntffuns.o doprnt.o doprntf.o doprnti.o fprintf.o obprintf.o   \
	obvprintf.o obprntffuns.o printf.o printffuns.o snprintf.o snprntffuns.o     \
	sprintf.o sprintffuns.o vasprintf.o vfprintf.o vprintf.o vsnprintf.o         \
	vsprintf.o repl-vsnprintf.o

SCANF_OBJECTS=\
	doscan.o fscanf.o fscanffuns.o scanf.o sscanf.o sscanffuns.o vfscanf.o       \
	vscanf.o vsscanf.o

RAND_OBJECTS=\
	rand.o randclr.o randdef.o randiset.o randlc2s.o randlc2x.o randmt.o         \
	randmts.o rands.o randsd.o randsdui.o randbui.o randmui.o

GMP_OBJECTS=\
	$(addprefix mpn/, $(MPN_OBJECTS))\
	$(addprefix mpz/, $(MPZ_OBJECTS))\
	$(addprefix mpq/, $(MPQ_OBJECTS))\
	$(addprefix mpf/, $(MPF_OBJECTS))\
	$(addprefix printf/, $(PRINTF_OBJECTS))\
	$(addprefix scanf/, $(SCANF_OBJECTS))\
	$(addprefix rand/, $(RAND_OBJECTS))\
	$(OBJECTS)

GMP_PIC_OBJECTS=$(GMP_OBJECTS:.o=.lo)

all: libgmp.a libgmp.so

check: libgmp.a
	@$(MAKE) -C tests check

libgmp.a: $(GMP_OBJECTS)
	@echo "AR $@"
	@$(AR) cq $@ $^

libgmp.so: $(GMP_PIC_OBJECTS)
	@echo "LIB $@"
	@$(CC) -o $@ -shared $^

fac_table.h: gen-fac
	@echo "GEN $@"
	@./gen-fac 64 0 >fac_table.h

fib_table.h: gen-fib
	@echo "GEN $@"
	@./gen-fib header 64 0 >fib_table.h

mp_bases.h: gen-bases
	@echo "GEN $@"
	@./gen-bases header 64 0 >mp_bases.h

mpn/fib_table.c: gen-fib
	@echo "GEN $@"
	@./gen-fib table 64 0 >mpn/fib_table.c

mpn/jacobitab.h: gen-jacobitab
	@echo "GEN $@"
	@./gen-jacobitab >mpn/jacobitab.h

mpn/mp_bases.c: gen-bases
	@echo "GEN $@"
	@./gen-bases table 64 0 >mpn/mp_bases.c

mpn/perfsqr.h: gen-psqr
	@echo "GEN $@"
	@./gen-psqr 64 0 >mpn/perfsqr.h

trialdivtab.h: gen-trialdivtab
	@echo "GEN $@"
	@./gen-trialdivtab 64 8000 >trialdivtab.h

%: %.c
	@echo "EXE $@"
	@$(CC) $< -o $@

mpn/%.o: mpn/%.c $(GENERATED)
	@echo "CC  $@"
	@$(CC) -DOPERATION_$(notdir $(basename $@)) $(CFLAGS) -c -o $@ $<

mpn/%.lo: mpn/%.c $(GENERATED)
	@echo "CC  $@"
	@$(CC) -DOPERATION_$(notdir $(basename $@)) $(CFLAGS) -c -o $@ -fPIC $<

%.o: %.c $(GENERATED)
	@echo "CC  $@"
	@$(CC) $(CFLAGS) -c -o $@ $<

%.lo: %.c $(GENERATED)
	@echo "CC  $@"
	@$(CC) $(CFLAGS) -c -o $@ -fPIC $<

%.o: %.S
	@echo "AS  $@"
	@$(CC) $(ASFLAGS) -c -o $@ $<

%.lo: %.S
	@echo "AS  $@"
	@$(CC) $(ASFLAGS) -c -o $@ -fPIC $<

.PHONY: install
install: libgmp.a libgmp.so
	@mkdir -p $(PREFIX)/lib
	@cp libgmp.a $(PREFIX)/lib/libgmp.a
	@cp libgmp.so $(PREFIX)/lib/libgmp.so
	@mkdir -p $(PREFIX)/include
	@cp gmp.h $(PREFIX)/include/gmp.h

.PHONY: clean
clean:
	$(MAKE) -C tests clean
	rm -f $(GENERATED) $(GENERATORS)
	rm -f $(GMP_OBJECTS) $(GMP_SHARED_OBJECTS)
	rm -f libgmp.a libgmp.so
