PREFIX?=	/usr/local
BSD_INSTALL_DATA?=	install -m 0644
LN?=		ln -f -s
LOCALE_DIR?=	/usr/share/locale
TARGET_DIR?=	${DESTDIR}${PREFIX}/share/locale/en_DK.UTF-8

install: .PHONY
	@mkdir -p ${TARGET_DIR}
	${LN} ${LOCALE_DIR}/la_LN.US-ASCII/LC_COLLATE ${TARGET_DIR}
	${LN} ${LOCALE_DIR}/UTF-8/LC_CTYPE ${TARGET_DIR}
	${LN} ${LOCALE_DIR}/en_GB.UTF-8/LC_MESSAGES ${TARGET_DIR}
	${BSD_INSTALL_DATA} en_DK.UTF-8/LC_MONETARY ${TARGET_DIR}
	${LN} ${LOCALE_DIR}/en_GB.UTF-8/LC_NUMERIC ${TARGET_DIR}
	${BSD_INSTALL_DATA} en_DK.UTF-8/LC_TIME ${TARGET_DIR}

test: .PHONY
	@env -i PATH_LOCALE=${PWD} LANG=en_DK.UTF-8 date +%x | \
		grep -q "$$(date +%Y-%m-%d)"
