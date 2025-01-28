#!/bin/bash

UploadTag="AfterLife-"$(date +"%Y%m%d")""
ZipName="~/derp/out/target/product/earth/*.zip"
BootImg="~/derp/out/target/product/earth/boot.img"
Sha256sum="~/derp/out/target/product/earth/*.zip.sha256sum"

curl bashupload.com -T $ZipName
curl bashupload.com -T $BootImg
wget https://github.com/XeroMz69/Bebas/raw/refs/heads/main/github-release

    chmod +x github-release
    ./github-release release \
            --security-token $ghtoken \
            --user XeroMz69 \
            --repo XeroRelease \
            --tag "$UploadTag" \
            --description "$(date +"%Y%m%d")"
    
    ./github-release upload \
             --security-token $ghtoken \
             --user XeroMz69 \
             --repo XeroRelease \
             --tag "$UploadTag" \
             --name "$UploadTag" \
             --file "$ZipName" || fail="y"

    ./github-release upload \
             --security-token $ghtoken \
             --user XeroMz69 \
             --repo XeroRelease \
             --tag "$UploadTag" \
             --name "$UploadTag" \
             --file "$BootImg" || fail="y"

    ./github-release upload \
             --security-token $ghtoken \
             --user XeroMz69 \
             --repo XeroRelease \
             --tag "$UploadTag" \
             --name "$UploadTag" \
             --file "$Sha256sum" || fail="y"
