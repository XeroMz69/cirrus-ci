#!/bin/bash

UploadTag="DerpFest-"$(date +"%Y%m%d")""
ZipName="~/derp/out/target/product/earth/DerpFest*.zip"
BootImg="~/derp/out/target/product/earth/boot.img"
Sha256sum="~/derp/out/target/product/earth/DerpFest*.zip.sha256sum"

    chmod +x github-release
    ./github-release release \
            --security-token "$GIT_SECRET_MAIN" \
            --user XeroMz69 \
            --repo XeroRelease \
            --tag "$UploadTag" \
            --description "$(date +"%Y%m%d")"
    
    ./github-release upload \
             --security-token "$GIT_SECRET_MAIN" \
             --user XeroMz69 \
             --repo XeroRelease \
             --tag "$UploadTag" \
             --name "$UploadTag" \
             --file "$ZipName" || fail="y"

    ./github-release upload \
             --security-token "$GIT_SECRET_MAIN" \
             --user XeroMz69 \
             --repo XeroRelease \
             --tag "$UploadTag" \
             --name "$UploadTag" \
             --file "$BootImg" || fail="y"

    ./github-release upload \
             --security-token "$GIT_SECRET_MAIN" \
             --user XeroMz69 \
             --repo XeroRelease \
             --tag "$UploadTag" \
             --name "$UploadTag" \
             --file "$Sha256sum" || fail="y"
