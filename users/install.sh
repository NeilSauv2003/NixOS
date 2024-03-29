cd users/
res=$(ls -d */ 2> /dev/null 1> /dev/null; echo $?)

if [ $res != "0" ]
then
    mkdir "$NAME_USER"
fi

maj="$NAME_USER"
maj=$(echo "$maj" | sed 's/./\u&/')

sed -e "s/USER_NAME/$NAME_USER/g" -e "s/USER_MAJ/$maj/g" "../builder/home.nix" > "$NAME_USER/home.nix"

cd ..
