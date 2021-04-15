#
# Copyright (c) 2021 Kien Minh Co.,Ltd
#
# SPDX-License-Identifier: Apache-2.0
#

board_runner_args(jlink "--device=LPC55S28" "--reset-after-load")

include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
