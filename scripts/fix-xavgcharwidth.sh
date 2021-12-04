#!/bin/bash

fix () {
  filename=$1

  ttx -o "$filename.ttx" -t "OS/2" $filename
  sed -i "s/xAvgCharWidth value=\"[0-9]\+\"/xAvgCharWidth value=\"500\"/" "$filename.ttx"
  ttx -o ${filename/.ttf/.after.ttf} -m $filename "$filename.ttx"
  rm "$filename.ttx"
}

fix ./sarasa/sarasa-mono-sc-nerd-bold.ttf
fix ./sarasa/sarasa-mono-sc-nerd-bolditalic.ttf
fix ./sarasa/sarasa-mono-sc-nerd-extralight.ttf
fix ./sarasa/sarasa-mono-sc-nerd-extralightitalic.ttf
fix ./sarasa/sarasa-mono-sc-nerd-italic.ttf
fix ./sarasa/sarasa-mono-sc-nerd-light.ttf
fix ./sarasa/sarasa-mono-sc-nerd-lightitalic.ttf
fix ./sarasa/sarasa-mono-sc-nerd-regular.ttf
fix ./sarasa/sarasa-mono-sc-nerd-semibold.ttf
fix ./sarasa/sarasa-mono-sc-nerd-semibolditalic.ttf
