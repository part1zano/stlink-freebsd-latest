# $FreeBSD: head/devel/stlink/Makefile 344495 2014-02-15 23:04:53Z lev $

PORTNAME=	stlink
PORTVERSION=	1.0.0
CATEGORIES=	devel

MAINTAINER=	lev@FreeBSD.org
COMMENT=	STM32 ST-Link JTAG variant tools

LICENSE=	BSD

OPTIONS_DEFINE=		GTK3
OPTIONS_SUB=		GTK3
GTK3_CONFIGURE_ON=	--with-gtk
GTK3_USE=		GNOME=gtk30

USE_GITHUB=	yes
GH_ACCOUNT=	texane
GH_TAGNAME=	${PORTVERSION}
GH_COMMIT=	7216849

USES=		gmake pkgconfig
USE_AUTOTOOLS=	autoconf automake
GNU_CONFIGURE=	yes

PORTDOCS=	README tutorial.pdf

pre-configure:
	cd ${WRKSRC} && ./autogen.sh

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${STAGEDIR}${DOCSDIR}/README
	${INSTALL_DATA} ${WRKSRC}/doc/tutorial/tutorial.pdf ${STAGEDIR}${DOCSDIR}/tutorial.pdf

.include <bsd.port.mk>
