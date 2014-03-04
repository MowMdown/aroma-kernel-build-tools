#! /usr/bin/python

# This will generate the kerneltools-build-config needed by the Builder

import fileinput
import sys
import os
import commands

# Getting the Device Spec's

def devicespec():
  cross_compile   = raw_input('\nCROSS_COMPILE=~/')
  local_build_dir = raw_input('LOCAL_BUILD_DIR=~/')
  target_dir      = raw_input('TARGET_DIR=~/')
  partition       = raw_input('SYSTEM_PARTITION=/dev/block/mmcblk0p')
  defconfig       = raw_input('DEFCONFIG=')
  cores           = raw_input('N_CORES=')
  version         = raw_input('VERSION=')

# Print the Device Spec's

  print '\n=====================================\n'
  print 'CROSS_COMPILE=~/' + cross_compile
  print 'HOST_CC=gcc'
  print 'LOCAL_BUILD_DIR=~/' + local_build_dir 
  print 'TARGET_DIR=~/' + target_dir
  print 'SYSTEM_PARTITION=\"/dev/block/mmcblk0p' + partition + '\"'
  print 'DEFCONFIG=' + defconfig
  print "\nFLASH_BOOT='write_raw_image(\"/tmp/boot.img\", \"boot\")'"
  print '\n# ----\n'
  print 'N_CORES=' + cores
  print 'VERSION=' + version
  print '\n# ----\n\n'
  print 'BANNER=`cat <<EOF'
  print 'ui_print("**********************************************");'
  print 'ui_print("*                                            *");'
  print 'ui_print("  VERSION: ' + version + '                    ");'
  print 'ui_print("*                                            *");'
  print 'ui_print("**********************************************");'
  print 'EOF`'
  print '\n=====================================\n'

# Generate kerneltools-build-config file

  input = raw_input('\nDoes this Look Correct? y/n? ')
  if input != 'y':
    main()
  else:
    new_file = 'kerneltools-build-config'

    outfile = open(new_file, 'w')
    outfile.write('CROSS_COMPILE=~/' + cross_compile +
                  '\nHOST_CC=gcc' +
                  '\nLOCAL_BUILD_DIR=~/' + local_build_dir +
                  '\nTARGET_DIR=~/' + target_dir +
                  '\nSYSTEM_PARTITION=\"/dev/block/mmcblk0p' + partition + '\"' +
                  '\nDEFCONFIG=' + defconfig +
                  "\n\nFLASH_BOOT='write_raw_image(\"/tmp/boot.img\", \"boot\")'" +
                  '\n\n# ----' +
                  '\n\nN_CORES=' + cores +
                  '\nVERSION=' + version +
                  '\n\n# ----\n\n' +
                  'BANNER=`cat <<EOF\n' +
                  'ui_print("**********************************************");\n' +
                  'ui_print("*                                            *");\n' +
                  "ui_print("  'VERSION:  $VERSION'                        ");\n" +
                  'ui_print("*                                            *");\n' +
                  'ui_print("**********************************************");\n' +
                  'EOF`')
    outfile.close()

    if os.path.isdir(local_build_dir):
        commands.getstatusoutput('mv ' + new_file + ' ~/' + local_build_dir)
    else:
        commands.getstatusoutput('mkdir ' + '~/' + local_build_dir)
        commands.getstatusoutput('mv ' + new_file + ' ~/' + local_build_dir)

    print '\nSaved config file to: ' + '~/' + local_build_dir + '/' + new_file

# Open directory containing source

    input1 = raw_input('\nOpen top level directory of kernel source? y/n? ')
    if input1 != 'y':
	exit()
    else:
	commands.getstatusoutput('xdg-open ' + '~/' + local_build_dir)

def main():
  devicespec()
  exit()

if __name__ == '__main__':
  main()
