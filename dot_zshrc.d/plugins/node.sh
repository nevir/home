# Ensure that local node_modules are available on the path, as well as working up the ancestry chain.
path=(
  ./node_modules/.bin
  ../node_modules/.bin
  ../../node_modules/.bin
  ../../../node_modules/.bin
  ../../../../node_modules/.bin
  ../../../../../node_modules/.bin
  $path
)
