
CFLAGS:=$(CFLAGS) -I..

all: libmpn.a

libmpn.a: $(MPN_OBJECTS)
	@echo "AR  $@"
	@$(AR) cq $@ $(MPN_OBJECTS)

%.o: %.c
	@echo "CC  $@"
	@$(CC) -DOPERATION_$(basename $@) $(CFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	@rm -f libmpn.a
	@rm -rf *.o

