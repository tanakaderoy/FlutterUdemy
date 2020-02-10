for D in *; do
    if [ -d "${D}" ]; then
        echo "${D}"
        cd ${D}
        rm -rf .git*
        cd ../
          # your processing here
    fi
done
