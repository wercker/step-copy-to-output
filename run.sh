type rsync || { sudo apt-get update ; sudo apt-get install rsync; }

export exclude_parameters=""

for x in $WERCKER_COPY_TO_OUTPUT_EXCLUDE
do
    export exclude_parameters="$exclude_parameters --exclude=$x "
done

echo "rsync -rv $exclude_parameters $WERCKER_ROOT/ $rsync"
rsync -rv $exclude_parameters "$WERCKER_ROOT/" "$WERCKER_OUTPUT_DIR"
