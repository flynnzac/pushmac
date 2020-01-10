page_buffer=10000
page_stack=100
page_macro=100

define="'@'"
shell="'|'"
ignore="'%'"
push = "'\#'"
push2 = "'='"
ref = "'~'"
question = "'?'"
silence="'^'"
expand = 36
speak="'!'"

pushmac: pushmac.expand.c 
	cc pushmac.expand.c -o pushmac \
	-DPAGE_MACRO=$(page_macro) \
	-DPAGE_BUFFER=$(page_buffer) \
	-DPAGE_STACK=$(page_stack)  \
	-DSHELL=$(shell) \
	-DDEFINE=$(define)  \
	-DPUSH=$(push) -DPUSH2=$(push2) \
	-DREF=$(ref) -DEXPAND=$(expand) \
	-DQUESTION=$(question) -DIGNORE=$(ignore) \
	-DSILENCE=$(silence) -DSPEAK=$(speak) \
	-Wall

pushmac.expand.c: pushmac.c
	cat pushmac.c | pushmac > pushmac.expand.c

clean: pushmac
	rm pushmac.expand.c

doc: pushmac.pushmac.1
	cat pushmac.pushmac.1 | pushmac > pushmac.1
	groff -mandoc -Thtml pushmac.1 > README.md

install: pushmac
	cp pushmac /usr/local/bin/
