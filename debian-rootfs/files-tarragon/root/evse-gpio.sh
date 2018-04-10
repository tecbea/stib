#!/bin/bash
#
#  Copyright (c) 2017 I2SE GmbH
#

GPIOS=""
GPIOS="$GPIOS 71"  # MX6ULL_PAD_LCD_DATA02__GPIO3_IO07, !MOTOR_1_DRV_IN1
GPIOS="$GPIOS 72"  # MX6ULL_PAD_LCD_DATA03__GPIO3_IO08, MOTOR_1_DRV_IN2
GPIOS="$GPIOS 73"  # MX6ULL_PAD_LCD_DATA04__GPIO3_IO09, !MOTOR_2_DRV_IN1
GPIOS="$GPIOS 136"  # MX6ULL_PAD_SNVS_TAMPER8__GPIO5_IO08, !MOTOR_2_DRV_IN2
GPIOS="$GPIOS 75"  # MX6ULL_PAD_LCD_DATA06__GPIO3_IO11, EN_MOTOR_CAP_CHARGING
GPIOS="$GPIOS 18"  # MX6ULL_PAD_UART1_CTS_B__GPIO1_IO18, !MOTOR_1_FAULT
GPIOS="$GPIOS 25"  # MX6ULL_PAD_UART3_RX_DATA__GPIO1_IO25, !MOTOR_2_FAULT

GPIOS="$GPIOS 48"  # MX6ULL_PAD_SD1_CMD__GPIO2_IO16, RELAY_1_SENSE CONTACTOR
GPIOS="$GPIOS 76"  # MX6ULL_PAD_LCD_DATA07__GPIO3_IO12, RELAY_1_EN CONTACTOR
GPIOS="$GPIOS 77"  # MX6ULL_PAD_LCD_DATA08__GPIO3_IO13, RELAY_2_EN VENTILATION
GPIOS="$GPIOS 47"  # MX6ULL_PAD_ENET2_RX_ER__GPIO2_IO15, RELAY_2_SENSE VENTILATION

GPIOS="$GPIOS 69"  # MX6ULL_PAD_LCD_DATA00__GPIO3_IO05, ENCLOSURE FAN ENABLE
GPIOS="$GPIOS 129"  # MX6ULL_PAD_BOOT_MODE1__GPIO5_IO1, ENCLOSURE FAN ROTATION DETECT

GPIOS="$GPIOS 132"  # MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04, RS485 ISO ENABLE
GPIOS="$GPIOS 19"  # MX6ULL_PAD_UART1_RTS_B__GPIO1_IO19, RS485_1 ENABLE
GPIOS="$GPIOS 110"  # MX6ULL_PAD_NAND_CE1_B__GPIO4_IO14, RS485_2 ENABLE

GPIOS="$GPIOS 22"  # MX6ULL_PAD_UART2_CTS_B__GPIO1_IO22, ROTARY SWITCH 2
GPIOS="$GPIOS 23"  # MX6ULL_PAD_UART2_RTS_B__GPIO1_IO23, ROTARY SWITCH 4
GPIOS="$GPIOS 24"  # MX6ULL_PAD_UART3_TX_DATA__GPIO1_IO24, ROTARY SWITCH 8
GPIOS="$GPIOS 128"  # MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00, ROTARY SWITCH 1

GPIOS="$GPIOS 13"  # MX6ULL_PAD_JTAG_TDI__GPIO1_IO13, CP INVERT

GPIOS="$GPIOS 138"  # MX6ULL_PAD_BOOT_MODE0__GPIO5_IO10, CP_RST_POS_PEAK
GPIOS="$GPIOS 139"  # MX6ULL_PAD_BOOT_MODE1__GPIO5_IO11, CP_RST_NEG_PEAK

GPIOS="$GPIOS 84"  # MX6ULL_PAD_LCD_DATA15__GPIO3_IO20, PUSH_PULL_1 LED
GPIOS="$GPIOS 85"  # MX6ULL_PAD_LCD_DATA16__GPIO3_IO21, PUSH_PULL_2
GPIOS="$GPIOS 86"  # MX6ULL_PAD_LCD_DATA17__GPIO3_IO22, PUSH_PULL_3
GPIOS="$GPIOS 87"  # MX6ULL_PAD_LCD_DATA18__GPIO3_IO23, PUSH_PULL_4
# Temporary changed to DI
GPIOS="$GPIOS 88"  # MX6ULL_PAD_LCD_DATA19__GPIO3_IO24, DIG_IN_1 (former PUSH_PULL_5)
GPIOS="$GPIOS 89"  # MX6ULL_PAD_LCD_DATA20__GPIO3_IO25, DIG_IN_2 (former PUSH_PULL_6)

GPIOS="$GPIOS 135" # MX6ULL_PAD_SNVS_TAMPER7__GPIO5_IO07, !QCA7500_RST
GPIOS="$GPIOS 80"  # MX6ULL_PAD_LCD_DATA11__GPIO3_IO16, QCA7500_BOOTLOADER
GPIOS="$GPIOS 81"  # MX6ULL_PAD_LCD_DATA12__GPIO3_IO17, !QCA7K_RST
GPIOS="$GPIOS 82"  # MX6ULL_PAD_LCD_DATA13__GPIO3_IO18, QCA7K_BOOTLOADER

# Temporary unusable because of hardware workaround
#GPIOS="$GPIOS 98"  # MX6ULL_PAD_NAND_DATA00__GPIO4_IO02, DIG_IN_6
#GPIOS="$GPIOS 99"  # MX6ULL_PAD_NAND_DATA01__GPIO4_IO03, DIG_IN_4
#GPIOS="$GPIOS 100"  # MX6ULL_PAD_NAND_DATA02__GPIO4_IO04, DIG_IN_2
#GPIOS="$GPIOS 101"  # MX6ULL_PAD_NAND_DATA03__GPIO4_IO05, DIG_IN_5
#GPIOS="$GPIOS 96"  # MX6ULL_PAD_NAND_RE_B__GPIO4_IO00, DIG_IN_3
#GPIOS="$GPIOS 97"  # MX6ULL_PAD_NAND_WE_B__GPIO4_IO01, DIG_IN_1

GPIOS="$GPIOS 104"  # MX6ULL_PAD_NAND_DATA06__GPIO4_IO08, BOARD_VARIANT_GPIO3
GPIOS="$GPIOS 105"  # MX6ULL_PAD_NAND_DATA07__GPIO4_IO09, BOARD_VARIANT_GPIO2
GPIOS="$GPIOS 106"  # MX6ULL_PAD_NAND_ALE__GPIO4_IO10, BOARD_VARIANT_GPIO1
GPIOS="$GPIOS 107"  # MX6ULL_PAD_NAND_WP_B__GPIO4_IO11, BOARD_VARIANT_GPIO0

function usage {
        echo "Usage: $0 ACTION"
        echo "  ACTION = export | unexport"
        exit 1
}

case "$1" in
        "export")
                test $# -ne 1 && usage
                ;;
        "unexport")
                test $# -ne 1 && usage
                ;;
        *)
                usage
                ;;
esac

if [ "$1" == "export" ]; then

        for gpio in $GPIOS; do
                test -e /sys/class/gpio/gpio$gpio && continue
                echo "$gpio" > /sys/class/gpio/export
        done

elif [ "$1" == "unexport" ]; then

        for gpio in $GPIOS; do
                test ! -e /sys/class/gpio/gpio$gpio && continue
                echo "$gpio" > /sys/class/gpio/unexport
        done

fi
