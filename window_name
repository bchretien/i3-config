#!/bin/bash

# Maximum length of the output string
MAX_STR_SIZE=${BLOCK_INSTANCE:-40}

# Get the window name
output=`xprop -id $(xdotool getactivewindow) | grep 'WM_NAME(STRING)' | \
  cut -d'"' -f2`

# Crop the name if needed
str_size=$((`echo ${output} | wc -m` - 1))
if [[ ${str_size} -gt ${MAX_STR_SIZE} ]]; then
  output="`echo ${output} | cut -c1-$((${MAX_STR_SIZE}-1))`…"
elif [[ ${str_size} -eq 0 ]]; then
  # Empty strings (or whitespaces) lead to a separator being displayed,
  # so when that happens, let's be cool instead.
  output="(>'-')> <('-'<) ^('-')^ <('-'<) (>'-')>"
fi

echo ${output} | iconv -t utf-8 || true

