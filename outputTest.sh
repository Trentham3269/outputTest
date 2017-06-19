#!/bin/bash
#
# This script returns any mismatch between the output slots and outputIds defined in a Shiny 
# application

# Return list of output ids from ui file and print message
grep "outputId" "ui.R" | awk -F'"' '{print $2}' | sort -f | uniq >| TMP_id_lst.txt
num_id=$(wc -l < "TMP_id_lst.txt")
echo Your ui file currently has $num_id outputIds defined

# Return list of output slots from server and print message
grep "output\\$" "server.R" | awk -F'\$' '{print $2}' | awk -F'<-' '{print $1}' \
| sort -f | uniq >| TMP_slt_lst.txt
num_slt=$(wc -l < "TMP_slt_lst.txt")
echo Your server file currently has $num_slt output slots defined

# Determine differences between files and return list as message
if [ $num_slt > $num_id ] 
  then comm -23 TMP_slt_lst.txt TMP_id_lst.txt >| TMP_diff.txt
       echo The following output slots in server.R are not defined in ui.R:
       awk '{print "output$"$0}' TMP_diff.txt
  else comm -23 TMP_id_lst.txt TMP_slt_lst.txt >| TMP_diff.txt
       echo The following outputIds in ui.R are not defined in server.R:
       awk '{print "outputId = "$0}' TMP_diff.txt
fi

# Clean up temp. files from directory
rm -f TMP*
