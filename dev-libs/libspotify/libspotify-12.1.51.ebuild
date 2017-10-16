# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib

DESCRIPTION="C API package to utilize the Spotify music streaming service"
HOMEPAGE="https://developer.spotify.com/technologies/libspotify/"
BASE_URI="https://developer.spotify.com/download/libspotify/${P}-Linux-"
SRC_URI="amd64? ( ${BASE_URI}x86_64-release.tar.gz )
	x86? ( ${BASE_URI}i686-release.tar.gz )"

LICENSE="Spotify"
SLOT="0"
KEYWORDS="~amd64 ~x86 -*"
IUSE=""

DEPEND="virtual/pkgconfig"

QA_PRESTRIPPED="/usr/$(get_libdir)/${PN}.so.${PV}"

T_ARCH=${ARCH/x86/i686}
T_ARCH=${T_ARCH/amd64/x86_64}
S=${WORKDIR}/${P}-Linux-${T_ARCH}-release

src_prepare() {
	sed -i -e 's#PKG_PREFIX:$(prefix)#PKG_PREFIX:$(real_prefix)#'\
		-e 's/ldconfig.*//'\
		-e "s#prefix)/lib#prefix)/$(get_libdir)#g" Makefile || die
	sed -i -e "s#{exec_prefix}/lib#{exec_prefix/$(get_libdir)#" lib/pkgconfig/${PN}.pc || die
}

src_compile() {
	:
}

src_install() {
	emake prefix="${D}usr" real_prefix="${ROOT}usr" install
	dodoc README ChangeLog

	# install man
	doman share/man3/*
}
