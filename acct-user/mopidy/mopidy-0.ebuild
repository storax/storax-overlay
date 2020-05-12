# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

KEYWORDS="~amd64"
ACCT_USER_ID=104
ACCT_USER_GROUPS=( mopidy audio )

acct-user_add_deps
