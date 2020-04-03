#!/bin/sh

title=$2
len=$(echo -n $2 | wc -m)
if [ $len -gt 31 ]; then
  # Using colrm because it handles UTF-8 better than cut
  title="$(echo -n $2 | colrm 30)…"
fi

# Try to filter out album name
artist=$(perl -pe 's|(.*) - .*|\1|' <<< $3)
len=$(echo -n $artist | wc -m)
if [ $len -gt 31 ]; then
  artist="$(echo -n $artist | colrm 30)…"
fi

# HTML escapes
artist=$(sed -e 's/&/\&amp;/; s/"/\&quot;/; s/</\&lt;/; s/>/\&gt;/;' <<< $artist)
title=$(sed -e 's/&/\&amp;/; s/"/\&quot;/; s/</\&lt;/; s/>/\&gt;/;' <<< $title)

echo "$title — $artist" > /tmp/spotifylog
