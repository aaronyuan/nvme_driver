1. Introduction
2. Requirements
3. How to compile and install



NVMe driver

1. Introduction

This driver is used when there is no inbox NVMe driver in some of former systems.

To clone NVMe driver from:
https://github.com/aaronyuan/nvme_driver.git

2. Requirements
    1. Gcc
    2. Inbox kernel source
        a. On CentOS:
           Please make sure /lib/modules/`uname -r`/build is not empty.
           If it's empty, find your according kernel-devel package on http://vault.centos.org/(your_centos_system_version)/os/x86_64/Packages/ and install it.
           Take CentOS 6.4 for example:
           #wget http://vault.centos.org/6.4/os/x86_64/Packages/kernel-devel-2.6.32-358.el6.x86_64.rpm
           #yum install kernel-devel-2.6.32-358.el6.x86_64.rpm

3. How to compile and install
    a. clone the above git repository.
    b. cd /(your_path_to_nvme_driver/nvme_driver.
    c. make
    d. make install
