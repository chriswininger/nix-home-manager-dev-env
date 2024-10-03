creoted using https://dev.to/synecdokey/nix-on-macos-2oj3

## Burning with k3b

I had a lot of trouble making this work, it's currently
installed at the system level in configuration.nix but that
doesn't matter I have the same problems no matter how I install it.

In a previous install of NixOS I was able to get it to work by running
with sudo, but for some reason this time around that causes a cascade of
other errors, probably because many packages were installed just for my
normal user account with home-manager.

The way I have gotten it to work so far is following this advice:


https://github.com/NixOS/nixpkgs/issues/19154#issuecomment-647005545

https://github.com/NixOS/nixpkgs/issues/19154#issuecomment-647045107

I mounted the nix/store to read only, probably a pretty bad thing to do

mount -o remount,rw /nix/store

I then opened k3b (normal use) and navigated to settings, programs, permissions as shown in the linked screen shot

The program could not set the permission its self but it clearly shows what the permissions are and what it wants them to be.

From there I went through and used the cli to sudo chmod/chown until they looked like what k3b expects. A few files would not change. In particular 
sudo chmod 0710 /etc/profiles/per-user/chris/bin/wodim, but in the initail programs menu you can select different options for programs. I was able to check
the box for cdrecorder in place of wodim :shrug:. After that I was able to burn a cd no errors.

Will this all break next time I rebuild... probably :-(

