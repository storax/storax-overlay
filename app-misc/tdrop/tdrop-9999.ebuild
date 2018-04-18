# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A Glorified WM-Independent Dropdown Creator"
HOMEPAGE="https://github.com/noctuid/${PN}"
SRC_URI=""
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="tmux sxhkd xrandr"

DEPEND=""
RDEPEND="
	app-shells/bash
	x11-misc/xdotool
	x11-apps/xwininfo
	x11-apps/xprop
	tmux? ( app-misc/tmux )
	sxhkd? ( x11-misc/sxhkd )
	xrandr? ( x11-apps/xrandr )
"
src_compile() { :; }
