AUTHOR = "Christophe Delord"
DATE = os.date("%a %b %e, %Y", sh "git log -1 --format=%ct 2>/dev/null || date +%s")
