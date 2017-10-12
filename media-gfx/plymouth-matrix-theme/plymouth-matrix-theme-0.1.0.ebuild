# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A very simple boot animation that emulates the beginning of The Matrix (1999)."
HOMEPAGE="https://github.com/storax/plymouth-matrix-theme"
SRC_URI="https://github.com/storax/plymouth-matrix-theme/archive/0.1.0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="media-fonts/ultimate-oldschool-pc-font-pack"

DOCS="README.rst"

src_install() {
	emake DESTDIR="${D}" install || die "failed"
}
