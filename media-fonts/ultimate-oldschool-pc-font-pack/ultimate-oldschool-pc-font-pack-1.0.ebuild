# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="Classic fonts from DOS-era IBM PCs and compatibles"
HOMEPAGE="http://int10h.org/oldschool-pc-fonts/"
SRC_URI="http://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v${PV}.zip"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+px437 +pxplus"

DEPEND="app-arch/unzip"
RDEPEND=""

DOCS="README.NFO"

S="${WORKDIR}"
FONT_SUFFIX="ttf"
FONT_S="Px437 PxPlus"

src_prepare() {
	eapply_user
	mv "Px437 (TrueType - DOS charset)" "Px437" || die
	mv "PxPlus (TrueType - extended charset)" "PxPlus" || die
}
