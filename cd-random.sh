#!/bin/zsh
cd_random() {
    RANDOM_NUMBER=$RANDOM
    DIR="/tmp/$RANDOM_NUMBER"
    mkdir -p "$DIR" && cd "$DIR"
}
