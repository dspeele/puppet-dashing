class dashing {

    package { 'install_dashing':
        ensure   => 'installed',
        provider => 'gem'
    }  
  
    exec { 'create_dashing_dashboard':
        command => 'dashing new hbc_status',
        require => Package['install_dashing']
    }

    exec { 'install_dashing_gems':
        command => 'bundle',
        cwd => '/home/vagrant/hbc_status',
        require => Exec['create_dashing_dashboard']
    }

    exec { 'start_dashing':
        command => 'dashing start',
        require => Exec['install_dashing_gems']
    }

}
