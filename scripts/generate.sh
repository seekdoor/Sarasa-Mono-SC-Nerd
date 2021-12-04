#!/bin/bash

./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-bold.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-bolditalic.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-extralight.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-extralightitalic.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-italic.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-light.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-lightitalic.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-regular.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-semibold.ttf
./font-patcher -l --powerline --powerlineextra --fontawesome --fontawesomeextension --fontlogos --octicons ./sarasa/sarasa-mono-sc-semibolditalic.ttf

fix () {
  original_font=$1
  patched_font=$2

  ttx -o "$original_font.ttx" -t "OS/2" $original_font
  ttx -o "$patched_font.ttx" -t "OS/2" $patched_font

  original_x_avg_char_width="$(grep xAvgCharWidth "$original_font.ttx" | cut -d '"' -f 2)"
  echo original xAvgCharWidth is $original_x_avg_char_width

  sed -i "" -E "s/xAvgCharWidth value=\"[0-9]+\"/xAvgCharWidth value=\"${original_x_avg_char_width}\"/g" \
    "$patched_font.ttx"

  ttx -o ${patched_font/.ttf/.after.ttf} -m $patched_font "$patched_font.ttx"
	rm $patched_font
	mv ${patched_font/.ttf/.after.ttf} $patched_font
}

fix ./sarasa/sarasa-mono-sc-bold.ttf             ./sarasa/sarasa-mono-sc-nerd-bold.ttf
fix ./sarasa/sarasa-mono-sc-bolditalic.ttf       ./sarasa/sarasa-mono-sc-nerd-bolditalic.ttf
fix ./sarasa/sarasa-mono-sc-extralight.ttf       ./sarasa/sarasa-mono-sc-nerd-extralight.ttf
fix ./sarasa/sarasa-mono-sc-extralightitalic.ttf ./sarasa/sarasa-mono-sc-nerd-extralightitalic.ttf
fix ./sarasa/sarasa-mono-sc-italic.ttf           ./sarasa/sarasa-mono-sc-nerd-italic.ttf
fix ./sarasa/sarasa-mono-sc-light.ttf            ./sarasa/sarasa-mono-sc-nerd-light.ttf
fix ./sarasa/sarasa-mono-sc-lightitalic.ttf      ./sarasa/sarasa-mono-sc-nerd-lightitalic.ttf
fix ./sarasa/sarasa-mono-sc-regular.ttf          ./sarasa/sarasa-mono-sc-nerd-regular.ttf
fix ./sarasa/sarasa-mono-sc-semibold.ttf         ./sarasa/sarasa-mono-sc-nerd-semibold.ttf
fix ./sarasa/sarasa-mono-sc-semibolditalic.ttf   ./sarasa/sarasa-mono-sc-nerd-semibolditalic.ttf

rm -rf ./sarasa/*.ttx ./sarasa/*.bak


