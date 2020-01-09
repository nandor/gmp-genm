
CFLAGS:=$(CFLAGS) -I..

TEST_OBJECTS=\
	memory.o misc.o refmpf.o refmpn.o refmpq.o refmpz.o spinner.o trace.o

TESTS=\
	t-bswap t-constants t-count_zeros t-hightomask t-modlinv t-popc t-parity     \
	t-sub

all: $(TESTS)

libtest.a: $(TEST_OBJECTS)
	@echo "AR $@"
	@$(AR) cq $@ $^

%.o: %.c
	@echo "CC  $@"
	@$(CC) $(CFLAGS) -c -o $@ $<

%: %.c libtest.a
	@echo "EXE $@"
	$(CC) $(CFLAGS) -o $@ $^

.PHONY: clean
clean:
	@rm -rf $(TESTS) $(TEST_OBJECTS) libtest.a
