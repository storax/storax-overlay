# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=1

inherit python-single-r1 python-utils-r1

ECOMMIT="214aaac8fee3ec884e4f95a5266402fefc8e70a8"

DESCRIPTION="Use parcellite via Rofi"
HOMEPAGE="https://github.com/seamus/${PN}"
SRC_URI="https://github.com/seamus-45/${PN}/archive/${ECOMMIT}.tar.gz -> ${PF}.tar.gz"
S="${WORKDIR}/${PN}-${ECOMMIT}"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

RDEPEND="${PYTHON_DEPS}
	x11-misc/rofi
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pygtk[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/notify-python[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]"
DEPEND=""

src_install() {
	python_doscript ${PN}.py
}
