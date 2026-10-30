#!/bin/sh
id=$(/usr/bin/modetest -M amdgpu -c|/usr/bin/rg '^(\d+)\s+\d+\s+connected' -o -r '$1')
/usr/bin/modetest -M amdgpu -w "$id:Broadcast RGB:1"
