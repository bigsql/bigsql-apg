
apt --version 1> /dev/null 2> /dev/null
rc=$?

if [ `uname` == "Linux" ]; then
  if [ "$rc" == "0" ]; then
    lib64=/usr/lib/`arch`-linux-gnu
  else
    lib64=/usr/lib64/
  fi
elif [ `uname` == "Darwin" ]; then
  lib64=/usr/local/lib
else
  echo "ERROR: Invalid Operating System."
  exit 1
fi 

shared_lib=/opt/pgbin-build/pgbin/shared/lib/
mkdir -p $shared_lib
rm -f $shared_lib/*

##cp -v /lib/`arch`-linux-gnu/liblzma.so.5        $shared_lib/.
##cp -v /lib/`arch`-linux-gnu/libz.so.1           $shared_lib/.
##cp -v /lib/`arch`-linux-gnu/libssl.so.1.0.0     $shared_lib/.
##cp -v /lib/`arch`-linux-gnu/libcrypto.so.1.0.0  $shared_lib/.
##cp -v /lib/`arch`-linux-gnu/libbsd.so.0         $shared_lib/.
##cp -v /lib/`arch`-linux-gnu/libc.so.6           $shared_lib/.
##cp -v /lib64/ld-linux-x86-64.so.2               $shared_lib/.
cp -v $lib64/libz*           $shared_lib/.
cp -v $lib64/libssl*         $shared_lib/.
cp -v $lib64/libcrypto*      $shared_lib/.
cp -v $lib64/libkrb5*        $shared_lib/.
cp -v $lib64/libgssapi*      $shared_lib/.
cp -v $lib64/libldap*        $shared_lib/.
cp -v $lib64/libedit*        $shared_lib/.
cp -v $lib64/libxml2*        $shared_lib/.
cp -v $lib64/libxslt*        $shared_lib/.
cp -v $lib64/liblber*        $shared_lib/.
cp -v $lib64/libsasl2*       $shared_lib/.
cp -v $lib64/libevent*       $shared_lib/.
cp -v $lib64/libicuuc*       $shared_lib/.
cp -v $lib64/libicudata*      $shared_lib/.
cp -v $lib64/libuv*          $shared_lib/.
cp -v $lib64/libpython3.?m.so.1.0   $shared_lib/.
#cp -v $lib64/libcassandra.so.2   $shared_lib/.

rm -f $shared_lib/*.a

