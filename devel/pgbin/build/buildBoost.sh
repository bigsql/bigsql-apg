
pushd /tmp
wget http://sourceforge.net/projects/boost/files/boost/1.73.0/boost_1_73_0.tar.gz/download -O boost_1_73_0.tar.gz
tar xzf boost_1_73_0.tar.gz
pushd boost_1_73_0
./bootstrap.sh --with-libraries=atomic,chrono,system,thread,test
sudo ./b2 cxxflags="-fPIC" install
popd
popd

