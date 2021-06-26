# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python3_7 python3_8 python3_9 python3_10)

inherit distutils-r1

DESCRIPTION="Mopidy extension for playing music from Youtube"
HOMEPAGE="https://github.com/dz0ny/mopidy-youtube"
SRC_URI="https://github.com/dz0ny/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=">=dev-python/pykka-1.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/pafy-0.3.35[${PYTHON_USEDEP}]
	media-sound/mopidy[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	dev-python/nose[${PYTHON_USEDEP}]
	>=dev-python/mock-1.0[${PYTHON_USEDEP}]
	dev-python/vcrpy[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	nosetests || die
}
