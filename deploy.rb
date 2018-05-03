#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'

## VARS ##

DESTINATION = "#{Dir.home}/"

ATOM_HOME = Pathname.new(File.expand_path("#{Dir.home}/.atom"))

apps = %w[
  lightdm
  lightdm-slick-greeter
  dunst
  pcmanfm
  menumaker
  compton-git
  icewm2
  network-manager-applet
  networkmanager
  gvfs
  ffmpegthumbnailer
  evince
  xterm
  rxvt-unicode
  fileroller
  sxhkd
  tumbler
  atom
  qutebrowser
  google-chrome
  polkit-gnome
  udisks2
  udiskie
  mousepad
  emacs
  clang
  slime
  ttf-all-the-icons
  screenfetch
  zsh
  irssi
  j4-dmenu-desktop
  xorg
  xonsh
  vlc
  termite
]

atom_packages = %w[
  atom-runner
  ruby-block-converter
  toggle-quotes
  linter-ruby
  color-picker
  ruby-block
  aesthetic-ui
  redmond-syntax
  emmet
  pigments
  atom-beautify
  file-icons
  minimap
]

## METHODS AND FUNCTIONS ##

def make_spacemacs
status = system("git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d")
puts status ? "Success" : "Failed" 
end

install = ->app{ `trizen -Syu --noconfirm #{app}` }
apm_install = ->app{ `apm install #{app}` }

## MAIN ##

FileUtils.mkdir_p("#{ATOM_HOME}", :verbose => true) unless Dir.exist?(ATOM_HOME)
atom_packages.each &apm_install
puts "Atom is ready for Ruby development!"
#make_spacemacs
Dir.glob("#{Dir.home}/icewm/.", File::FNM_DOTMATCH).each { |f| FileUtils.cp_r("#{f}", DESTINATION, :verbose => true) }

apps.each &install
atom_packages.each &apm_install
