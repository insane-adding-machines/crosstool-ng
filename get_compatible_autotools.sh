if ! (-r autoconf-2.65.tar.gz); then 
    wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.65.tar.gz
    tar xf autoconf-2.65.tar.gz
    cd autoconf-2.65
    ./configure --prefix=`pwd`/../cmd
    make
    sudo make install
    cd ..
fi
if ! (-r automake-1.12.tar.gz); then 
    wget http://ftp.gnu.org/gnu/automake/automake-1.12.tar.gz
    tar xf automake-1.12.tar.gz
    cd automake-1.12
    ./configure --prefix=`pwd`/../cmd
    make
    sudo make install
fi
