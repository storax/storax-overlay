# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Screenshot program for Linux text console(s)"
HOMEPAGE="http://bisqwit.iki.fi/source/snapscreenshot.html"
SRC_URI="http://bisqwit.iki.fi/src/arch/snapscreenshot-1.0.14.3.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	eapply_user
	epatch "${FILESDIR}/${PV}-destdir.patch"
}
