#!/usr/bin/env bash

widocoJarFile="widoco-with-dependencies.jar"

function downloadWidoco() {
    if [ ! -f $widocoJarFile ]; then
        curl -L https://github.com/dgarijo/Widoco/releases/download/v1.4.13/widoco-1.4.13-jar-with-dependencies.jar >$widocoJarFile
    fi
}

function executeWidoco() {
    local ontologyFile=$1
    local ontologyOutputFolder=$2
    local ontologyConfigFile=$3

    java -jar $widocoJarFile \
        -ontFile $ontologyFile \
        -outFolder $ontologyOutputFolder \
        -confFile $ontologyConfigFile \
        -oops \
        -rewriteAll \
        -saveConfig $ontologyConfigFile \
        -htaccess \
        -webVowl \
        -licensius
}

function main() {
    local vocabFile="ontology.ttl"
    local outputFolder="./public/"
    local configFile="era-widoco.conf"

    executeWidoco $vocabFile $outputFolder $configFile
}

downloadWidoco
main
rm ./public/ontology.ttl
cp ontology.ttl ./public/