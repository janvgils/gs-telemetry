#!/usr/bin/env bash
#
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes
#
# ------------------------------------------------------------------------------
#
# Original Author    : Mark Jessop <vk5qi@rfhead.net>
# Contributing Author: Jan van Gils <pe0sat@vgnet.nl>
#
# strf_capture.sh <device> <frequency_in_hz> <time>
# strf_capture.sh 0        437e6             10m
#
# ------------------------------------------------------------------------------

# Set variables:

PATH="${PATH}":/usr/local/bin
BIAS="0"
DEVICE="${1:-}"
FREQ="${2:-}"
DURATION="${3:-}"
FIFO="/tmp/fifo"
GAIN="40.2"
RATE="2.56e6"
RTLSDR=$(command -v rtl_sdr)
RFFFT=$(command -v rffft)
RFCS="20"
WORKINGDIR="/storage/strf"

DEPS="rtl_biast rtl_sdr rffft"

# Check commandline variables:

if [ -z "${DEVICE}" ] || [ -z "${FREQ}" ] || [ -z "${DURATION}" ]; then
	echo "--------------------------------------------------------------------------------"
	echo "Error   : Commandline parameters are missing"
	echo "Usage   : <device> <frequency> <duration>"
	echo "Example : 0(vhf)/1(uhf) 437e6 10m"
	exit 1
fi

# Check dependencies:

for check in "${DEPS}"
do
	if [ -z "$(command -v "${check}")" ]; then
        echo "dependency failure, install package ${check} and retry."
		exit 1
	fi
done

# Set PPM value based on device command line input:

case ${DEVICE} in
	"0")
		echo "Using device id 0 (VHF)"
		PPM="-1.139"
		RFCS="20"
		RATE="256000"
	;;
	"1")
		echo "Using device id 1 (UHF)"
		PPM="-0.812"
		RFCS="50"
	;;
	*)
		PPM="0"
	;;
esac

cd ${WORKINGDIR} || exit

if [ "${BIAS}" = "1" ]; then
	echo "Enabling Bias Tee"
	rtl_biast -d ${DEVICE} -b 1 
	sleep 2
fi

if [ ! -p "${FIFO}" ]; then
	echo "Create ${FIFO}"
	mkfifo "${FIFO}"
fi

# Start STRF channelizer
nice -10 "${RFFFT}" -i "${FIFO}" -p "${WORKINGDIR}"/data -f "${FREQ}" -s "${RATE}" -q -c "${RFCS}" -F char &

# Start writing SDR RX samples to fifo
nice -10 "${RTLSDR}" -d "${DEVICE}" -s "${RATE}" -g "${GAIN}" -f "${FREQ}" -p "${PPM}" "${FIFO}" &

RTL_PID=$!

# Sleep for the time specified
sleep "${DURATION}"

# Kill the rtl_sdr capture
kill "${RTL_PID}"

if [ "${BIAS}" = "1" ]; then
	echo "Disable Bias Tee"
	rtl_biast -d ${DEVICE} -b 0 
	sleep 2
fi

