#!/usr/bin/perl

#terrencehan (isterrence@gmail.com)

use strict;
use warnings;
use File::Copy;
use File::Basename;
use File::Spec;
use Cwd qw/abs_path/;

my $dir_path     = dirname( abs_path($0) );
my $vimrc_path   = File::Spec->catfile( $dir_path, '.vimrc' );
my $my_home_path = File::Spec->catfile( '/home', getlogin );
my $target_path  = File::Spec->catfile( $my_home_path, '.vimrc' );

if ( !-e $target_path ) {
    `ln -s $vimrc_path $target_path`;
    print "ln -s done\n";
}

if ( !-e File::Spec->catfile( $my_home_path, '.vim', 'bundle', 'vundle' ) ) {

    my $t = `git --version | awk '{print \$1}'`;
    chomp $t;

    if ( $t eq 'git' ) {
        `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`;
    }
    else {
        print "git is not installed\n";
    }
    print "git clone vundle done\n";

}

my $colors_dir_path = File::Spec->catfile( $my_home_path, '.vim', 'colors' );
if ( !-e $colors_dir_path ) {
    mkdir($colors_dir_path);
    copy( 'colors/jellybeans.vim', $colors_dir_path );
    print "copy color scheme done\n";
}

