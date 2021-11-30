#!/bin/sh

if [ -z "${MAC_APP_NAME}" ]; then
  exit 0
fi

ROOT_DIR="${BUILT_PRODUCTS_DIR}/root"
INSTALLER_DIR="${BUILT_PRODUCTS_DIR}/Installer"

mkdir -p "${ROOT_DIR}"
mkdir -p "${INSTALLER_DIR}"

cp -rp "${BUILT_PRODUCTS_DIR}/${MAC_APP_NAME}.app" "${ROOT_DIR}"

INSTALL_DIR="/Applications"

pkgbuild --install-location "${INSTALL_DIR}" --identifier "${PRODUCT_BUNDLE_IDENTIFIER}" --root "${ROOT_DIR}" "${INSTALLER_DIR}/${MAC_APP_NAME}.pkg"

rm -rf "${ROOT_DIR}"
