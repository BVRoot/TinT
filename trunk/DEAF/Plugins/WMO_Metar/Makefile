CC = gcc
CFLAGS = -O3

include ../../include.mk

#####################################################################################
#  for example: -I /home/Zaphod/include
MYINC = -I /usr/include/BUtils

#  for example: -L /home/Zaphod/lib -l ZaphodLib
MYLIB = -L /usr/lib -l BMetar -l BUtils
######################################################################################


MYBEAN_DIR = ./
PLUGINNAME = WMO_Metar
BEANNAME = MetarBean
DEAFBUILD_DIR = $(PWD)

#-----------------------------------------------------------------------

plugin : lib$(PLUGINNAME).so


lib$(PLUGINNAME).so : $(BEANNAME).o $(PLUGINNAME).o
	$(CC) $(LDFLAGS) -shared $(PLUGINNAME).o $(BEANNAME).o  -o lib$(PLUGINNAME).so \
              $(MYLIB) $(MYSQLPP_LIB) -l stdc++

$(BEANNAME).o : $(BEANNAME).C
	$(CC) $(CFLAGS) -fPIC -c $(BEANNAME).C -o $(DEAFBUILD_DIR)/$(BEANNAME).o -I ../../include $(MYINC)

$(PLUGINNAME).o : $(PLUGINNAME).C
	$(CC) $(CFLAGS) -fPIC -c $(PLUGINNAME).C -o $(PLUGINNAME).o -D _DOLINKING_ \
              -I ./ -I ../../include $(MYINC) $(MYSQLPP_INC)

clean :
	- rm -f lib$(PLUGINNAME).so
	- rm -f $(BEANNAME).o
	- rm -f $(PLUGINNAME).o
	- rm -f $(PLUGINNAME).tar
	- rm -f $(PLUGINNAME).tar.gz
	- rm -f $(PLUGINNAME).tar.bz2

remove : uninstall

uninstall :
	- rm -f $(DEAF_INC_PATH)/$(BEANNAME).h
	- rm -f $(DEAF_INC_PATH)/$(PLUGINNAME).h

install : lib$(PLUGINNAME).so $(DEAF_INC_PATH)/$(PLUGINNAME).h $(DEAF_INC_PATH)/$(BEANNAME).h

$(DEAF_INC_PATH)/$(BEANNAME).h : $(BEANNAME).h
	cp -f $(BEANNAME).h $(DEAF_INC_PATH)/$(BEANNAME).h

$(DEAF_INC_PATH)/$(PLUGINNAME).h : $(PLUGINNAME).h
	cp -f $(PLUGINNAME).h $(DEAF_INC_PATH)/$(PLUGINNAME).h

tar : $(PLUGINNAME).tar

tar.gz : $(PLUGINNAME).tar.gz

tar.bz2 : $(PLUGINNAME).tar.bz2

$(PLUGINNAME).tar.gz : $(PLUGINNAME).tar
	gzip -f $(PLUGINNAME).tar

$(PLUGINNAME).tar.bz2 : $(PLUGINNAME).tar
	bzip2 -f $(PLUGINNAME).tar

$(PLUGINNAME).tar : $(PLUGINNAME).C $(PLUGINNAME).h $(PLUGINNAME).reg Makefile $(BEANNAME).C $(BEANNAME).h
	mkdir $(PLUGINNAME)/
	cp -f $(PLUGINNAME).C $(PLUGINNAME).h $(PLUGINNAME).reg Makefile \
              $(BEANNAME).C $(BEANNAME).h $(PLUGINNAME)/
	-rm -f $(PLUGINNAME).tar
	tar -cf $(PLUGINNAME).tar $(PLUGINNAME)/
	rm -rf $(PLUGINNAME)/

