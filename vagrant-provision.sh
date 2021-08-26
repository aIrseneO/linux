#! /bin/bash

################################################################################
#     Copyright (c) 2021 Arsene Temfack                                        #
#                                                                              #
#     SPDX-License-Identifier: MIT                                             #
################################################################################

bash /vagrant/vim.sh /vagrant/conf.d
sudo -H -u vagrant bash -c "bash /vagrant/vim.sh /vagrant/conf.d"
bash /vagrant/bash.sh /vagrant/conf.d
sudo -H -u vagrant bash -c "bash /vagrant/bash.sh /vagrant/conf.d"
