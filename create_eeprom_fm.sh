# set -x
bin_dir=bin
hex2bix_dir=/c/Cypress/USB/CY3684_EZ-USB_FX2LP_DVK/1.1/Bin
hex2bix=$hex2bix_dir/hex2bix.exe
first_byte=0xC2
VID=0x0456
PID=0xB403
file_name_hex=$(find -name adf*.hex)

cp $file_name_hex $bin_dir
cd $bin_dir
file_name_hex=$(basename $file_name_hex)
file_name_iic=$(basename $file_name_hex .hex).iic
$hex2bix -F $first_byte -V $VID -P $PID -i $file_name_iic $file_name_hex
cd ..