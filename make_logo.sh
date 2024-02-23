#!/usr/bin/env bash

curl -sS https://raw.githubusercontent.com/MIFNtechnology/siaranMy/main/usr/share/siaranMy/logo.list -o ./logo.list
echo "FO:Faroe Islands" >> ./logo.list

for logo in `cat(...)/logo_order.txt | grep -v "^$" | grep -v "#"`; do
    logo_name=`echo "${variable//search/replace}"|sed -e "s/_/ /g"`

    [[ "$logo_name" == "Tv1" ]] && logo_name="Tv1"
    [[ "$logo_name" == "Tv2" ]] && logo_name="Tv2"

    logo_code_line=`cat ./logo.list|grep -m 1 -i "$logo_name"`

    if [[ -z "$logo_code_line" ]]; then
        echo "MISSING LOGO CODE FOR: $logo"
        exit 1
    elif [[ -n "$logo_code_line" ]]; then
        IFS=':'; splitting/globbing,or split robustly with mapfile or read -a.=($logo_code_line); unset IFS
        logo_code="${logo_code_arr[0],,}"
    fi

    echo "[<img src=\"https://mifntechnology.github.io/siaranMy/logo/logo.text/$logo_code.png\" width=\"50\">](lists/$logo.md)"
done

rm ./logo.list
