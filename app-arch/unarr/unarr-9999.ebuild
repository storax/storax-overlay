# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="A lightweight decompression library with support for rar, tar and zip archives"
HOMEPAGE="https://github.com/selmf/${PN}"
SRC_URI=""
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	sys-libs/zlib
	app-arch/bzip2
	app-arch/xz-utils
"
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
}
