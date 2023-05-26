#!/bin/bash

MINECRAFT_VERSIONS=(
    "1.19.4"
    "1.19.3"
    "1.19.2"
    "1.19.1"
    "1.18.2"
    "1.18.1"
    "1.17.1"
)

mkdir tmp

for version in "${MINECRAFT_VERSIONS[@]}"; do
    echo "Build version $version"
    builds_url=https://api.papermc.io/v2/projects/paper/versions/${version}/builds
    echo "Fetching $builds_url"
    version_json=$(curl -s -X 'GET' \
        "https://api.papermc.io/v2/projects/paper/versions/$version/builds" \
        -H 'accept: application/json')
    build_id=$(echo "$version_json" | jq -r '.builds[0].build')
    build_file=$(echo "$version_json" | jq -r '.builds[0].downloads.application.name')
    build_url="https://api.papermc.io/v2/projects/paper/versions/$version/builds/$build_id/downloads/$build_file"

    build_file="tmp/$build_file"
    if [ -f "$build_file" ]; then
        echo "File $build_file exists"
    else
        echo "Downloading jar from $build_url"
        wget -q "$build_url" -O "tmp/$build_file"
    fi

    container_tag=papermc:$version-$build_id
    echo "Building container tagged as $container_tag"

    docker build -t "$container_tag" . --build-arg PAPER_FILE="tmp/$build_file"
done
