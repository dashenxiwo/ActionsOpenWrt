#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
echo '设置Argon主题'
sed -i "s/option mediaurlbase.*/option mediaurlbase '\/luci-static\/argon'/" feeds/luci/modules/luci-base/root/etc/config/luci

# 在版本号后添加编译日期
echo '添加编译日期到版本号'
BUILD_DATE=$(date +"%Y%m%d")
sed -i "s/DISTRIB_REVISION=.*/DISTRIB_REVISION='R${BUILD_DATE}'/" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='OpenWrt ${BUILD_DATE}'/" package/base-files/files/etc/openwrt_release