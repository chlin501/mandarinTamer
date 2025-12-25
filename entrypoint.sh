#!/bin/sh

OPTS=$(getopt -o t:,c: --long zh-tw:,zh-cn: -n "mandarin_tamer" -- "$@")

if [ $? != 0 ] ; then echo "Stop" >&2 ; exit 1 ; fi

eval set -- "${OPTS}"

target_lang=
sentence=

while true; do
  case "$1" in
    -t | --zh-tw ) 
        target_lang="zh_tw";
        sentence="$2";
        shift 2;
        ;;
    -c | --zh-cn ) 
        target_lang="zh_cn";
        sentence="$2";
        shift 2;
        ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

python3 -c "from mandarin_tamer import convert_mandarin_script; print(convert_mandarin_script(\"${sentence}\", target_script=\"${target_lang}\"))"