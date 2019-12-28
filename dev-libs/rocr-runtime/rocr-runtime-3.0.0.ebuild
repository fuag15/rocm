# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/RadeonOpenCompute/ROCR-Runtime/"
	inherit git-r3
	S="${WORKDIR}/${P}/src"
else
	SRC_URI="https://github.com/RadeonOpenCompute/ROCR-Runtime/archive/roc-${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/ROCR-Runtime-roc-${PV}/src"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Radeon Open Compute Runtime"
HOMEPAGE="https://github.com/RadeonOpenCompute/ROCR-Runtime"
PATCHES=(
	"${FILESDIR}/${P}-cmake-install-paths.patch"
)

LICENSE="MIT"
SLOT="0/$(ver_cut 1-2)"
IUSE="nonfree"

COMMON_DEPEND="sys-process/numactl"
RDEPEND="${COMMON_DEPEND}
	nonfree? ( dev-libs/hsa-ext-rocr )"
DEPEND="${COMMON_DEPEND}
	>=dev-libs/roct-thunk-interface-${PV}"
