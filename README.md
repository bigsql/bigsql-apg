# BIGSQL-APG

## Xenial 16.04 setup #################################
APT="sudo apt -y"
$APT update
$APT upgrade

$APT install sqlite3 git python3
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python3 get-pip.py
sudo pip3 install awscli

$APT install openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin

$APT install build-essential flex bison
$APT install zlib1g-dev libxml2-dev libxslt-dev libreadline-dev libssl-dev

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main"
sudo apt-get update
sudo apt-get install -y clang-6.0


## EL8 setup ###########################################

```
YUM="sudo yum -y"
$YUM update

$YUM install git python3 python3-pip net-tools wget

sudo pip3 install awscli

$YUM install java-1.8.0-openjdk java-1.8.0-openjdk-devel
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

$YUM groupinstall 'Development Tools'

$YUM install readline-devel zlib-devel openssl-devel \
  libxml2-devel libxslt-devel sqlite-devel \
  pam-devel openldap-devel python3-devel libcurl-devel \
  unixODBC-devel llvm-devel clang-devel chrpath \
  docbook-dtds docbook-style-xsl cmake \
  perl-ExtUtils-Embed libevent-devel postgresql-devel

$YUM remove docker docker-client docker-client-latest \
  docker-common docker-latest docker-latest-logrotate \
  docker-logrotate docker-engine
$YUM install yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
$YUM install docker-ce containerd.io --nobest
sudo systemctl enable docker
sudo systemctl restart docker

sudo mkdir /opt/pgbin-build
sudo chmod 777 /opt/pgbin-build
sudo chown $USER:$USER /opt/pgbin-build
mkdir /opt/pgbin-build/pgbin
mkdir /opt/pgbin-build/pgbin/bin
sudo mkdir /opt/pgcomponent
sudo chmod 777 /opt/pgcomponent
sudo chown $USER:$USER /opt/pgcomponent

mkdir ~/dev
cd ~/dev
mkdir in
mkdir out
mkdir apg_history

##################################################
export REGION=us-west-2
export BUCKET=s3://bigsql-apg-download

export DEV=$HOME/dev
export HIST=$DEV/apg_history
export IN=$DEV/in
export OUT=$DEV/out

export APG=$DEV/bigql-apg
export DEVEL=$APG/devel
export PG=$DEVEL/pg
export PGBIN=$DEVEL/pgbin

export SRC=$IN/sources
export BLD=/opt/pgbin-build/pgbin/bin

export CLI=$APG/cli/scripts
export PSX=$APG/out/posix
export REPO=http://localhost:8000

export PATH=$PATH:$JAVA_HOME/bin
##################################################

cd $BLD
cp -p $APG/devel/pgbin/build/* .

cd ~
mkdir .aws
cd .aws
vi config
chmod 600 config

cd $IN
cp $APG/devel/util/pull-s3.sh .
./pull-s3.sh
chmod 755 *.sh

```
