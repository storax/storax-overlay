# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python3_7 python3_8)

inherit eutils systemd distutils-r1

DESCRIPTION="An extensible music server that plays music from local disk and more"
HOMEPAGE="http://mopidy.com https://github.com/mopidy/mopidy"
SRC_URI="mirror://pypi/M/Mopidy/Mopidy-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/pykka[${PYTHON_USEDEP}]
	>=dev-python/gst-python-1.2.3:1.0[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=media-plugins/gst-plugins-meta-1.0-r2:1.0[http,mp3]
	www-servers/tornado[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	acct-group/mopidy
	acct-user/mopidy
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/responses[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/Mopidy-${PV}

src_install() {
	distutils-r1_src_install
	dobin extra/mopidyctl/mopidyctl
	doman extra/mopidyctl/mopidyctl.8

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	systemd_dounit extra/systemd/mopidy.service

	einfo
	elog "Don't forget to add the mopidy user to the audio group"
	elog "usermod -a -G audio mopidy"
	einfo
}

python_test() {
	py.test || die
}
