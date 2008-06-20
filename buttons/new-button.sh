file="output.png"
text="Button"

usage() {
  echo "usage $0 [-t text] [-o fichier]"
}

while [[ $# -ge 1 ]]; do
  case $1 in
    "-t")
      text=$2; shift;;
    "-o")
      file=$2; shift;;
    "-h" | "--help")
      usage; exit 0;;
    *)
      echo " : $1 option non valide";
      usage; exit 1;;
  esac
  shift
done

if [[ ! $file || ! $text ]]; then
  usage
  exit 1
fi

font="-*-utopia-bold-*-*-*-14-*-*-*-*-*-*-*"
ULC=$(printf "'(%d %d %d)" 0x12 0xb1 0x0a)
LRC=$(printf "'(%d %d %d)" 0xc6 0xf8 0xbc)
TC=$(printf "'(%d %d %d)" 0x0 0x0 0x0)

echo $file
gimp -i -b "(script-fu-button00 \"$text\" 14 \"$font\" $ULC $LRC $TC 1.0 3.0 FALSE)"\
           "(gimp-image-merge-visible-layers 1 0)"\
           "(file-png-save2 TRUE 1 (car (gimp-image-get-active-drawable 1)) \"$file\" \"\" FALSE 9 FALSE FALSE FALSE FALSE FALSE TRUE TRUE)"\
           "(gimp-quit 1)"

