# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools

DESCRIPTION="A drop down terminal, similar to the consoles found in the first person shooters"
HOMEPAGE="https://github.com/lanoxx/tilda"

if [[ ${PV} == *9999* ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
	KEYWORDS=""
else
	SRC_URI="${HOMEPAGE}/archive/${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${P}"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="x11-libs/vte:2.91
	>=dev-libs/glib-2.8.4:2
	dev-libs/confuse
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare(){
	eautoreconf
	eapply_user
}

src_configure(){
	econf \
		--enable-vte-2.91
}

src_install(){
	emake DESTDIR="${D}" install || die
}
