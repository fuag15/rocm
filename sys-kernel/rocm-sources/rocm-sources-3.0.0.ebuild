# Copyright
#

EAPI=6

DESCRIPTION="ROCm kernel sources"
HOMEPAGE="https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver"
SRC_URI="https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/archive/roc-${PV}.tar.gz -> rocm-sources-${PV}.tar.gz"

LICENSE=""
SLOT="3.0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

KERNEL_VERSION="5.2.0-rc1"

S="${WORKDIR}/linux-${KERNEL_VERSION}_roc${SLOT}"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/ROCK-Kernel-Driver-roc-${PV}" "${WORKDIR}/linux-${KERNEL_VERSION}_roc${SLOT}"
}

src_compile() {
	einfo "Nothing to compile..."
}

src_install() {
	dodir "/usr/src/"
	insinto "/usr/src/"
	doins -r "${WORKDIR}/linux-${KERNEL_VERSION}_roc${SLOT}" || die "Install failed!"
}


