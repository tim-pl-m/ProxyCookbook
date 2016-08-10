if [ $color = auto ]; then
  if [ -t 1 ]; then color=yes; else color=no; fi
fi
bundle install