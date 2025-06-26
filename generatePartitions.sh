#!/bin/bash
parts="
odm
product
system
system_ext
vendor
vendor_dlkm
system_dlkm
mi_ext"

a=""
for i in $(echo $parts); do
    if [[ -f "$i.img" ]]; then
        a+=" $i"
    fi
done

sed -i "5i\super_qti_dynamic_partitions_partition_list=$a" "META/dynamic_partitions_info.txt"

sed -i 's/super_qti_dynamic_partitions_partition_list= /super_qti_dynamic_partitions_partition_list=/g' "META/dynamic_partitions_info.txt"
