#!/usr/bin/env bash
set -euo pipefail

cat << EOF > "manifest.vdf"
"workshopitem"
{
	"appid" "107410"
	"contentfolder" ""
	"changenote" "Initial version"
	"visibility" "2"
	"title" "Test mod"
	"description" "Test mod"
}
EOF

APPID=$(steamcmd +login $1 +workshop_build_item "`pwd`/manifest.vdf" +quit | sed -n 's/^.*PublishFileID \(.*\)).*$/\1/p')
echo $APPID

rm manifest.vdf
