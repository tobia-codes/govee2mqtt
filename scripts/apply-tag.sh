#!/bin/sh
# Dieses Skript aktualisiert die Version in der config.yaml
# basierend auf dem aktuellen Git-Zeitstempel/Hash

TAG_NAME=${TAG_NAME:-$(git -c "core.abbrev=8" show -s "--format=%cd-%h" "--date=format:%Y.%m.%d")}

# Wir suchen nach der Zeile, die mit 'version:' beginnt, 
# und ersetzen alles dahinter durch den neuen TAG_NAME in Anführungszeichen.
sed -i "s/^version:.*/version: \"$TAG_NAME\"/" addon/config.yaml