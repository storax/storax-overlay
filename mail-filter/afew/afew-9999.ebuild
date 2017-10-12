# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{3_2,3_3,3_4} )

inherit distutils-r1 git-r3

DESCRIPTION="Initial tagging script for Notmuch"
HOMEPAGE="https://github.com/teythoon/afew"
EGIT_REPO_URI="git://github.com/teythoon/afew.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="app-text/dbacl
	dev-python/chardet[${PYTHON_USEDEP}]
	net-mail/notmuch[python]
	"
