aug filetype_setup
  au!
  au FileType * let &l:syntax = &syntax . '.tomdoc'
aug END
