all:
	$(MAKE) -C C all
	$(MAKE) -C ASM all
re:
	$(MAKE) -C C re
	$(MAKE) -C ASM re
clean:
	$(MAKE) -C C clean
	$(MAKE) -C ASM clean
	$(MAKE) -C NODE clean
fclean:
	$(MAKE) -C C fclean
	$(MAKE) -C ASM fclean
	$(MAKE) -C NODE fclean
